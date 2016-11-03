from tensorflow.python.ops.rnn_cell import RNNCell
import tensorflow as tf
import numpy as np
 
class MyGRUNeuron( RNNCell ):
 
    def __init__( self, neurons_count ):
        self.neurons_count = neurons_count
    	pass
 
    @property
    def state_size(self):
    	return self.neurons_count
 
    @property
    def output_size(self):
    	return self.neurons_count
 
    def __call__( self, X, S, scope=None ):
    
        with tf.variable_scope('GRU_cell') as scope:
            
            batch_size = X.get_shape()[0]
            classes_count = X.get_shape()[1]
            neurons_count = S.get_shape()[1]
            
            with tf.variable_scope("read_gate") as scope:
                Wr = tf.get_variable('W', [neurons_count, neurons_count])
                Ur = tf.get_variable('U', [classes_count, neurons_count])
                R = tf.sigmoid(tf.matmul(S, Wr) + tf.matmul(X, Ur)) 
                
            with tf.variable_scope("remember_gate") as scope:
                Wz = tf.get_variable('W', [neurons_count, neurons_count])
                Uz = tf.get_variable('U', [classes_count, neurons_count])
                Z = tf.sigmoid(tf.matmul(S, Wz) + tf.matmul(X, Uz))
                
            with tf.variable_scope("write_gate") as scope:
                I = 1 - Z
                
            with tf.variable_scope("calculate_delta_S") as scope:
                Ws = tf.get_variable('W', [neurons_count, neurons_count])
                Us = tf.get_variable('U', [classes_count, neurons_count])
                delta_S = tf.tanh(tf.matmul(R * S, Ws) + tf.matmul(X, Us))
                
            with tf.variable_scope("calculate_new_S") as scope:
                S = (Z * S) + (I * delta_S)
        
        return S, S
       
       
