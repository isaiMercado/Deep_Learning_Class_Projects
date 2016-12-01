# Import what we need
import os
import sys
import numpy as np
import scipy.io
import scipy.misc
import tensorflow as tf 
from PIL import Image

HOME = "/fslhome/misaie/tensorflow/deep_art"
#
#
#
#
#

EPOCHS = 1000
LEARNING_RATE = 2.0 #10
NOISE_RATIO = 0.0

ALPHA = 50 #5
BETA = 100 #100
GAMMA = 1

VGG_MODEL_PATH = HOME + '/model/imagenet-vgg-verydeep-19.mat'

CONTENT_IMAGE_PATH = HOME + '/input_images/isai1.jpg'
STYLE_IMAGE_PATH = HOME + '/input_images/painting2.jpg'

IMAGE_WIDTH = 200 #800
IMAGE_HEIGHT = 200 #600
COLOR_CHANNELS = 3


MEAN_VALUES = np.array([123.68, 116.779, 103.939]).reshape((1,1,1,3))

OUTPUT_IMAGE_NAME = 'isai1_painting2_Wnormal_noise' + str(NOISE_RATIO) + '_epochs' + str(EPOCHS) + '_train' + 'Only1Var' +'_LR' + str(LEARNING_RATE) + '_alpha' + str(ALPHA) + '_beta' + str(BETA) + '_gamma' + str(GAMMA) + '_imageSize' + str(IMAGE_WIDTH) 


STYLE_LAYERS = [
    'conv1_1',
    'conv2_1',
    'conv3_1',
    'conv4_1',
    'conv5_1',
]


W = [
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
]

CONTENT_LAYER = 'conv4_2'

#
#
#
#
#

def load_vgg_model(path):
    vgg = scipy.io.loadmat(path)
    vgg_layers = vgg['layers']
    
    
    def _weights(layer, expected_layer_name):
        wb = vgg_layers[0][layer][0][0][2]
        W = wb[0][0]
        b = wb[0][1]
        layer_name = vgg_layers[0][layer][0][0][0][0]
        assert layer_name == expected_layer_name
        return W, b


    def _relu(conv2d_layer):
        return tf.nn.relu(conv2d_layer)


    def _conv2d(prev_layer, layer, layer_name):
        W, b = _weights(layer, layer_name)
        W = tf.constant(W)
        b = tf.constant(np.reshape(b, (b.size)))
        return tf.nn.conv2d(prev_layer, filter=W, strides=[1, 1, 1, 1], padding='SAME') + b


    def _conv2d_relu(prev_layer, layer, layer_name):
        return _relu(_conv2d(prev_layer, layer, layer_name))


    def _avgpool(prev_layer):
        return tf.nn.avg_pool(prev_layer, ksize=[1, 2, 2, 1], strides=[1, 2, 2, 1], padding='SAME')


    graph = {}
    graph['input']   = tf.Variable(np.zeros((1, IMAGE_HEIGHT, IMAGE_WIDTH, COLOR_CHANNELS)), dtype = 'float32')
    graph['conv1_1']  = _conv2d_relu(graph['input'], 0, 'conv1_1')
    graph['conv1_2']  = _conv2d_relu(graph['conv1_1'], 2, 'conv1_2')
    graph['avgpool1'] = _avgpool(graph['conv1_2'])
    graph['conv2_1']  = _conv2d_relu(graph['avgpool1'], 5, 'conv2_1')
    graph['conv2_2']  = _conv2d_relu(graph['conv2_1'], 7, 'conv2_2')
    graph['avgpool2'] = _avgpool(graph['conv2_2'])
    graph['conv3_1']  = _conv2d_relu(graph['avgpool2'], 10, 'conv3_1')
    graph['conv3_2']  = _conv2d_relu(graph['conv3_1'], 12, 'conv3_2')
    graph['conv3_3']  = _conv2d_relu(graph['conv3_2'], 14, 'conv3_3')
    graph['conv3_4']  = _conv2d_relu(graph['conv3_3'], 16, 'conv3_4')
    graph['avgpool3'] = _avgpool(graph['conv3_4'])
    graph['conv4_1']  = _conv2d_relu(graph['avgpool3'], 19, 'conv4_1')
    graph['conv4_2']  = _conv2d_relu(graph['conv4_1'], 21, 'conv4_2')
    graph['conv4_3']  = _conv2d_relu(graph['conv4_2'], 23, 'conv4_3')
    graph['conv4_4']  = _conv2d_relu(graph['conv4_3'], 25, 'conv4_4')
    graph['avgpool4'] = _avgpool(graph['conv4_4'])
    graph['conv5_1']  = _conv2d_relu(graph['avgpool4'], 28, 'conv5_1')
    graph['conv5_2']  = _conv2d_relu(graph['conv5_1'], 30, 'conv5_2')
    graph['conv5_3']  = _conv2d_relu(graph['conv5_2'], 32, 'conv5_3')
    graph['conv5_4']  = _conv2d_relu(graph['conv5_3'], 34, 'conv5_4')
    graph['avgpool5'] = _avgpool(graph['conv5_4'])
    return graph

#
#
#
#
#


def get_filter(sess, model, layer_name):
    layer = model[layer_name]
    filter_ = sess.run(layer)
    return filter_

def get_filters(sess, model, layers_names):
    filters = []
    for layer_name in layers_names:
        filter_ = get_filter(sess, model, layer_name)
        filters.append(filter_)
    return filters
    
#
#
#
#
#


def content_loss_func(model, layer_name, content_image_filter):
    
    filter_height = content_image_filter.shape[1]
    filter_width = content_image_filter.shape[2]
    filter_count = content_image_filter.shape[3]
    filter_area = filter_height * filter_width
    normalizer = 1.0 / (4.0 * filter_count * filter_area)
    
    noise_image_filter = model[layer_name]
    substractions = content_image_filter - noise_image_filter
    squares = tf.pow(substractions, 2)
    square_error = tf.reduce_sum(squares)
    output = normalizer * square_error

    return output



def style_loss_func(model, style_layers, W, style_image_filters):

    def _gram_matrix(F, N, M):
        Ft = tf.reshape(F, (M, N))
        return tf.matmul(tf.transpose(Ft), Ft)


    def _style_loss(style_image_filter, noise_image_filter):
        filter_height = style_image_filter.shape[1]
        filter_width = style_image_filter.shape[2]
        filter_count = style_image_filter.shape[3]
        filter_area = filter_height * filter_width
        normalizer = 1.0 / (4.0 * filter_count * filter_area)
        
        gram_matrix_style_filter = _gram_matrix(style_image_filter, filter_count, filter_area)
        gram_matrix_noise_filter = _gram_matrix(noise_image_filter, filter_count, filter_area)
        
        substractions = gram_matrix_style_filter - gram_matrix_noise_filter
        squares = tf.pow(substractions, 2)
        square_error = tf.reduce_sum(squares)
        output = normalizer * square_error
        return output

    E = [_style_loss(style_image_filters[layer], model[style_layers[layer]]) for layer in range(len(style_layers))]
    loss = sum([W[layer] * E[layer] for layer in range(len(style_layers))])
    return loss



def totalVariation_loss_func(image):
    verticalVariation =   tf.square(image[:, :IMAGE_HEIGHT-1, :IMAGE_WIDTH-1, :] - image[:, 1:, :IMAGE_WIDTH-1, :])
    horizontalVariation = tf.square(image[:, :IMAGE_HEIGHT-1, :IMAGE_WIDTH-1, :] - image[:, :IMAGE_HEIGHT-1, 1:,:])
    normalization = tf.reduce_sum(tf.sqrt(horizontalVariation + verticalVariation)) #tf.pow(number, 1.25)
    return normalization
#
#
#
#
#

def generate_noise_image(content_image, noise_ratio = NOISE_RATIO):
    noise_image = np.random.uniform(-20, 20, (1, IMAGE_HEIGHT, IMAGE_WIDTH, COLOR_CHANNELS)).astype('float32')
    input_image = ((noise_ratio) * noise_image) + ((1 - noise_ratio) * content_image)
    return input_image

def load_image(path):
    image = scipy.misc.imread(path)
    image = scipy.misc.imresize(image, (IMAGE_HEIGHT, IMAGE_WIDTH, COLOR_CHANNELS))
    image = np.reshape(image, ((1,) + image.shape))
    image = image - MEAN_VALUES
    return image
    
def correct_image(image):
    image = image + MEAN_VALUES
    image = image[0]
    image = np.clip(image, 0, 255).astype('uint8')
    return image

def save_image(path, image):
    image = correct_image(image)
    scipy.misc.imsave(path, image)

#
#
#
#
#

model = load_vgg_model(VGG_MODEL_PATH)

content_image = load_image(CONTENT_IMAGE_PATH)
style_image = load_image(STYLE_IMAGE_PATH)
noise_image = generate_noise_image(content_image)

with tf.Session() as sess:
    sess.run(tf.initialize_all_variables())

    sess.run(model['input'].assign(content_image))
    content_image_filter = get_filter(sess, model, CONTENT_LAYER)

    sess.run(model['input'].assign(style_image))
    style_image_filters = get_filters(sess, model, STYLE_LAYERS)

model['input'].assign(noise_image)
content_loss = content_loss_func(model, CONTENT_LAYER, content_image_filter)
style_loss = style_loss_func(model, STYLE_LAYERS, W, style_image_filters)
normalization = totalVariation_loss_func(model['input'])

total_loss = ALPHA * content_loss + BETA * style_loss + GAMMA * normalization 
#train_step = tf.train.AdamOptimizer(LEARNING_RATE).minimize(total_loss, var_list=[model['input']])

global_step = tf.Variable(0, trainable=False)
learning_rate = tf.train.exponential_decay(learning_rate=2.0, global_step=global_step, decay_steps=100, decay_rate=0.94, staircase=True)
train_step = tf.train.AdamOptimizer(learning_rate).minimize(total_loss, global_step=global_step, var_list=[model['input']])

#
#
#
#
#

with tf.Session() as sess:
    sess.run(tf.initialize_all_variables())
    
    for i in range(EPOCHS):
        sess.run(train_step)
        if i%10 == 0:
            cc, sc, tc = sess.run([content_loss, style_loss, total_loss])
            print('Iteration= ' + str(i) + '\tContent cost= ' + str(cc) + '\tStyle cost= ' + str(sc) + '\tTotal cost= ' + str(tc))
            sys.stdout.flush()
        output_image = sess.run(model['input'])

    print("saving images= " + OUTPUT_IMAGE_NAME)
    save_image(HOME + '/output_images/' + OUTPUT_IMAGE_NAME + '.jpg', output_image)
    
print("DONE")


