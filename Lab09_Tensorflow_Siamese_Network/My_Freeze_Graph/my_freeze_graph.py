import tensorflow as tf
import numpy as np
from freeze_graph import freeze_graph

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

# Saving the trained network

def save_graph(sess, output_node, directory):

    path = directory + "/"
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
    tf.train.Saver().save(sess, checkpoint_weights_path) 


    # Saving graph definition
    tf.train.write_graph(sess.graph.as_graph_def(), path, checkpoint_graph_filename, as_text)


    # Merging graph definition and learned weights into a trained graph
    restore_op_name = "save/restore_all"
    filename_tensor_name = "save/Const:0"
    clear_devices = False

    freeze_graph (
        input_graph = checkpoint_graph_path,
        input_saver = "",
        input_checkpoint = checkpoint_weights_path,
        output_graph = trained_graph_path,

        initializer_nodes = None,
        output_node_names = output_node,

        restore_op_name = "save/restore_all",
        filename_tensor_name = "save/Const:0",

        input_binary = as_binary,
        clear_devices = True
    )
