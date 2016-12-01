import sys

try:
    HOME = "/fslhome/misaie/tensorflow/siamese"
    sys.path.append(HOME + '/My_Dataset')
    sys.path.append(HOME + '/My_Freeze_Graph')
    from my_dataset import load_my_dataset
    
except:
    HOME = "/home/isai/Documents/github/mount_super_computer/siamese"
    sys.path.append(HOME + '/My_Dataset')
    sys.path.append(HOME + '/My_Freeze_Graph')
    from my_dataset import load_my_dataset




from my_dataset import load_my_dataset
from my_freeze_graph import save_graph

import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data

import numpy as np

from sklearn.utils import shuffle



#
#
# Global Variables
#
#



EPOCHS = 1000
PRINT_STEP = 5
BATCH_SIZE = 4
IMAGE_SIZE = 250
IMAGE_DEPTH = 1

LEARNING_RATE = 0.0001
THRESHOLD = 5000000
MARGIN = 10000000

VECTOR_REPRESENTATION_SIZE = 100
NUMBER_OF_IMAGES = 12000



#
#
# Get dataset
#
#



data = load_my_dataset(HOME + '/My_Dataset/image_directory_list.txt', NUMBER_OF_IMAGES)
#data = input_data.read_data_sets(HOME + "/MNIST_data/")



#
#
# Debug and Test Operations
# example = debug([vectors_left,vectors_right,substractions,squares,sumation,distance])
#



list_of_tensors = []

def debug(tensors, show_labels=False):
    with tf.Session() as sess:
        sess.run(tf.initialize_all_variables())
        
        x1, x2, y = data.train.get_next_siamese_batch(BATCH_SIZE)   
        #x1, x2, y, _, _ = get_next_mnist_balanced_batch(BATCH_SIZE)
               
        for tensor in tensors:
            feed_dictionary = {images_left: x1, images_right: x2, labels: y}
            result = sess.run(tensor, feed_dict=feed_dictionary)
            print(tensor.name + "= " + str(result.shape))
            print(tensor.name + "\n" + str(result))
            print("\n")
            
        if show_labels:
            print("Labels\n" + str(y))
            
            
      
def debug1(tensors, x1, x2, y):
    for tensor in tensors:
        feed_dictionary = {images_left: x1, images_right: x2, labels: y}
        result = sess.run(tensor, feed_dict=feed_dictionary)
        print(tensor.name + "= " + str(result.shape))
        print(tensor.name + "\n" + str(result))
        print("\n")
        
    
      
def get_next_mnist_balanced_batch(batch_size):

    next_x, next_y = data.train.next_batch(1)
    x1, y1 = np.tile(next_x, (batch_size, 1)), np.tile(next_y, (batch_size, 1))
        
    good_x, good_y = [], [] 
    
    while(len(good_x) < batch_size/2) :
        x, y = data.train.next_batch(1)
        if y == next_y:
            good_x.append(x)
            good_y.append(y)
            
    bad_x, bad_y = [], []
    
    while(len(bad_x) < batch_size/2):
        x,y = data.train.next_batch(1)
        if y != next_y:
            bad_x.append(x)
            bad_y.append(y)
          
    
    x2, y2 = np.concatenate((good_x, bad_x)), np.concatenate((good_y, bad_y))
   
    x1 = x1.reshape(-1,28,28,1)
    x2 = x2.reshape(-1,28,28,1)
    y = (y1 == y2).astype(float) 
    
    return x1, x2, y, y1, y2


    
#
#
# Graph Building Blocks
#
#



def weights_var(shape,name):
    #weights = tf.get_variable(name, shape=shape, initializer=tf.contrib.layers.xavier_initializer())
    weights = tf.get_variable(initializer=tf.truncated_normal_initializer( stddev=0.2), shape=shape, name=name)
    return weights



def bias_var(shape,name):
    biases = tf.get_variable(initializer=tf.truncated_normal_initializer( stddev=0.2), shape=shape, name=name)
    return biases



def convolution_op(images, shape, name):
    # Shape = [filter_width, filter_height, input_depth, num_filters]
    # Stride = [batch, height, width, depth]
    strides = [1,1,1,1]
    
    with tf.variable_scope(name):
        W = weights_var(shape, "W")
        b = bias_var((shape[3]), "b")
        
        convolutions = tf.nn.conv2d(images, W, strides=strides, padding='SAME') + b
        return convolutions



def relu_op(images, name):
    non_linear_images = tf.nn.relu(images, name)
    return non_linear_images



def max_pool(images, name):
    # [batch, height, width, depth]
    strides = [1,2,2,1]
    ksize = [1,2,2,1] #[1,2,2,1]
    smaller_images = tf.nn.max_pool(images, ksize=ksize, strides=strides, padding='SAME', name=name)
    return smaller_images



def residual_op(images, shape1, shape2, name):
    with tf.variable_scope(name):
        convolutions1 = convolution_op(images, shape1, "convolution_op_1")    
        non_linears1 = relu_op(convolutions1, "relu_op_1")
        convolutions2 = convolution_op(non_linears1, shape2, "convolution_op_2")
        residuals = convolutions2 + images
        non_linears2 = relu_op(residuals, "relu_op_2")
        
        return non_linears2
  
        
        
def linear_op(images, shape, name):
    with tf.variable_scope(name):
        W = weights_var(shape, "W")
        b = bias_var((shape[1]), "b")
        linears = tf.matmul(images, W) + b
        return linears
       
      
        
def fully_connected_op(images, shape, name):
    with tf.variable_scope(name):
        linears = linear_op(images, shape, "linear")
        non_linears = relu_op(linears, "relu")
        return non_linears



def euclidean_distance(vectors_left, vectors_right, name):
    substractions = tf.sub(vectors_left, vectors_right)
    squares = tf.square(substractions)
    sumations = tf.reduce_sum(squares, reduction_indices=1, keep_dims=True)
    distances = tf.sqrt(sumations, name)
    return distances
    
    

def manhattan_distance(vectors_left, vectors_right, name):
    substractions = tf.sub(vectors_left, vectors_right)
    absolutes = tf.abs(substractions)
    distances = tf.reduce_sum(absolutes, reduction_indices=1, keep_dims=True)
    return distances
    
    
    
def get_distances(vectors_left, vectors_right, name):
    distances = euclidean_distance(vectors_left, vectors_right, name)
    return distances 
    


def get_predictions(distances, thresholds, name):
    predictions = tf.cast(tf.less_equal(distances, thresholds, name=name), tf.float32)
    return predictions


                 
#
#
# Computation Graph
#
#



FILTER_SIZE = 3
FILTERS_COUNT = 30

FIRST_FILTER_SHAPE = [FILTER_SIZE,FILTER_SIZE,IMAGE_DEPTH,FILTERS_COUNT]
FILTER_SHAPE = [FILTER_SIZE,FILTER_SIZE,FILTERS_COUNT,FILTERS_COUNT]

HIDDEN_SIZE = 100

def computation_graph(images):
    residuals = residual_op(images, FIRST_FILTER_SHAPE, FILTER_SHAPE, "residual_op_1")
    residuals = residual_op(residuals, FILTER_SHAPE, FILTER_SHAPE, "residual_op_2")
    #residuals = residual_op(residuals, FILTER_SHAPE, FILTER_SHAPE, "residual_op_3")
    #residuals = residual_op(residuals, FILTER_SHAPE, FILTER_SHAPE, "residual_op_4")
    #residuals = residual_op(residuals, FILTER_SHAPE, FILTER_SHAPE, "residual_op_5")
    #residuals = residual_op(residuals, FILTER_SHAPE, FILTER_SHAPE, "residual_op_6")
    #residuals = residual_op(residuals, FILTER_SHAPE, FILTER_SHAPE, "residual_op_7")
    #residuals = residual_op(residuals, FILTER_SHAPE, FILTER_SHAPE, "residual_op_8")
    #residuals = residual_op(residuals, FILTER_SHAPE, FILTER_SHAPE, "residual_op_9")
    #residuals = residual_op(residuals, FILTER_SHAPE, FILTER_SHAPE, "residual_op_10")
    flats = tf.reshape(residuals, [BATCH_SIZE, IMAGE_SIZE*IMAGE_SIZE*FILTERS_COUNT])
    non_linears1 = fully_connected_op(flats, [IMAGE_SIZE*IMAGE_SIZE*FILTERS_COUNT, HIDDEN_SIZE], "fully_connected_op_1")
    non_linears2 = fully_connected_op(non_linears1, [HIDDEN_SIZE,VECTOR_REPRESENTATION_SIZE], "fully_connected_op_2")
    
    return non_linears2


    
#
#
# Siamese Structure
#
#



with tf.variable_scope("inputs_section") as scope:
    images_left = tf.placeholder(tf.float32, shape=[BATCH_SIZE, IMAGE_SIZE, IMAGE_SIZE, IMAGE_DEPTH], name="images_left")
    images_right = tf.placeholder(tf.float32, shape=[BATCH_SIZE, IMAGE_SIZE, IMAGE_SIZE, IMAGE_DEPTH], name="images_right")
    labels = tf.placeholder(tf.float32, shape=[BATCH_SIZE, 1], name="labels")
    thresholds = tf.constant(THRESHOLD, dtype=tf.float32, shape=[BATCH_SIZE, 1], name="thresholds")


with tf.variable_scope("computation_section") as scope:
    vectors_left = computation_graph(images_left)
    scope.reuse_variables()
    vectors_right = computation_graph(images_right)
    distances = get_distances(vectors_left, vectors_right, "distances")
    predictions = get_predictions(distances, thresholds, "output_node")


with tf.variable_scope("training_section") as scope:
    positives = distances
    negatives = tf.maximum(tf.constant(0, tf.float32), tf.constant(MARGIN, tf.float32) - distances)
    losses = ((labels) * positives) + ((1 - labels) * negatives)
    train_step = tf.train.AdamOptimizer(LEARNING_RATE).minimize(losses)
    

with tf.variable_scope("summaries_section") as scope:
    loss = tf.reduce_mean(losses)
    accuracy = tf.reduce_mean(tf.cast(tf.equal(predictions, labels), tf.float32))


    
#
#
# Train function
#   
#   



def train(sess):
    print("STARTING TRAINING")
    for i in range(EPOCHS):
    
        x1, x2, y = data.train.get_next_siamese_batch(BATCH_SIZE)   
        #x1, x2, y, y1, y2 = get_next_mnist_balanced_batch(BATCH_SIZE)
              
        feed_dictionary = {images_left: x1, images_right: x2, labels: y}
        operations = [loss, accuracy, train_step, positives, negatives]
        lo, ac, _, pos, neg = sess.run(operations, feed_dict=feed_dictionary)
        
        if (i % PRINT_STEP) == 0:
            print("Loss= " + str(lo) + "\tAccuracy= " + str(ac)) 
            print(pos)
            print(neg) 
            
         
            
#
#           
# Main           
#           
#           



with tf.Session() as sess:

    sess.run(tf.initialize_all_variables())
    
    summaries = tf.merge_all_summaries()
    summary_writer = tf.train.SummaryWriter(HOME + '/Tensor_Board',graph=sess.graph)
    
    train(sess)
    
    save_graph(sess, output_node="computation_section/output_node", directory=HOME + "/Trained_Model")
   
    summary_writer.close()       
            
            
                
                
