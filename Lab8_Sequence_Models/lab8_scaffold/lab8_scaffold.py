#from tensorflow.python.ops import *

import tensorflow as tf
import numpy as np

from textloader import TextLoader


#
# -------------------------------------------
#
# Global variables

batch_size = 5#50
sequence_length = 10#50

data_loader = TextLoader( ".", batch_size, sequence_length )

vocab_size = data_loader.vocab_size  # dimension of one-hot encodings
state_dim = 128

num_layers = 2

tf.reset_default_graph()

testx, testy = data_loader.random_batch()
print("data_loader1\n x=" + str(testx) + "\n y=" + str(testy))
print("vocab_size " + str(vocab_size))

#
# ==================================================================
# ==================================================================
# ==================================================================
#

# define placeholders for our inputs.  
# in_ph is assumed to be [batch_size,sequence_length]
# targ_ph is assumed to be [batch_size,sequence_length]

in_ph = tf.placeholder( tf.int32, [ batch_size, sequence_length ], name='inputs' ) # batch_size X sequence_length 
targ_ph = tf.placeholder( tf.int32, [ batch_size, sequence_length ], name='targets' ) # batch_size X sequence_length
in_onehot = tf.one_hot( in_ph, vocab_size, name="input_onehot" ) # batch_size X sequence_length X vocab_size

inputs = tf.split( 1, sequence_length, in_onehot )
inputs2 = [ tf.squeeze(input_, [1]) for input_ in inputs ]
targets = tf.split( 1, sequence_length, targ_ph )

# at this point, inputs is a list of length sequence_length
# each element of inputs is [batch_size,vocab_size]

# targets is a list of length sequence_length
# each element of targets is a 1D vector of length batch_size

sess = tf.Session()
sess.run( tf.initialize_all_variables() )
feed = { in_ph: testx, targ_ph: testy }
ops = [targets]
retval = sess.run( ops, feed_dict=feed )

print(retval)

# ------------------
# YOUR COMPUTATION GRAPH HERE

# create a BasicLSTMCell
cell = tf.nn.rnn_cell.BasicLSTMCell( state_dim )

#   use it to create a MultiRNNCell
stacked_lstm = tf.nn.rnn_cell.MultiRNNCell([cell] * num_layers, state_is_tuple=False)
    
#   use it to create an initial_state
#   note that initial_state will be a *list* of tensors!
initial_state = state = stacked_lstm.zero_state(batch_size, tf.float32)

# call seq2seq.rnn_decoder
outputs, state = tf.nn.seq2seq.rnn_decoder(inputs, initial_state, cell)

# transform the list of state outputs to a list of logits.
# use a linear transformation.

# call seq2seq.sequence_loss

# create a training op using the Adam optimizer

# ------------------
# YOUR SAMPLER GRAPH HERE

# place your sampler graph here it will look a lot like your
# computation graph, except with a "batch_size" of 1.

# remember, we want to reuse the parameters of the cell and whatever
# parameters you used to transform state outputs to logits!

#
# ==================================================================
# ==================================================================
# ==================================================================
#

def sample( num=200, prime='ab' ):

    # prime the pump 

    # generate an initial state. this will be a list of states, one for
    # each layer in the multicell.
    s_state = sess.run( s_initial_state )

    # for each character, feed it into the sampler graph and
    # update the state.
    for char in prime[:-1]:
        x = np.ravel( data_loader.vocab[char] ).astype('int32')
        feed = { s_inputs:x }
        for i, s in enumerate( s_initial_state ):
            feed[s] = s_state[i]
        s_state = sess.run( s_final_state, feed_dict=feed )

    # now we have a primed state vector; we need to start sampling.
    ret = prime
    char = prime[-1]
    for n in range(num):
        x = np.ravel( data_loader.vocab[char] ).astype('int32')

        # plug the most recent character in...
        feed = { s_inputs:x }
        for i, s in enumerate( s_initial_state ):
            feed[s] = s_state[i]
        ops = [s_probs]
        ops.extend( list(s_final_state) )

        retval = sess.run( ops, feed_dict=feed )

        s_probsv = retval[0]
        s_state = retval[1:]

        # ...and get a vector of probabilities out!

        # now sample (or pick the argmax)
        # sample = np.argmax( s_probsv[0] )
        sample = np.random.choice( vocab_size, p=s_probsv[0] )

        pred = data_loader.chars[sample]
        ret += pred
        char = pred

    return ret

#
# ==================================================================
# ==================================================================
# ==================================================================
#

sess = tf.Session()
sess.run( tf.initialize_all_variables() )
summary_writer = tf.train.SummaryWriter( "./tf_logs", graph=sess.graph )

lts = []

print "FOUND %d BATCHES" % data_loader.num_batches

for j in range(1000):

    state = sess.run( initial_state )
    data_loader.reset_batch_pointer()

    for i in range( data_loader.num_batches ):
        
        x,y = data_loader.next_batch()

        # we have to feed in the individual states of the MultiRNN cell
        feed = { in_ph: x, targ_ph: y }
        for k, s in enumerate( initial_state ):
            feed[s] = state[k]

        ops = [optim,loss]
        ops.extend( list(final_state) )

        # retval will have at least 3 entries:
        # 0 is None (triggered by the optim op)
        # 1 is the loss
        # 2+ are the new final states of the MultiRNN cell
        retval = sess.run( ops, feed_dict=feed )

        lt = retval[1]
        state = retval[2:]

        if i%1000==0:
            print "%d %d\t%.4f" % ( j, i, lt )
            lts.append( lt )

    print sample( num=60, prime="And " )
#    print sample( num=60, prime="ababab" )
#    print sample( num=60, prime="foo ba" )
#    print sample( num=60, prime="abcdab" )

summary_writer.close()

#
# ==================================================================
# ==================================================================
# ==================================================================
#

#import matplotlib
#import matplotlib.pyplot as plt
#plt.plot( lts )
#plt.show()
