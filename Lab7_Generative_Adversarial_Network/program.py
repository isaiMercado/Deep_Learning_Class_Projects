HOME = "/fslhome/misaie/tensorflow/generative_adversarial_network"
#HOME = "."

import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data

import numpy as np

from sklearn.utils import shuffle

mnist = input_data.read_data_sets( "MNIST_data/", one_hot=True )
print("\n")
#
# -------------------------------------------
#
# Global variables

batch_size = 100
z_dim = 10
LEARNING_RATE = 0.0002
EPOCHS = 50000
STEP = 10

#
# ==================================================================
# ==================================================================
# ==================================================================
#

def linear(input_matrix, variable_shape, name, stddev=0.02, bias_val=0.0):
    with tf.variable_scope(name):
        W = tf.get_variable("W", variable_shape, initializer=tf.random_normal_initializer(stddev=stddev))
        b = tf.get_variable("b", [variable_shape[1]], initializer=tf.constant_initializer(bias_val))
        linear_result = tf.matmul(input_matrix, W) + b
        return linear_result



def lrelu(input_matrix, name, leak=0.2,):
    return tf.maximum(input_matrix, leak * input_matrix, name=name)



def deconv2d(input_matrix, variable_shape, output_shape, name):
    # [ height, width, channels_going_out, filters_comming_in ]
    with tf.variable_scope( name ):    
        W = tf.get_variable( "W", variable_shape, initializer=tf.truncated_normal_initializer( stddev=0.02 ) )
        b = tf.get_variable( "b", [variable_shape[2]], initializer=tf.constant_initializer( 0.0 ))
        linear_result = tf.nn.conv2d_transpose(input_matrix, W, output_shape=output_shape, strides=[1, 2, 2, 1] ) + b
        return linear_result



def conv2d(input_matrix, variable_shape, name):
    # [ height, width, channels_going_in, filters_comming_out ]
    with tf.variable_scope( name ):
        W = tf.get_variable( "W", variable_shape, initializer=tf.truncated_normal_initializer(stddev=0.02) )
        b = tf.get_variable( "b", [variable_shape[3]], initializer=tf.constant_initializer(0.0) )
        linear_result = tf.nn.conv2d(input_matrix, W, strides=[1, 2, 2, 1], padding='SAME' ) + b
        return linear_result

#
# ==================================================================
# ==================================================================
# ==================================================================
#

# the generator should accept a (tensor of multiple) 'z' and return an image
# z will be [None,z_dim]


def generator(Z):
    
    with tf.variable_scope('H1') as scope:
        H1 = linear(Z, [10, 7 * 7 * 128], name="linear")
        H1 = tf.nn.relu(H1, name="relu")
        H1 = tf.reshape(H1, [batch_size, 7, 7, 128], name="reshape")
    
    with tf.variable_scope('D1') as scope:
        D1 = deconv2d(H1, [5, 5, 128, 128], [batch_size, 14, 14, 128], name="deconv")
        D1 = tf.nn.relu(D1, name="relu")
    
    with tf.variable_scope('D2') as scope:
        D2 = deconv2d(D1, [5, 5, 1, 128], [batch_size, 28, 28, 1], name="deconv")
        O = tf.sigmoid(D2, name="output_node")
    
    
    print("Done initializing generator")
    print("Z shape "  + str(Z.get_shape()))
    print("H1 shape " + str(H1.get_shape()))
    print("D1 shape " + str(D1.get_shape()))
    print("D2 shape " + str(D2.get_shape()))
    print("O shape "  + str(O.get_shape()))
    print("\n")
    
    return O

# -------------------------------------------
    
# the discriminator should accept a (tensor of muliple) images and
# return a probability that the image is real
# imgs will be [None,784]

def discriminator(I):
    
    with tf.variable_scope('C1') as scope:
        C1 = conv2d(I, [5, 5, 1, 32], name="conv" )
        C1 = lrelu(C1, name="lrelu")
    
    with tf.variable_scope('C2') as scope:
        C2 = conv2d(C1 , [5, 5, 32, 64], name="conv")
        C2 = lrelu(C2, name="lrelu")
        C2 = tf.reshape(C2,[batch_size, 7 * 7 * 64], name="reshape")
        
    with tf.variable_scope('H1') as scope:
        H1 = linear(C2, [7 * 7 * 64, 1024], name="linear")
    
    with tf.variable_scope('H2') as scope:
        H2 = linear(H1, [1024, 1], name="linear")
        O = tf.sigmoid(H2, name="sigmoid_output")
    
    
    print("Done initializing discriminator")
    print("I shape "  + str(I.get_shape()))
    print("C1 shape " + str(C1.get_shape()))
    print("C2 shape " + str(C2.get_shape()))
    print("H1 shape " + str(H1.get_shape()))
    print("H2 shape " + str(H2.get_shape()))
    print("O shape "  + str(O.get_shape()))
    print("\n")
     
    return O

#
# ==================================================================
# ==================================================================
# ==================================================================
#

# Create your computation graph, cost function, and training steps here!

# Placeholders should be named 'z' and ''true_images'
# Training ops should be named 'd_optim' and 'g_optim'
# The output of the generator should be named 'sample_images'

with tf.variable_scope('model') as master_scope:
    with tf.variable_scope('generator') as scope:
        z_matrix = tf.placeholder(tf.float32, shape=[batch_size, 10], name="input_node")
        fake_images = generator(z_matrix)

    with tf.variable_scope('discriminator') as scope:
        true_images_flat_matrix = tf.placeholder(tf.float32, shape=[None, 784], name="true_images")
        true_images = tf.reshape(true_images_flat_matrix, [batch_size, 28, 28, 1], name="input_node")
        true_images_prob = discriminator(true_images)
        scope.reuse_variables()
        fake_images_prob = discriminator(fake_images)
     
        
ones = tf.ones([batch_size, 1], dtype=tf.float32, name=None)
zeros = tf.zeros([batch_size, 1], dtype=tf.float32, name=None)


with tf.variable_scope('loss_function') as scope:
    d_loss = tf.reduce_mean(-tf.log(true_images_prob) - tf.log(1 - fake_images_prob), name="d_loss")
    g_loss = tf.reduce_mean(-tf.log(fake_images_prob), name="g_loss")
    
    #d_loss = tf.reduce_mean(-tf.log(true_images_prob) - tf.log(1 - fake_images_prob), name="d_loss")
    #g_loss = tf.reduce_mean(1 - tf.log(fake_images_prob), name="g_loss")
    
    #d_loss_true = tf.reduce_mean(tf.nn.sigmoid_cross_entropy_with_logits(true_images_prob, ones))
    #d_loss_fake = tf.reduce_mean(tf.nn.sigmoid_cross_entropy_with_logits(fake_images_prob,zeros))
    #d_loss = d_loss_true + d_loss_fake

    #g_loss = tf.reduce_mean(tf.nn.sigmoid_cross_entropy_with_logits(fake_images_prob, ones))


with tf.variable_scope('optimization_steps') as scope:
    d_vars = [v for v in tf.trainable_variables() if v.name.startswith('model/discriminator')]
    g_vars = [v for v in tf.trainable_variables() if v.name.startswith('model/generator')]

    d_train_step = tf.train.AdamOptimizer(LEARNING_RATE, beta1=0.5, name="d_optimizer").minimize(d_loss, var_list=d_vars)
    g_train_step = tf.train.AdamOptimizer(LEARNING_RATE, beta1=0.5, name="g_optimizer").minimize(g_loss, var_list=g_vars)


with tf.variable_scope('generator_accuracy') as scope:
    d_true_images_pred = tf.equal(tf.round(true_images_prob), ones)
    d_fake_images_pred = tf.equal(tf.round(fake_images_prob), zeros)

    d_true_images_acc = tf.reduce_mean(tf.cast(d_true_images_pred, tf.float32), name="d_true_images_acc")
    d_fake_images_acc = tf.reduce_mean(tf.cast(d_fake_images_pred, tf.float32), name="d_fake_images_acc")

    d_acc = tf.div(tf.add_n([d_true_images_acc, d_fake_images_acc]), 2.0)

#
# ==================================================================
# ==================================================================
# ==================================================================
#

with tf.Session() as sess:
    sess.run(tf.initialize_all_variables())
    summary_writer = tf.train.SummaryWriter(HOME + "/TensorBoard", graph=sess.graph )
    print("graph summaries initialized")

    for i in range( EPOCHS ):
        batch = mnist.train.next_batch( batch_size )
        batch_images = batch[0]

        sampled_zs = np.random.uniform( low=-1, high=1, size=(batch_size, z_dim) ).astype( np.float32 )
        sess.run( d_train_step, feed_dict={ z_matrix:sampled_zs, true_images_flat_matrix: batch_images } )

        for j in range(3):
            sampled_zs = np.random.uniform( low=-1, high=1, size=(batch_size, z_dim) ).astype( np.float32 )
            sess.run( g_train_step, feed_dict={ z_matrix:sampled_zs } )
        
        if i%STEP==0:
            d_acc_val, d_true_images_acc_val, d_fake_images_acc_val,d_loss_val,g_loss_val = sess.run( [d_acc, d_true_images_acc, d_fake_images_acc,d_loss,g_loss], feed_dict={ z_matrix:sampled_zs, true_images_flat_matrix: batch_images } )
            print "Iter=%d\tAcc=%.2f\ttrueImageAcc=%.2f\tfakeImageAcc=%.2f\tdLoss=%.2f\tgLoss=%.2f" % ( i, d_acc_val, d_true_images_acc_val, d_fake_images_acc_val,d_loss_val,g_loss_val )

    summary_writer.close()

    # input_graph - TensorFlow 'GraphDef' file to load
    # input_saver - TensorFlow saver file to load
    # input_checkpoint - TensorFlow variables file to load

    # output_graph - Output 'GraphDef' file name
    # input_binary - Whether the input files are in binary format
    # output_node_names - The name of the output nodes, comma separated
    # restore_op_name - The name of the master restore operator
    # filename_tensor_name - The name of the tensor holding the save path
    # clear_devices - Whether to remove device specifications
    # initializer_nodes - comma separated list of initializer nodes to run before freezing

    import sys
    sys.path.insert(0, HOME + '/Libs')
    from freeze_graph import freeze_graph

    # Saving the trained network

    path = HOME + "/TrainedModel/"
    checkpoint_weights_filename = "weights"
    checkpoint_graph_filename = "graph.pb"
    trained_graph_filename = "trained_graph.pb"

    checkpoint_weights_path = path + checkpoint_weights_filename
    checkpoint_graph_path = path + checkpoint_graph_filename
    trained_graph_path = path + trained_graph_filename
    saver_path = ""

    as_text = True
    as_binary = not as_text

    # Saving learned weights of the model
    tf.train.Saver().save(sess, checkpoint_weights_path) #, global_step=0, latest_filename="checkpoint_name")

    # Saving graph definition
    tf.train.write_graph(sess.graph.as_graph_def(), path, checkpoint_graph_filename, as_text)

    # Merging graph definition and learned weights into a trained graph
    freeze_graph (
        input_graph = checkpoint_graph_path,
        input_saver = saver_path,
        input_checkpoint = checkpoint_weights_path,
        output_graph = trained_graph_path,

        initializer_nodes = None, #"input_node",
        output_node_names = "model/generator/D2/output_node",

        restore_op_name = "save/restore_all",
        filename_tensor_name = "save/Const:0",

        input_binary = as_binary,
        clear_devices = True
    )
    
    

    
