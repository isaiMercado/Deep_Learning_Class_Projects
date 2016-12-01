import sys

import tensorflow as tf
import numpy as np

from textloader import TextLoader
from GRU_neuron import MyGRUNeuron

#HOME = "/fslhome/misaie/tensorflow/recurrent_network"
HOME = "/home/isai/Documents/github/mount_super_computer/recurrent_network"
#
# ==================================================================
# ==================================================================
# GLOBAL VARIABLES
# ==================================================================
# ==================================================================
#


BATCH_SIZE = 50
SEQUENCE_LENGTH = 50

data_loader = TextLoader( HOME + "/Data", BATCH_SIZE, SEQUENCE_LENGTH)
VOCAB_SIZE = data_loader.vocab_size 

RNN_CELL_TYPE = "MY_GRU" #"MY_GRU" "LSTM"

NEURONS_COUNT = 128
LAYERS_COUNT = 2

EPOCHS = 5
SAMPLE_SIZE = 1000
STARTING_TEXT = 'And '

#
# ==================================================================
# ==================================================================
# TEMPLATE FOR RNN WITH DIFFERENT BATCH_SIZE
# ==================================================================
# ==================================================================
#


def build_graph(batch_size, sequence_length, cell_type):
    
    raw_inputs = tf.placeholder( tf.int32, [ batch_size, sequence_length ], name='raw_inputs' ) # batch_size X sequence_length 
    raw_targets = tf.placeholder( tf.int32, [ batch_size, sequence_length ], name='raw_targets' ) # batch_size X sequence_length

    onehot_inputs = tf.one_hot( raw_inputs, VOCAB_SIZE ) # batch_size X sequence_length X vocab_size
                                                         # list of sequences where characters are one hot encoded
    inputs = tf.split( 1, sequence_length, onehot_inputs ) # sequence_length X batch_size X 1 X vocab_size
                                                           # The list has sequence_length and every entry simbolizes one time 
                                                           # Every time stamp has a list of character with one hot encoding 
    inputs_list = [ tf.squeeze(inp, [1]) for inp in inputs ] # sequence_length X batch_size X vocab_size
                                                             # Same as inputs except that we get rid of dimension 2 because it is a one 
    targets_list = tf.split( 1, sequence_length, raw_targets ) # sequence_length X batch_size X vocab_size
                                                               # The list has sequence_length and every entry simbolizes one time
                                                               # Every time stamp is a list of batch_size length with targets
    weights_list = [tf.ones([batch_size]) for i in range(sequence_length)]
        
    # create a BasicLSTMCell
    if cell_type == "LSTM":
        layer = tf.nn.rnn_cell.BasicLSTMCell( NEURONS_COUNT, state_is_tuple = False)
    elif cell_type == "MY_GRU":
        layer = MyGRUNeuron(NEURONS_COUNT)

    # use it to create a MultiRNNCell
    layers = tf.nn.rnn_cell.MultiRNNCell([layer] * LAYERS_COUNT, state_is_tuple=False) # layers_count X batch_size X (neurons_count * state_size) 
        
    # use it to create an initial_state
    # note that initial_state will be a *list* of tensors!
    initial_state = layers.zero_state(batch_size, tf.float32) # layers_count X batch_size X (neurons_count * state_size) 
                                                              # The state_size is 2 which comes from the c and h states
    current_state = initial_state
    # call seq2seq.rnn_decoder
    outputs_list, next_state = tf.nn.seq2seq.rnn_decoder(inputs_list, current_state, layers) # sequence_length X batch_size X neurons_count

    # transform the list of state outputs to a list of logits.
    # use a linear transformation.

    logits_list = []
    W = tf.get_variable('W', [NEURONS_COUNT, VOCAB_SIZE])
    b = tf.get_variable('b', [VOCAB_SIZE], initializer=tf.constant_initializer(0.0))

    for i in range(sequence_length):
        output = tf.matmul(outputs_list[i], W) + b
        logits_list.append(output)
    
    return {
        "x" : raw_inputs,
        "y" : raw_targets,
        "initial_state" : initial_state,
        "current_state" : current_state,
        "next_state" : next_state,
        "logits" : logits_list,
        "targets" : targets_list,
        "weights" : weights_list
    }
    

#
# ==================================================================
# ==================================================================
# COMPUTATION_GRAPH
# ==================================================================
# ==================================================================
#


with tf.variable_scope('computation_graph') as scope:

    trainable_graph = build_graph(batch_size=BATCH_SIZE, sequence_length=SEQUENCE_LENGTH, cell_type=RNN_CELL_TYPE)
    scope.reuse_variables()
    sample_graph = build_graph(batch_size=1, sequence_length=1, cell_type=RNN_CELL_TYPE)
  
    loss = tf.nn.seq2seq.sequence_loss(trainable_graph["logits"], trainable_graph["targets"], trainable_graph["weights"])
    train_step = tf.train.AdamOptimizer(0.01).minimize(loss)


#
# ==================================================================
# ==================================================================
# TRAIN FUNCTION
# ==================================================================
# ==================================================================
#


def train(trainable_graph, epochs):
    print("FOUND " + str(data_loader.num_batches) + " BATCHES")
    
    state = None
    for j in range(epochs):
        state = sess.run( trainable_graph["initial_state"] )
        data_loader.reset_batch_pointer()

        for i in range( data_loader.num_batches ):
            x,y = data_loader.next_batch()            
            feed = {trainable_graph["x"]: x, trainable_graph["y"]: y, trainable_graph["current_state"]: state}
            _, loss_value, state = sess.run( [train_step, loss, trainable_graph["next_state"]], feed_dict=feed )

            if i%1000==0:
                print("loss value: " + str(loss_value))

    
#
# ==================================================================
# ==================================================================
# SAMPLE FUNCTION
# ==================================================================
# ==================================================================
#   
    
        
def sample(sample_graph, sample_size, starting_text):

    def softmax(S_matrix): 
        # Exp-normalize trick to avoid numerical overflow
        S_matrix = S_matrix - np.max(S_matrix) 
        ROWS_AXIS = 0
        E_matrix = np.exp(S_matrix)
        P_matrix = E_matrix / np.sum(E_matrix, axis=ROWS_AXIS, keepdims=True)
        return P_matrix
    
    state = sess.run( sample_graph["initial_state"] )
    char_index = data_loader.vocab[starting_text[0]] 
    chars = [starting_text[0]]
    
    for char in starting_text[1:]:
        feed={sample_graph["x"]: [[char_index]], sample_graph["current_state"]: state}
        predictions, state = sess.run([sample_graph["logits"], sample_graph["next_state"]], feed_dict=feed)
        char_index = data_loader.vocab[char] 
        chars.append(char)

    for i in range(sample_size):
        feed={sample_graph["x"]: [[char_index]], sample_graph["current_state"]: state}
        predictions, state = sess.run([sample_graph["logits"], sample_graph["next_state"]], feed_dict=feed)
        #sample_index = np.argmax( predictions[0][0] )
        sample_index = np.random.choice( VOCAB_SIZE, p=softmax(predictions[0][0]))
        sample_char = data_loader.chars[sample_index]
        chars.append(sample_char)
        char_index = sample_index

    return "".join(chars)
    

#
# ==================================================================
# ==================================================================
# MAIN 
# ==================================================================
# ==================================================================
#


with tf.Session() as sess:
    sess.run(tf.initialize_all_variables())
    
    summaries = tf.merge_all_summaries()
    summary_writer = tf.train.SummaryWriter('./TensorBoard',graph=sess.graph)
    
    train(trainable_graph, epochs=EPOCHS)
    sample_text = sample(sample_graph, sample_size=SAMPLE_SIZE, starting_text=STARTING_TEXT)
    
    print(sample_text)
    text_file = open(HOME + '/SampleText/sample_text.txt', 'w')
    text_file.write(sample_text)
    text_file.close()
    
    summary_writer.close()
    

   
  







