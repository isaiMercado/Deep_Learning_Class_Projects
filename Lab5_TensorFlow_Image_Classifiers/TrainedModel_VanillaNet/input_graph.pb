node {
  name: "input_layer/features_matrix"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "input_layer/targets_matrix"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\020\003\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "hidden_layer1/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal/mul"
  op: "Mul"
  input: "hidden_layer1/truncated_normal/TruncatedNormal"
  input: "hidden_layer1/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal"
  op: "Add"
  input: "hidden_layer1/truncated_normal/mul"
  input: "hidden_layer1/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer1/weight_matrix_h1"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 784
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "hidden_layer1/weight_matrix_h1/Assign"
  op: "Assign"
  input: "hidden_layer1/weight_matrix_h1"
  input: "hidden_layer1/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer1/weight_matrix_h1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "hidden_layer1/weight_matrix_h1/read"
  op: "Identity"
  input: "hidden_layer1/weight_matrix_h1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer1/weight_matrix_h1"
      }
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal_1/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal_1/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal_1/TruncatedNormal"
  op: "TruncatedNormal"
  input: "hidden_layer1/truncated_normal_1/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal_1/mul"
  op: "Mul"
  input: "hidden_layer1/truncated_normal_1/TruncatedNormal"
  input: "hidden_layer1/truncated_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer1/truncated_normal_1"
  op: "Add"
  input: "hidden_layer1/truncated_normal_1/mul"
  input: "hidden_layer1/truncated_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer1/bias_vector_h1"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "hidden_layer1/bias_vector_h1/Assign"
  op: "Assign"
  input: "hidden_layer1/bias_vector_h1"
  input: "hidden_layer1/truncated_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer1/bias_vector_h1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "hidden_layer1/bias_vector_h1/read"
  op: "Identity"
  input: "hidden_layer1/bias_vector_h1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer1/bias_vector_h1"
      }
    }
  }
}
node {
  name: "hidden_layer1/input_node"
  op: "MatMul"
  input: "input_layer/features_matrix"
  input: "hidden_layer1/weight_matrix_h1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "hidden_layer1/add"
  op: "Add"
  input: "hidden_layer1/input_node"
  input: "hidden_layer1/bias_vector_h1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer1/hidden_matrix_nonlinear_h1"
  op: "Relu"
  input: "hidden_layer1/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\024\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "hidden_layer2/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal/mul"
  op: "Mul"
  input: "hidden_layer2/truncated_normal/TruncatedNormal"
  input: "hidden_layer2/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal"
  op: "Add"
  input: "hidden_layer2/truncated_normal/mul"
  input: "hidden_layer2/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer2/weight_matrix_h2"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "hidden_layer2/weight_matrix_h2/Assign"
  op: "Assign"
  input: "hidden_layer2/weight_matrix_h2"
  input: "hidden_layer2/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer2/weight_matrix_h2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "hidden_layer2/weight_matrix_h2/read"
  op: "Identity"
  input: "hidden_layer2/weight_matrix_h2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer2/weight_matrix_h2"
      }
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal_1/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal_1/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal_1/TruncatedNormal"
  op: "TruncatedNormal"
  input: "hidden_layer2/truncated_normal_1/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal_1/mul"
  op: "Mul"
  input: "hidden_layer2/truncated_normal_1/TruncatedNormal"
  input: "hidden_layer2/truncated_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer2/truncated_normal_1"
  op: "Add"
  input: "hidden_layer2/truncated_normal_1/mul"
  input: "hidden_layer2/truncated_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer2/bias_vector_h2"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "hidden_layer2/bias_vector_h2/Assign"
  op: "Assign"
  input: "hidden_layer2/bias_vector_h2"
  input: "hidden_layer2/truncated_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer2/bias_vector_h2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "hidden_layer2/bias_vector_h2/read"
  op: "Identity"
  input: "hidden_layer2/bias_vector_h2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer2/bias_vector_h2"
      }
    }
  }
}
node {
  name: "hidden_layer2/hidden_matrix_linear_h2"
  op: "MatMul"
  input: "hidden_layer1/hidden_matrix_nonlinear_h1"
  input: "hidden_layer2/weight_matrix_h2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "hidden_layer2/add"
  op: "Add"
  input: "hidden_layer2/hidden_matrix_linear_h2"
  input: "hidden_layer2/bias_vector_h2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer2/hidden_matrix_nonlinear_h2"
  op: "Relu"
  input: "hidden_layer2/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\024\000\000\000\024\000\000\000"
      }
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "hidden_layer3/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal/mul"
  op: "Mul"
  input: "hidden_layer3/truncated_normal/TruncatedNormal"
  input: "hidden_layer3/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal"
  op: "Add"
  input: "hidden_layer3/truncated_normal/mul"
  input: "hidden_layer3/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer3/weight_matrix_h3"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "hidden_layer3/weight_matrix_h3/Assign"
  op: "Assign"
  input: "hidden_layer3/weight_matrix_h3"
  input: "hidden_layer3/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer3/weight_matrix_h3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "hidden_layer3/weight_matrix_h3/read"
  op: "Identity"
  input: "hidden_layer3/weight_matrix_h3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer3/weight_matrix_h3"
      }
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 20
      }
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal_1/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal_1/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal_1/TruncatedNormal"
  op: "TruncatedNormal"
  input: "hidden_layer3/truncated_normal_1/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal_1/mul"
  op: "Mul"
  input: "hidden_layer3/truncated_normal_1/TruncatedNormal"
  input: "hidden_layer3/truncated_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer3/truncated_normal_1"
  op: "Add"
  input: "hidden_layer3/truncated_normal_1/mul"
  input: "hidden_layer3/truncated_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer3/bias_vector_h3"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "hidden_layer3/bias_vector_h3/Assign"
  op: "Assign"
  input: "hidden_layer3/bias_vector_h3"
  input: "hidden_layer3/truncated_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer3/bias_vector_h3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "hidden_layer3/bias_vector_h3/read"
  op: "Identity"
  input: "hidden_layer3/bias_vector_h3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer3/bias_vector_h3"
      }
    }
  }
}
node {
  name: "hidden_layer3/hidden_matrix_linear_h3"
  op: "MatMul"
  input: "hidden_layer2/hidden_matrix_nonlinear_h2"
  input: "hidden_layer3/weight_matrix_h3/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "hidden_layer3/add"
  op: "Add"
  input: "hidden_layer3/hidden_matrix_linear_h3"
  input: "hidden_layer3/bias_vector_h3/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "hidden_layer3/hidden_matrix_nonlinear_h3"
  op: "Relu"
  input: "hidden_layer3/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "output_layer/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\024\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "output_layer/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "output_layer/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "output_layer/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "output_layer/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "output_layer/truncated_normal/mul"
  op: "Mul"
  input: "output_layer/truncated_normal/TruncatedNormal"
  input: "output_layer/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "output_layer/truncated_normal"
  op: "Add"
  input: "output_layer/truncated_normal/mul"
  input: "output_layer/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "output_layer/weight_matrix_out"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 20
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "output_layer/weight_matrix_out/Assign"
  op: "Assign"
  input: "output_layer/weight_matrix_out"
  input: "output_layer/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@output_layer/weight_matrix_out"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "output_layer/weight_matrix_out/read"
  op: "Identity"
  input: "output_layer/weight_matrix_out"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@output_layer/weight_matrix_out"
      }
    }
  }
}
node {
  name: "output_layer/truncated_normal_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "output_layer/truncated_normal_1/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "output_layer/truncated_normal_1/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "output_layer/truncated_normal_1/TruncatedNormal"
  op: "TruncatedNormal"
  input: "output_layer/truncated_normal_1/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "output_layer/truncated_normal_1/mul"
  op: "Mul"
  input: "output_layer/truncated_normal_1/TruncatedNormal"
  input: "output_layer/truncated_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "output_layer/truncated_normal_1"
  op: "Add"
  input: "output_layer/truncated_normal_1/mul"
  input: "output_layer/truncated_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "output_layer/bias_vector_out"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "output_layer/bias_vector_out/Assign"
  op: "Assign"
  input: "output_layer/bias_vector_out"
  input: "output_layer/truncated_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@output_layer/bias_vector_out"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "output_layer/bias_vector_out/read"
  op: "Identity"
  input: "output_layer/bias_vector_out"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@output_layer/bias_vector_out"
      }
    }
  }
}
node {
  name: "output_layer/output_matrix"
  op: "MatMul"
  input: "hidden_layer3/hidden_matrix_nonlinear_h3"
  input: "output_layer/weight_matrix_out/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "output_layer/add"
  op: "Add"
  input: "output_layer/output_matrix"
  input: "output_layer/bias_vector_out/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "output_layer/output_node"
  op: "Softmax"
  input: "output_layer/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/Log"
  op: "Log"
  input: "output_layer/output_node"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/mul"
  op: "Mul"
  input: "input_layer/targets_matrix"
  input: "loss/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/Sum"
  op: "Sum"
  input: "loss/mul"
  input: "loss/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/Neg"
  op: "Neg"
  input: "loss/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/loss_function"
  op: "Mean"
  input: "loss/Neg"
  input: "loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/Shape"
  op: "Shape"
  input: "loss/loss_function"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/gradients/Fill"
  op: "Fill"
  input: "loss/gradients/Shape"
  input: "loss/gradients/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Reshape"
  op: "Reshape"
  input: "loss/gradients/Fill"
  input: "loss/gradients/loss/loss_function_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Shape"
  op: "Shape"
  input: "loss/Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Tile"
  op: "Tile"
  input: "loss/gradients/loss/loss_function_grad/Reshape"
  input: "loss/gradients/loss/loss_function_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Shape_1"
  op: "Shape"
  input: "loss/Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Shape_2"
  op: "Shape"
  input: "loss/loss_function"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Prod"
  op: "Prod"
  input: "loss/gradients/loss/loss_function_grad/Shape_1"
  input: "loss/gradients/loss/loss_function_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Prod_1"
  op: "Prod"
  input: "loss/gradients/loss/loss_function_grad/Shape_2"
  input: "loss/gradients/loss/loss_function_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Maximum"
  op: "Maximum"
  input: "loss/gradients/loss/loss_function_grad/Prod_1"
  input: "loss/gradients/loss/loss_function_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/floordiv"
  op: "Div"
  input: "loss/gradients/loss/loss_function_grad/Prod"
  input: "loss/gradients/loss/loss_function_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/Cast"
  op: "Cast"
  input: "loss/gradients/loss/loss_function_grad/floordiv"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/gradients/loss/loss_function_grad/truediv"
  op: "Div"
  input: "loss/gradients/loss/loss_function_grad/Tile"
  input: "loss/gradients/loss/loss_function_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/Neg_grad/Neg"
  op: "Neg"
  input: "loss/gradients/loss/loss_function_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/Shape"
  op: "Shape"
  input: "loss/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/Size"
  op: "Size"
  input: "loss/gradients/loss/Sum_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/add"
  op: "Add"
  input: "loss/Sum/reduction_indices"
  input: "loss/gradients/loss/Sum_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/mod"
  op: "Mod"
  input: "loss/gradients/loss/Sum_grad/add"
  input: "loss/gradients/loss/Sum_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/Shape_1"
  op: "Shape"
  input: "loss/gradients/loss/Sum_grad/mod"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/range"
  op: "Range"
  input: "loss/gradients/loss/Sum_grad/range/start"
  input: "loss/gradients/loss/Sum_grad/Size"
  input: "loss/gradients/loss/Sum_grad/range/delta"
}
node {
  name: "loss/gradients/loss/Sum_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/Fill"
  op: "Fill"
  input: "loss/gradients/loss/Sum_grad/Shape_1"
  input: "loss/gradients/loss/Sum_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "loss/gradients/loss/Sum_grad/range"
  input: "loss/gradients/loss/Sum_grad/mod"
  input: "loss/gradients/loss/Sum_grad/Shape"
  input: "loss/gradients/loss/Sum_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/Maximum"
  op: "Maximum"
  input: "loss/gradients/loss/Sum_grad/DynamicStitch"
  input: "loss/gradients/loss/Sum_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/floordiv"
  op: "Div"
  input: "loss/gradients/loss/Sum_grad/Shape"
  input: "loss/gradients/loss/Sum_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/Reshape"
  op: "Reshape"
  input: "loss/gradients/loss/Neg_grad/Neg"
  input: "loss/gradients/loss/Sum_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/Sum_grad/Tile"
  op: "Tile"
  input: "loss/gradients/loss/Sum_grad/Reshape"
  input: "loss/gradients/loss/Sum_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/mul_grad/Shape"
  op: "Shape"
  input: "input_layer/targets_matrix"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/mul_grad/Shape_1"
  op: "Shape"
  input: "loss/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "loss/gradients/loss/mul_grad/Shape"
  input: "loss/gradients/loss/mul_grad/Shape_1"
}
node {
  name: "loss/gradients/loss/mul_grad/mul"
  op: "Mul"
  input: "loss/gradients/loss/Sum_grad/Tile"
  input: "loss/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/mul_grad/Sum"
  op: "Sum"
  input: "loss/gradients/loss/mul_grad/mul"
  input: "loss/gradients/loss/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/loss/mul_grad/Reshape"
  op: "Reshape"
  input: "loss/gradients/loss/mul_grad/Sum"
  input: "loss/gradients/loss/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/mul_grad/mul_1"
  op: "Mul"
  input: "input_layer/targets_matrix"
  input: "loss/gradients/loss/Sum_grad/Tile"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/mul_grad/Sum_1"
  op: "Sum"
  input: "loss/gradients/loss/mul_grad/mul_1"
  input: "loss/gradients/loss/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/loss/mul_grad/Reshape_1"
  op: "Reshape"
  input: "loss/gradients/loss/mul_grad/Sum_1"
  input: "loss/gradients/loss/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^loss/gradients/loss/mul_grad/Reshape"
  input: "^loss/gradients/loss/mul_grad/Reshape_1"
}
node {
  name: "loss/gradients/loss/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "loss/gradients/loss/mul_grad/Reshape"
  input: "^loss/gradients/loss/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/loss/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "loss/gradients/loss/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "loss/gradients/loss/mul_grad/Reshape_1"
  input: "^loss/gradients/loss/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/loss/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "loss/gradients/loss/Log_grad/Inv"
  op: "Inv"
  input: "output_layer/output_node"
  input: "^loss/gradients/loss/mul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/loss/Log_grad/mul"
  op: "Mul"
  input: "loss/gradients/loss/mul_grad/tuple/control_dependency_1"
  input: "loss/gradients/loss/Log_grad/Inv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/output_layer/output_node_grad/mul"
  op: "Mul"
  input: "loss/gradients/loss/Log_grad/mul"
  input: "output_layer/output_node"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/output_layer/output_node_grad/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/gradients/output_layer/output_node_grad/Sum"
  op: "Sum"
  input: "loss/gradients/output_layer/output_node_grad/mul"
  input: "loss/gradients/output_layer/output_node_grad/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/output_layer/output_node_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377\001\000\000\000"
      }
    }
  }
}
node {
  name: "loss/gradients/output_layer/output_node_grad/Reshape"
  op: "Reshape"
  input: "loss/gradients/output_layer/output_node_grad/Sum"
  input: "loss/gradients/output_layer/output_node_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/output_layer/output_node_grad/sub"
  op: "Sub"
  input: "loss/gradients/loss/Log_grad/mul"
  input: "loss/gradients/output_layer/output_node_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/output_layer/output_node_grad/mul_1"
  op: "Mul"
  input: "loss/gradients/output_layer/output_node_grad/sub"
  input: "output_layer/output_node"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/output_layer/add_grad/Shape"
  op: "Shape"
  input: "output_layer/output_matrix"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/output_layer/add_grad/Shape_1"
  op: "Shape"
  input: "output_layer/bias_vector_out/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/output_layer/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "loss/gradients/output_layer/add_grad/Shape"
  input: "loss/gradients/output_layer/add_grad/Shape_1"
}
node {
  name: "loss/gradients/output_layer/add_grad/Sum"
  op: "Sum"
  input: "loss/gradients/output_layer/output_node_grad/mul_1"
  input: "loss/gradients/output_layer/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/output_layer/add_grad/Reshape"
  op: "Reshape"
  input: "loss/gradients/output_layer/add_grad/Sum"
  input: "loss/gradients/output_layer/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/output_layer/add_grad/Sum_1"
  op: "Sum"
  input: "loss/gradients/output_layer/output_node_grad/mul_1"
  input: "loss/gradients/output_layer/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/output_layer/add_grad/Reshape_1"
  op: "Reshape"
  input: "loss/gradients/output_layer/add_grad/Sum_1"
  input: "loss/gradients/output_layer/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/output_layer/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^loss/gradients/output_layer/add_grad/Reshape"
  input: "^loss/gradients/output_layer/add_grad/Reshape_1"
}
node {
  name: "loss/gradients/output_layer/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "loss/gradients/output_layer/add_grad/Reshape"
  input: "^loss/gradients/output_layer/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/output_layer/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "loss/gradients/output_layer/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "loss/gradients/output_layer/add_grad/Reshape_1"
  input: "^loss/gradients/output_layer/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/output_layer/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "loss/gradients/output_layer/output_matrix_grad/MatMul"
  op: "MatMul"
  input: "loss/gradients/output_layer/add_grad/tuple/control_dependency"
  input: "output_layer/weight_matrix_out/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "loss/gradients/output_layer/output_matrix_grad/MatMul_1"
  op: "MatMul"
  input: "hidden_layer3/hidden_matrix_nonlinear_h3"
  input: "loss/gradients/output_layer/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/output_layer/output_matrix_grad/tuple/group_deps"
  op: "NoOp"
  input: "^loss/gradients/output_layer/output_matrix_grad/MatMul"
  input: "^loss/gradients/output_layer/output_matrix_grad/MatMul_1"
}
node {
  name: "loss/gradients/output_layer/output_matrix_grad/tuple/control_dependency"
  op: "Identity"
  input: "loss/gradients/output_layer/output_matrix_grad/MatMul"
  input: "^loss/gradients/output_layer/output_matrix_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/output_layer/output_matrix_grad/MatMul"
      }
    }
  }
}
node {
  name: "loss/gradients/output_layer/output_matrix_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "loss/gradients/output_layer/output_matrix_grad/MatMul_1"
  input: "^loss/gradients/output_layer/output_matrix_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/output_layer/output_matrix_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/hidden_matrix_nonlinear_h3_grad/ReluGrad"
  op: "ReluGrad"
  input: "loss/gradients/output_layer/output_matrix_grad/tuple/control_dependency"
  input: "hidden_layer3/hidden_matrix_nonlinear_h3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/add_grad/Shape"
  op: "Shape"
  input: "hidden_layer3/hidden_matrix_linear_h3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/add_grad/Shape_1"
  op: "Shape"
  input: "hidden_layer3/bias_vector_h3/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "loss/gradients/hidden_layer3/add_grad/Shape"
  input: "loss/gradients/hidden_layer3/add_grad/Shape_1"
}
node {
  name: "loss/gradients/hidden_layer3/add_grad/Sum"
  op: "Sum"
  input: "loss/gradients/hidden_layer3/hidden_matrix_nonlinear_h3_grad/ReluGrad"
  input: "loss/gradients/hidden_layer3/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/add_grad/Reshape"
  op: "Reshape"
  input: "loss/gradients/hidden_layer3/add_grad/Sum"
  input: "loss/gradients/hidden_layer3/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/add_grad/Sum_1"
  op: "Sum"
  input: "loss/gradients/hidden_layer3/hidden_matrix_nonlinear_h3_grad/ReluGrad"
  input: "loss/gradients/hidden_layer3/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/add_grad/Reshape_1"
  op: "Reshape"
  input: "loss/gradients/hidden_layer3/add_grad/Sum_1"
  input: "loss/gradients/hidden_layer3/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^loss/gradients/hidden_layer3/add_grad/Reshape"
  input: "^loss/gradients/hidden_layer3/add_grad/Reshape_1"
}
node {
  name: "loss/gradients/hidden_layer3/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "loss/gradients/hidden_layer3/add_grad/Reshape"
  input: "^loss/gradients/hidden_layer3/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer3/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "loss/gradients/hidden_layer3/add_grad/Reshape_1"
  input: "^loss/gradients/hidden_layer3/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer3/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/MatMul"
  op: "MatMul"
  input: "loss/gradients/hidden_layer3/add_grad/tuple/control_dependency"
  input: "hidden_layer3/weight_matrix_h3/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/MatMul_1"
  op: "MatMul"
  input: "hidden_layer2/hidden_matrix_nonlinear_h2"
  input: "loss/gradients/hidden_layer3/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/MatMul"
  input: "^loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/MatMul_1"
}
node {
  name: "loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/tuple/control_dependency"
  op: "Identity"
  input: "loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/MatMul"
  input: "^loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/MatMul"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/MatMul_1"
  input: "^loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/hidden_matrix_nonlinear_h2_grad/ReluGrad"
  op: "ReluGrad"
  input: "loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/tuple/control_dependency"
  input: "hidden_layer2/hidden_matrix_nonlinear_h2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/add_grad/Shape"
  op: "Shape"
  input: "hidden_layer2/hidden_matrix_linear_h2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/add_grad/Shape_1"
  op: "Shape"
  input: "hidden_layer2/bias_vector_h2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "loss/gradients/hidden_layer2/add_grad/Shape"
  input: "loss/gradients/hidden_layer2/add_grad/Shape_1"
}
node {
  name: "loss/gradients/hidden_layer2/add_grad/Sum"
  op: "Sum"
  input: "loss/gradients/hidden_layer2/hidden_matrix_nonlinear_h2_grad/ReluGrad"
  input: "loss/gradients/hidden_layer2/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/add_grad/Reshape"
  op: "Reshape"
  input: "loss/gradients/hidden_layer2/add_grad/Sum"
  input: "loss/gradients/hidden_layer2/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/add_grad/Sum_1"
  op: "Sum"
  input: "loss/gradients/hidden_layer2/hidden_matrix_nonlinear_h2_grad/ReluGrad"
  input: "loss/gradients/hidden_layer2/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/add_grad/Reshape_1"
  op: "Reshape"
  input: "loss/gradients/hidden_layer2/add_grad/Sum_1"
  input: "loss/gradients/hidden_layer2/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^loss/gradients/hidden_layer2/add_grad/Reshape"
  input: "^loss/gradients/hidden_layer2/add_grad/Reshape_1"
}
node {
  name: "loss/gradients/hidden_layer2/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "loss/gradients/hidden_layer2/add_grad/Reshape"
  input: "^loss/gradients/hidden_layer2/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer2/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "loss/gradients/hidden_layer2/add_grad/Reshape_1"
  input: "^loss/gradients/hidden_layer2/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer2/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/MatMul"
  op: "MatMul"
  input: "loss/gradients/hidden_layer2/add_grad/tuple/control_dependency"
  input: "hidden_layer2/weight_matrix_h2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/MatMul_1"
  op: "MatMul"
  input: "hidden_layer1/hidden_matrix_nonlinear_h1"
  input: "loss/gradients/hidden_layer2/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/MatMul"
  input: "^loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/MatMul_1"
}
node {
  name: "loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/tuple/control_dependency"
  op: "Identity"
  input: "loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/MatMul"
  input: "^loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/MatMul"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/MatMul_1"
  input: "^loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/hidden_matrix_nonlinear_h1_grad/ReluGrad"
  op: "ReluGrad"
  input: "loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/tuple/control_dependency"
  input: "hidden_layer1/hidden_matrix_nonlinear_h1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/add_grad/Shape"
  op: "Shape"
  input: "hidden_layer1/input_node"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/add_grad/Shape_1"
  op: "Shape"
  input: "hidden_layer1/bias_vector_h1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "loss/gradients/hidden_layer1/add_grad/Shape"
  input: "loss/gradients/hidden_layer1/add_grad/Shape_1"
}
node {
  name: "loss/gradients/hidden_layer1/add_grad/Sum"
  op: "Sum"
  input: "loss/gradients/hidden_layer1/hidden_matrix_nonlinear_h1_grad/ReluGrad"
  input: "loss/gradients/hidden_layer1/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/add_grad/Reshape"
  op: "Reshape"
  input: "loss/gradients/hidden_layer1/add_grad/Sum"
  input: "loss/gradients/hidden_layer1/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/add_grad/Sum_1"
  op: "Sum"
  input: "loss/gradients/hidden_layer1/hidden_matrix_nonlinear_h1_grad/ReluGrad"
  input: "loss/gradients/hidden_layer1/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/add_grad/Reshape_1"
  op: "Reshape"
  input: "loss/gradients/hidden_layer1/add_grad/Sum_1"
  input: "loss/gradients/hidden_layer1/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^loss/gradients/hidden_layer1/add_grad/Reshape"
  input: "^loss/gradients/hidden_layer1/add_grad/Reshape_1"
}
node {
  name: "loss/gradients/hidden_layer1/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "loss/gradients/hidden_layer1/add_grad/Reshape"
  input: "^loss/gradients/hidden_layer1/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer1/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "loss/gradients/hidden_layer1/add_grad/Reshape_1"
  input: "^loss/gradients/hidden_layer1/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer1/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/input_node_grad/MatMul"
  op: "MatMul"
  input: "loss/gradients/hidden_layer1/add_grad/tuple/control_dependency"
  input: "hidden_layer1/weight_matrix_h1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/input_node_grad/MatMul_1"
  op: "MatMul"
  input: "input_layer/features_matrix"
  input: "loss/gradients/hidden_layer1/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/input_node_grad/tuple/group_deps"
  op: "NoOp"
  input: "^loss/gradients/hidden_layer1/input_node_grad/MatMul"
  input: "^loss/gradients/hidden_layer1/input_node_grad/MatMul_1"
}
node {
  name: "loss/gradients/hidden_layer1/input_node_grad/tuple/control_dependency"
  op: "Identity"
  input: "loss/gradients/hidden_layer1/input_node_grad/MatMul"
  input: "^loss/gradients/hidden_layer1/input_node_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer1/input_node_grad/MatMul"
      }
    }
  }
}
node {
  name: "loss/gradients/hidden_layer1/input_node_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "loss/gradients/hidden_layer1/input_node_grad/MatMul_1"
  input: "^loss/gradients/hidden_layer1/input_node_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/gradients/hidden_layer1/input_node_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "loss/GradientDescent/learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.5
      }
    }
  }
}
node {
  name: "loss/GradientDescent/update_hidden_layer1/weight_matrix_h1/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "hidden_layer1/weight_matrix_h1"
  input: "loss/GradientDescent/learning_rate"
  input: "loss/gradients/hidden_layer1/input_node_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer1/weight_matrix_h1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "loss/GradientDescent/update_hidden_layer1/bias_vector_h1/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "hidden_layer1/bias_vector_h1"
  input: "loss/GradientDescent/learning_rate"
  input: "loss/gradients/hidden_layer1/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer1/bias_vector_h1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "loss/GradientDescent/update_hidden_layer2/weight_matrix_h2/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "hidden_layer2/weight_matrix_h2"
  input: "loss/GradientDescent/learning_rate"
  input: "loss/gradients/hidden_layer2/hidden_matrix_linear_h2_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer2/weight_matrix_h2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "loss/GradientDescent/update_hidden_layer2/bias_vector_h2/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "hidden_layer2/bias_vector_h2"
  input: "loss/GradientDescent/learning_rate"
  input: "loss/gradients/hidden_layer2/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer2/bias_vector_h2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "loss/GradientDescent/update_hidden_layer3/weight_matrix_h3/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "hidden_layer3/weight_matrix_h3"
  input: "loss/GradientDescent/learning_rate"
  input: "loss/gradients/hidden_layer3/hidden_matrix_linear_h3_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer3/weight_matrix_h3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "loss/GradientDescent/update_hidden_layer3/bias_vector_h3/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "hidden_layer3/bias_vector_h3"
  input: "loss/GradientDescent/learning_rate"
  input: "loss/gradients/hidden_layer3/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer3/bias_vector_h3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "loss/GradientDescent/update_output_layer/weight_matrix_out/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "output_layer/weight_matrix_out"
  input: "loss/GradientDescent/learning_rate"
  input: "loss/gradients/output_layer/output_matrix_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@output_layer/weight_matrix_out"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "loss/GradientDescent/update_output_layer/bias_vector_out/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "output_layer/bias_vector_out"
  input: "loss/GradientDescent/learning_rate"
  input: "loss/gradients/output_layer/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@output_layer/bias_vector_out"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "loss/GradientDescent"
  op: "NoOp"
  input: "^loss/GradientDescent/update_hidden_layer1/weight_matrix_h1/ApplyGradientDescent"
  input: "^loss/GradientDescent/update_hidden_layer1/bias_vector_h1/ApplyGradientDescent"
  input: "^loss/GradientDescent/update_hidden_layer2/weight_matrix_h2/ApplyGradientDescent"
  input: "^loss/GradientDescent/update_hidden_layer2/bias_vector_h2/ApplyGradientDescent"
  input: "^loss/GradientDescent/update_hidden_layer3/weight_matrix_h3/ApplyGradientDescent"
  input: "^loss/GradientDescent/update_hidden_layer3/bias_vector_h3/ApplyGradientDescent"
  input: "^loss/GradientDescent/update_output_layer/weight_matrix_out/ApplyGradientDescent"
  input: "^loss/GradientDescent/update_output_layer/bias_vector_out/ApplyGradientDescent"
}
node {
  name: "loss_1/ArgMax/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss_1/ArgMax"
  op: "ArgMax"
  input: "input_layer/targets_matrix"
  input: "loss_1/ArgMax/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_1/ArgMax_1/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss_1/ArgMax_1"
  op: "ArgMax"
  input: "output_layer/output_node"
  input: "loss_1/ArgMax_1/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_1/predictions_vector"
  op: "Equal"
  input: "loss_1/ArgMax"
  input: "loss_1/ArgMax_1"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "loss_1/Cast"
  op: "Cast"
  input: "loss_1/predictions_vector"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "loss_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss_1/accuracy_function"
  op: "Mean"
  input: "loss_1/Cast"
  input: "loss_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "init"
  op: "NoOp"
  input: "^hidden_layer1/weight_matrix_h1/Assign"
  input: "^hidden_layer1/bias_vector_h1/Assign"
  input: "^hidden_layer2/weight_matrix_h2/Assign"
  input: "^hidden_layer2/bias_vector_h2/Assign"
  input: "^hidden_layer3/weight_matrix_h3/Assign"
  input: "^hidden_layer3/bias_vector_h3/Assign"
  input: "^output_layer/weight_matrix_out/Assign"
  input: "^output_layer/bias_vector_out/Assign"
}
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/save/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 8
          }
        }
        string_val: "hidden_layer1/bias_vector_h1"
        string_val: "hidden_layer1/weight_matrix_h1"
        string_val: "hidden_layer2/bias_vector_h2"
        string_val: "hidden_layer2/weight_matrix_h2"
        string_val: "hidden_layer3/bias_vector_h3"
        string_val: "hidden_layer3/weight_matrix_h3"
        string_val: "output_layer/bias_vector_out"
        string_val: "output_layer/weight_matrix_out"
      }
    }
  }
}
node {
  name: "save/save/shapes_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 8
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/save"
  op: "SaveSlices"
  input: "save/Const"
  input: "save/save/tensor_names"
  input: "save/save/shapes_and_slices"
  input: "hidden_layer1/bias_vector_h1"
  input: "hidden_layer1/weight_matrix_h1"
  input: "hidden_layer2/bias_vector_h2"
  input: "hidden_layer2/weight_matrix_h2"
  input: "hidden_layer3/bias_vector_h3"
  input: "hidden_layer3/weight_matrix_h3"
  input: "output_layer/bias_vector_out"
  input: "output_layer/weight_matrix_out"
  attr {
    key: "T"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/save"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/restore_slice/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "hidden_layer1/bias_vector_h1"
      }
    }
  }
}
node {
  name: "save/restore_slice/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice/tensor_name"
  input: "save/restore_slice/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "hidden_layer1/bias_vector_h1"
  input: "save/restore_slice"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer1/bias_vector_h1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_1/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "hidden_layer1/weight_matrix_h1"
      }
    }
  }
}
node {
  name: "save/restore_slice_1/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_1"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_1/tensor_name"
  input: "save/restore_slice_1/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "hidden_layer1/weight_matrix_h1"
  input: "save/restore_slice_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer1/weight_matrix_h1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_2/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "hidden_layer2/bias_vector_h2"
      }
    }
  }
}
node {
  name: "save/restore_slice_2/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_2"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_2/tensor_name"
  input: "save/restore_slice_2/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "hidden_layer2/bias_vector_h2"
  input: "save/restore_slice_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer2/bias_vector_h2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_3/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "hidden_layer2/weight_matrix_h2"
      }
    }
  }
}
node {
  name: "save/restore_slice_3/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_3"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_3/tensor_name"
  input: "save/restore_slice_3/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "hidden_layer2/weight_matrix_h2"
  input: "save/restore_slice_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer2/weight_matrix_h2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_4/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "hidden_layer3/bias_vector_h3"
      }
    }
  }
}
node {
  name: "save/restore_slice_4/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_4"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_4/tensor_name"
  input: "save/restore_slice_4/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "hidden_layer3/bias_vector_h3"
  input: "save/restore_slice_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer3/bias_vector_h3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_5/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "hidden_layer3/weight_matrix_h3"
      }
    }
  }
}
node {
  name: "save/restore_slice_5/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_5"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_5/tensor_name"
  input: "save/restore_slice_5/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "hidden_layer3/weight_matrix_h3"
  input: "save/restore_slice_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@hidden_layer3/weight_matrix_h3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_6/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "output_layer/bias_vector_out"
      }
    }
  }
}
node {
  name: "save/restore_slice_6/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_6"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_6/tensor_name"
  input: "save/restore_slice_6/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "output_layer/bias_vector_out"
  input: "save/restore_slice_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@output_layer/bias_vector_out"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_7/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "output_layer/weight_matrix_out"
      }
    }
  }
}
node {
  name: "save/restore_slice_7/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_7"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_7/tensor_name"
  input: "save/restore_slice_7/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "output_layer/weight_matrix_out"
  input: "save/restore_slice_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@output_layer/weight_matrix_out"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
}
versions {
  producer: 10
}
