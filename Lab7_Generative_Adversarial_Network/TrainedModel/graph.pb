node {
  name: "model/generator/input_node"
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
        dim {
          size: 100
        }
        dim {
          size: 10
        }
      }
    }
  }
}
node {
  name: "model/generator/H1/linear/W"
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
        dim {
          size: 6272
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
  name: "model/generator/H1/linear/W/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
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
        tensor_content: "\n\000\000\000\200\030\000\000"
      }
    }
  }
}
node {
  name: "model/generator/H1/linear/W/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
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
  name: "model/generator/H1/linear/W/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
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
        float_val: 0.019999999553
      }
    }
  }
}
node {
  name: "model/generator/H1/linear/W/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "model/generator/H1/linear/W/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/W"
      }
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
  name: "model/generator/H1/linear/W/Initializer/random_normal/mul"
  op: "Mul"
  input: "model/generator/H1/linear/W/Initializer/random_normal/RandomStandardNormal"
  input: "model/generator/H1/linear/W/Initializer/random_normal/stddev"
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
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
}
node {
  name: "model/generator/H1/linear/W/Initializer/random_normal"
  op: "Add"
  input: "model/generator/H1/linear/W/Initializer/random_normal/mul"
  input: "model/generator/H1/linear/W/Initializer/random_normal/mean"
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
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
}
node {
  name: "model/generator/H1/linear/W/Assign"
  op: "Assign"
  input: "model/generator/H1/linear/W"
  input: "model/generator/H1/linear/W/Initializer/random_normal"
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
        s: "loc:@model/generator/H1/linear/W"
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
  name: "model/generator/H1/linear/W/read"
  op: "Identity"
  input: "model/generator/H1/linear/W"
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
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
}
node {
  name: "model/generator/H1/linear/b"
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
          size: 6272
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
  name: "model/generator/H1/linear/b/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/b"
      }
    }
  }
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
          dim {
            size: 6272
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "model/generator/H1/linear/b/Assign"
  op: "Assign"
  input: "model/generator/H1/linear/b"
  input: "model/generator/H1/linear/b/Initializer/Const"
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
        s: "loc:@model/generator/H1/linear/b"
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
  name: "model/generator/H1/linear/b/read"
  op: "Identity"
  input: "model/generator/H1/linear/b"
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
        s: "loc:@model/generator/H1/linear/b"
      }
    }
  }
}
node {
  name: "model/generator/H1/linear/MatMul"
  op: "MatMul"
  input: "model/generator/input_node"
  input: "model/generator/H1/linear/W/read"
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
  name: "model/generator/H1/linear/add"
  op: "Add"
  input: "model/generator/H1/linear/MatMul"
  input: "model/generator/H1/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/generator/H1/relu"
  op: "Relu"
  input: "model/generator/H1/linear/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/generator/H1/reshape/shape"
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
            size: 4
          }
        }
        tensor_content: "d\000\000\000\007\000\000\000\007\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "model/generator/H1/reshape"
  op: "Reshape"
  input: "model/generator/H1/relu"
  input: "model/generator/H1/reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/generator/D1/deconv/W"
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 128
        }
        dim {
          size: 128
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
  name: "model/generator/D1/deconv/W/Initializer/truncated_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D1/deconv/W"
      }
    }
  }
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
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "model/generator/D1/deconv/W/Initializer/truncated_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D1/deconv/W"
      }
    }
  }
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
  name: "model/generator/D1/deconv/W/Initializer/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D1/deconv/W"
      }
    }
  }
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
        float_val: 0.019999999553
      }
    }
  }
}
node {
  name: "model/generator/D1/deconv/W/Initializer/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "model/generator/D1/deconv/W/Initializer/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D1/deconv/W"
      }
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
  name: "model/generator/D1/deconv/W/Initializer/truncated_normal/mul"
  op: "Mul"
  input: "model/generator/D1/deconv/W/Initializer/truncated_normal/TruncatedNormal"
  input: "model/generator/D1/deconv/W/Initializer/truncated_normal/stddev"
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
        s: "loc:@model/generator/D1/deconv/W"
      }
    }
  }
}
node {
  name: "model/generator/D1/deconv/W/Initializer/truncated_normal"
  op: "Add"
  input: "model/generator/D1/deconv/W/Initializer/truncated_normal/mul"
  input: "model/generator/D1/deconv/W/Initializer/truncated_normal/mean"
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
        s: "loc:@model/generator/D1/deconv/W"
      }
    }
  }
}
node {
  name: "model/generator/D1/deconv/W/Assign"
  op: "Assign"
  input: "model/generator/D1/deconv/W"
  input: "model/generator/D1/deconv/W/Initializer/truncated_normal"
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
        s: "loc:@model/generator/D1/deconv/W"
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
  name: "model/generator/D1/deconv/W/read"
  op: "Identity"
  input: "model/generator/D1/deconv/W"
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
        s: "loc:@model/generator/D1/deconv/W"
      }
    }
  }
}
node {
  name: "model/generator/D1/deconv/b"
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
          size: 128
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
  name: "model/generator/D1/deconv/b/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D1/deconv/b"
      }
    }
  }
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
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "model/generator/D1/deconv/b/Assign"
  op: "Assign"
  input: "model/generator/D1/deconv/b"
  input: "model/generator/D1/deconv/b/Initializer/Const"
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
        s: "loc:@model/generator/D1/deconv/b"
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
  name: "model/generator/D1/deconv/b/read"
  op: "Identity"
  input: "model/generator/D1/deconv/b"
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
        s: "loc:@model/generator/D1/deconv/b"
      }
    }
  }
}
node {
  name: "model/generator/D1/deconv/conv2d_transpose/output_shape"
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
            size: 4
          }
        }
        tensor_content: "d\000\000\000\016\000\000\000\016\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "model/generator/D1/deconv/conv2d_transpose"
  op: "Conv2DBackpropInput"
  input: "model/generator/D1/deconv/conv2d_transpose/output_shape"
  input: "model/generator/D1/deconv/W/read"
  input: "model/generator/H1/reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "model/generator/D1/deconv/add"
  op: "Add"
  input: "model/generator/D1/deconv/conv2d_transpose"
  input: "model/generator/D1/deconv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/generator/D1/relu"
  op: "Relu"
  input: "model/generator/D1/deconv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/generator/D2/deconv/W"
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 128
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
  name: "model/generator/D2/deconv/W/Initializer/truncated_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D2/deconv/W"
      }
    }
  }
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
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\001\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "model/generator/D2/deconv/W/Initializer/truncated_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D2/deconv/W"
      }
    }
  }
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
  name: "model/generator/D2/deconv/W/Initializer/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D2/deconv/W"
      }
    }
  }
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
        float_val: 0.019999999553
      }
    }
  }
}
node {
  name: "model/generator/D2/deconv/W/Initializer/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "model/generator/D2/deconv/W/Initializer/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D2/deconv/W"
      }
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
  name: "model/generator/D2/deconv/W/Initializer/truncated_normal/mul"
  op: "Mul"
  input: "model/generator/D2/deconv/W/Initializer/truncated_normal/TruncatedNormal"
  input: "model/generator/D2/deconv/W/Initializer/truncated_normal/stddev"
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
        s: "loc:@model/generator/D2/deconv/W"
      }
    }
  }
}
node {
  name: "model/generator/D2/deconv/W/Initializer/truncated_normal"
  op: "Add"
  input: "model/generator/D2/deconv/W/Initializer/truncated_normal/mul"
  input: "model/generator/D2/deconv/W/Initializer/truncated_normal/mean"
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
        s: "loc:@model/generator/D2/deconv/W"
      }
    }
  }
}
node {
  name: "model/generator/D2/deconv/W/Assign"
  op: "Assign"
  input: "model/generator/D2/deconv/W"
  input: "model/generator/D2/deconv/W/Initializer/truncated_normal"
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
        s: "loc:@model/generator/D2/deconv/W"
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
  name: "model/generator/D2/deconv/W/read"
  op: "Identity"
  input: "model/generator/D2/deconv/W"
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
        s: "loc:@model/generator/D2/deconv/W"
      }
    }
  }
}
node {
  name: "model/generator/D2/deconv/b"
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
          size: 1
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
  name: "model/generator/D2/deconv/b/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D2/deconv/b"
      }
    }
  }
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
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "model/generator/D2/deconv/b/Assign"
  op: "Assign"
  input: "model/generator/D2/deconv/b"
  input: "model/generator/D2/deconv/b/Initializer/Const"
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
        s: "loc:@model/generator/D2/deconv/b"
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
  name: "model/generator/D2/deconv/b/read"
  op: "Identity"
  input: "model/generator/D2/deconv/b"
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
        s: "loc:@model/generator/D2/deconv/b"
      }
    }
  }
}
node {
  name: "model/generator/D2/deconv/conv2d_transpose/output_shape"
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
            size: 4
          }
        }
        tensor_content: "d\000\000\000\034\000\000\000\034\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "model/generator/D2/deconv/conv2d_transpose"
  op: "Conv2DBackpropInput"
  input: "model/generator/D2/deconv/conv2d_transpose/output_shape"
  input: "model/generator/D2/deconv/W/read"
  input: "model/generator/D1/relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "model/generator/D2/deconv/add"
  op: "Add"
  input: "model/generator/D2/deconv/conv2d_transpose"
  input: "model/generator/D2/deconv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/generator/D2/output_node"
  op: "Sigmoid"
  input: "model/generator/D2/deconv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/true_images"
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
  name: "model/discriminator/input_node/shape"
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
            size: 4
          }
        }
        tensor_content: "d\000\000\000\034\000\000\000\034\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "model/discriminator/input_node"
  op: "Reshape"
  input: "model/discriminator/true_images"
  input: "model/discriminator/input_node/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C1/conv/W"
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 32
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
  name: "model/discriminator/C1/conv/W/Initializer/truncated_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
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
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "model/discriminator/C1/conv/W/Initializer/truncated_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
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
  name: "model/discriminator/C1/conv/W/Initializer/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
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
        float_val: 0.019999999553
      }
    }
  }
}
node {
  name: "model/discriminator/C1/conv/W/Initializer/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "model/discriminator/C1/conv/W/Initializer/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/W"
      }
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
  name: "model/discriminator/C1/conv/W/Initializer/truncated_normal/mul"
  op: "Mul"
  input: "model/discriminator/C1/conv/W/Initializer/truncated_normal/TruncatedNormal"
  input: "model/discriminator/C1/conv/W/Initializer/truncated_normal/stddev"
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
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
}
node {
  name: "model/discriminator/C1/conv/W/Initializer/truncated_normal"
  op: "Add"
  input: "model/discriminator/C1/conv/W/Initializer/truncated_normal/mul"
  input: "model/discriminator/C1/conv/W/Initializer/truncated_normal/mean"
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
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
}
node {
  name: "model/discriminator/C1/conv/W/Assign"
  op: "Assign"
  input: "model/discriminator/C1/conv/W"
  input: "model/discriminator/C1/conv/W/Initializer/truncated_normal"
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
        s: "loc:@model/discriminator/C1/conv/W"
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
  name: "model/discriminator/C1/conv/W/read"
  op: "Identity"
  input: "model/discriminator/C1/conv/W"
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
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
}
node {
  name: "model/discriminator/C1/conv/b"
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
          size: 32
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
  name: "model/discriminator/C1/conv/b/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/b"
      }
    }
  }
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
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "model/discriminator/C1/conv/b/Assign"
  op: "Assign"
  input: "model/discriminator/C1/conv/b"
  input: "model/discriminator/C1/conv/b/Initializer/Const"
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
        s: "loc:@model/discriminator/C1/conv/b"
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
  name: "model/discriminator/C1/conv/b/read"
  op: "Identity"
  input: "model/discriminator/C1/conv/b"
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
        s: "loc:@model/discriminator/C1/conv/b"
      }
    }
  }
}
node {
  name: "model/discriminator/C1/conv/Conv2D"
  op: "Conv2D"
  input: "model/discriminator/input_node"
  input: "model/discriminator/C1/conv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "model/discriminator/C1/conv/add"
  op: "Add"
  input: "model/discriminator/C1/conv/Conv2D"
  input: "model/discriminator/C1/conv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C1/mul/x"
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
        float_val: 0.20000000298
      }
    }
  }
}
node {
  name: "model/discriminator/C1/mul"
  op: "Mul"
  input: "model/discriminator/C1/mul/x"
  input: "model/discriminator/C1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C1/lrelu"
  op: "Maximum"
  input: "model/discriminator/C1/conv/add"
  input: "model/discriminator/C1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C2/conv/W"
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
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
  name: "model/discriminator/C2/conv/W/Initializer/truncated_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C2/conv/W"
      }
    }
  }
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
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "model/discriminator/C2/conv/W/Initializer/truncated_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C2/conv/W"
      }
    }
  }
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
  name: "model/discriminator/C2/conv/W/Initializer/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C2/conv/W"
      }
    }
  }
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
        float_val: 0.019999999553
      }
    }
  }
}
node {
  name: "model/discriminator/C2/conv/W/Initializer/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "model/discriminator/C2/conv/W/Initializer/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C2/conv/W"
      }
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
  name: "model/discriminator/C2/conv/W/Initializer/truncated_normal/mul"
  op: "Mul"
  input: "model/discriminator/C2/conv/W/Initializer/truncated_normal/TruncatedNormal"
  input: "model/discriminator/C2/conv/W/Initializer/truncated_normal/stddev"
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
        s: "loc:@model/discriminator/C2/conv/W"
      }
    }
  }
}
node {
  name: "model/discriminator/C2/conv/W/Initializer/truncated_normal"
  op: "Add"
  input: "model/discriminator/C2/conv/W/Initializer/truncated_normal/mul"
  input: "model/discriminator/C2/conv/W/Initializer/truncated_normal/mean"
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
        s: "loc:@model/discriminator/C2/conv/W"
      }
    }
  }
}
node {
  name: "model/discriminator/C2/conv/W/Assign"
  op: "Assign"
  input: "model/discriminator/C2/conv/W"
  input: "model/discriminator/C2/conv/W/Initializer/truncated_normal"
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
        s: "loc:@model/discriminator/C2/conv/W"
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
  name: "model/discriminator/C2/conv/W/read"
  op: "Identity"
  input: "model/discriminator/C2/conv/W"
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
        s: "loc:@model/discriminator/C2/conv/W"
      }
    }
  }
}
node {
  name: "model/discriminator/C2/conv/b"
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
          size: 64
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
  name: "model/discriminator/C2/conv/b/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C2/conv/b"
      }
    }
  }
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
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "model/discriminator/C2/conv/b/Assign"
  op: "Assign"
  input: "model/discriminator/C2/conv/b"
  input: "model/discriminator/C2/conv/b/Initializer/Const"
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
        s: "loc:@model/discriminator/C2/conv/b"
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
  name: "model/discriminator/C2/conv/b/read"
  op: "Identity"
  input: "model/discriminator/C2/conv/b"
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
        s: "loc:@model/discriminator/C2/conv/b"
      }
    }
  }
}
node {
  name: "model/discriminator/C2/conv/Conv2D"
  op: "Conv2D"
  input: "model/discriminator/C1/lrelu"
  input: "model/discriminator/C2/conv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "model/discriminator/C2/conv/add"
  op: "Add"
  input: "model/discriminator/C2/conv/Conv2D"
  input: "model/discriminator/C2/conv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C2/mul/x"
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
        float_val: 0.20000000298
      }
    }
  }
}
node {
  name: "model/discriminator/C2/mul"
  op: "Mul"
  input: "model/discriminator/C2/mul/x"
  input: "model/discriminator/C2/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C2/lrelu"
  op: "Maximum"
  input: "model/discriminator/C2/conv/add"
  input: "model/discriminator/C2/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C2/reshape/shape"
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
        tensor_content: "d\000\000\000@\014\000\000"
      }
    }
  }
}
node {
  name: "model/discriminator/C2/reshape"
  op: "Reshape"
  input: "model/discriminator/C2/lrelu"
  input: "model/discriminator/C2/reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/H1/linear/W"
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
          size: 3136
        }
        dim {
          size: 1024
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
  name: "model/discriminator/H1/linear/W/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H1/linear/W"
      }
    }
  }
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
        tensor_content: "@\014\000\000\000\004\000\000"
      }
    }
  }
}
node {
  name: "model/discriminator/H1/linear/W/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H1/linear/W"
      }
    }
  }
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
  name: "model/discriminator/H1/linear/W/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H1/linear/W"
      }
    }
  }
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
        float_val: 0.019999999553
      }
    }
  }
}
node {
  name: "model/discriminator/H1/linear/W/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "model/discriminator/H1/linear/W/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H1/linear/W"
      }
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
  name: "model/discriminator/H1/linear/W/Initializer/random_normal/mul"
  op: "Mul"
  input: "model/discriminator/H1/linear/W/Initializer/random_normal/RandomStandardNormal"
  input: "model/discriminator/H1/linear/W/Initializer/random_normal/stddev"
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
        s: "loc:@model/discriminator/H1/linear/W"
      }
    }
  }
}
node {
  name: "model/discriminator/H1/linear/W/Initializer/random_normal"
  op: "Add"
  input: "model/discriminator/H1/linear/W/Initializer/random_normal/mul"
  input: "model/discriminator/H1/linear/W/Initializer/random_normal/mean"
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
        s: "loc:@model/discriminator/H1/linear/W"
      }
    }
  }
}
node {
  name: "model/discriminator/H1/linear/W/Assign"
  op: "Assign"
  input: "model/discriminator/H1/linear/W"
  input: "model/discriminator/H1/linear/W/Initializer/random_normal"
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
        s: "loc:@model/discriminator/H1/linear/W"
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
  name: "model/discriminator/H1/linear/W/read"
  op: "Identity"
  input: "model/discriminator/H1/linear/W"
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
        s: "loc:@model/discriminator/H1/linear/W"
      }
    }
  }
}
node {
  name: "model/discriminator/H1/linear/b"
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
          size: 1024
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
  name: "model/discriminator/H1/linear/b/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H1/linear/b"
      }
    }
  }
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
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "model/discriminator/H1/linear/b/Assign"
  op: "Assign"
  input: "model/discriminator/H1/linear/b"
  input: "model/discriminator/H1/linear/b/Initializer/Const"
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
        s: "loc:@model/discriminator/H1/linear/b"
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
  name: "model/discriminator/H1/linear/b/read"
  op: "Identity"
  input: "model/discriminator/H1/linear/b"
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
        s: "loc:@model/discriminator/H1/linear/b"
      }
    }
  }
}
node {
  name: "model/discriminator/H1/linear/MatMul"
  op: "MatMul"
  input: "model/discriminator/C2/reshape"
  input: "model/discriminator/H1/linear/W/read"
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
  name: "model/discriminator/H1/linear/add"
  op: "Add"
  input: "model/discriminator/H1/linear/MatMul"
  input: "model/discriminator/H1/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/H2/linear/W"
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
          size: 1024
        }
        dim {
          size: 1
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
  name: "model/discriminator/H2/linear/W/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H2/linear/W"
      }
    }
  }
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
        tensor_content: "\000\004\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "model/discriminator/H2/linear/W/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H2/linear/W"
      }
    }
  }
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
  name: "model/discriminator/H2/linear/W/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H2/linear/W"
      }
    }
  }
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
        float_val: 0.019999999553
      }
    }
  }
}
node {
  name: "model/discriminator/H2/linear/W/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "model/discriminator/H2/linear/W/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H2/linear/W"
      }
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
  name: "model/discriminator/H2/linear/W/Initializer/random_normal/mul"
  op: "Mul"
  input: "model/discriminator/H2/linear/W/Initializer/random_normal/RandomStandardNormal"
  input: "model/discriminator/H2/linear/W/Initializer/random_normal/stddev"
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
        s: "loc:@model/discriminator/H2/linear/W"
      }
    }
  }
}
node {
  name: "model/discriminator/H2/linear/W/Initializer/random_normal"
  op: "Add"
  input: "model/discriminator/H2/linear/W/Initializer/random_normal/mul"
  input: "model/discriminator/H2/linear/W/Initializer/random_normal/mean"
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
        s: "loc:@model/discriminator/H2/linear/W"
      }
    }
  }
}
node {
  name: "model/discriminator/H2/linear/W/Assign"
  op: "Assign"
  input: "model/discriminator/H2/linear/W"
  input: "model/discriminator/H2/linear/W/Initializer/random_normal"
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
        s: "loc:@model/discriminator/H2/linear/W"
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
  name: "model/discriminator/H2/linear/W/read"
  op: "Identity"
  input: "model/discriminator/H2/linear/W"
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
        s: "loc:@model/discriminator/H2/linear/W"
      }
    }
  }
}
node {
  name: "model/discriminator/H2/linear/b"
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
          size: 1
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
  name: "model/discriminator/H2/linear/b/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H2/linear/b"
      }
    }
  }
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
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "model/discriminator/H2/linear/b/Assign"
  op: "Assign"
  input: "model/discriminator/H2/linear/b"
  input: "model/discriminator/H2/linear/b/Initializer/Const"
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
        s: "loc:@model/discriminator/H2/linear/b"
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
  name: "model/discriminator/H2/linear/b/read"
  op: "Identity"
  input: "model/discriminator/H2/linear/b"
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
        s: "loc:@model/discriminator/H2/linear/b"
      }
    }
  }
}
node {
  name: "model/discriminator/H2/linear/MatMul"
  op: "MatMul"
  input: "model/discriminator/H1/linear/add"
  input: "model/discriminator/H2/linear/W/read"
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
  name: "model/discriminator/H2/linear/add"
  op: "Add"
  input: "model/discriminator/H2/linear/MatMul"
  input: "model/discriminator/H2/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/H2/sigmoid_output"
  op: "Sigmoid"
  input: "model/discriminator/H2/linear/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C1_1/conv/Conv2D"
  op: "Conv2D"
  input: "model/generator/D2/output_node"
  input: "model/discriminator/C1/conv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "model/discriminator/C1_1/conv/add"
  op: "Add"
  input: "model/discriminator/C1_1/conv/Conv2D"
  input: "model/discriminator/C1/conv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C1_1/mul/x"
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
        float_val: 0.20000000298
      }
    }
  }
}
node {
  name: "model/discriminator/C1_1/mul"
  op: "Mul"
  input: "model/discriminator/C1_1/mul/x"
  input: "model/discriminator/C1_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C1_1/lrelu"
  op: "Maximum"
  input: "model/discriminator/C1_1/conv/add"
  input: "model/discriminator/C1_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C2_1/conv/Conv2D"
  op: "Conv2D"
  input: "model/discriminator/C1_1/lrelu"
  input: "model/discriminator/C2/conv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "model/discriminator/C2_1/conv/add"
  op: "Add"
  input: "model/discriminator/C2_1/conv/Conv2D"
  input: "model/discriminator/C2/conv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C2_1/mul/x"
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
        float_val: 0.20000000298
      }
    }
  }
}
node {
  name: "model/discriminator/C2_1/mul"
  op: "Mul"
  input: "model/discriminator/C2_1/mul/x"
  input: "model/discriminator/C2_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C2_1/lrelu"
  op: "Maximum"
  input: "model/discriminator/C2_1/conv/add"
  input: "model/discriminator/C2_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/C2_1/reshape/shape"
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
        tensor_content: "d\000\000\000@\014\000\000"
      }
    }
  }
}
node {
  name: "model/discriminator/C2_1/reshape"
  op: "Reshape"
  input: "model/discriminator/C2_1/lrelu"
  input: "model/discriminator/C2_1/reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/H1_1/linear/MatMul"
  op: "MatMul"
  input: "model/discriminator/C2_1/reshape"
  input: "model/discriminator/H1/linear/W/read"
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
  name: "model/discriminator/H1_1/linear/add"
  op: "Add"
  input: "model/discriminator/H1_1/linear/MatMul"
  input: "model/discriminator/H1/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/H2_1/linear/MatMul"
  op: "MatMul"
  input: "model/discriminator/H1_1/linear/add"
  input: "model/discriminator/H2/linear/W/read"
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
  name: "model/discriminator/H2_1/linear/add"
  op: "Add"
  input: "model/discriminator/H2_1/linear/MatMul"
  input: "model/discriminator/H2/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "model/discriminator/H2_1/sigmoid_output"
  op: "Sigmoid"
  input: "model/discriminator/H2_1/linear/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ones"
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
          dim {
            size: 100
          }
          dim {
            size: 1
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "zeros"
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
          dim {
            size: 100
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "loss_function/Log"
  op: "Log"
  input: "model/discriminator/H2/sigmoid_output"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_function/Neg"
  op: "Neg"
  input: "loss_function/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_function/sub/x"
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
  name: "loss_function/sub"
  op: "Sub"
  input: "loss_function/sub/x"
  input: "model/discriminator/H2_1/sigmoid_output"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_function/Log_1"
  op: "Log"
  input: "loss_function/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_function/sub_1"
  op: "Sub"
  input: "loss_function/Neg"
  input: "loss_function/Log_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_function/Rank"
  op: "Rank"
  input: "loss_function/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_function/range/start"
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
  name: "loss_function/range/delta"
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
  name: "loss_function/range"
  op: "Range"
  input: "loss_function/range/start"
  input: "loss_function/Rank"
  input: "loss_function/range/delta"
}
node {
  name: "loss_function/d_loss"
  op: "Mean"
  input: "loss_function/sub_1"
  input: "loss_function/range"
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
  name: "loss_function/Log_2"
  op: "Log"
  input: "model/discriminator/H2_1/sigmoid_output"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_function/Neg_1"
  op: "Neg"
  input: "loss_function/Log_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_function/Rank_1"
  op: "Rank"
  input: "loss_function/Neg_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_function/range_1/start"
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
  name: "loss_function/range_1/delta"
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
  name: "loss_function/range_1"
  op: "Range"
  input: "loss_function/range_1/start"
  input: "loss_function/Rank_1"
  input: "loss_function/range_1/delta"
}
node {
  name: "loss_function/g_loss"
  op: "Mean"
  input: "loss_function/Neg_1"
  input: "loss_function/range_1"
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
  name: "optimization_steps/gradients/Shape"
  op: "Shape"
  input: "loss_function/d_loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/Const"
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
  name: "optimization_steps/gradients/Fill"
  op: "Fill"
  input: "optimization_steps/gradients/Shape"
  input: "optimization_steps/gradients/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Shape"
  op: "Shape"
  input: "loss_function/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Size"
  op: "Size"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/add"
  op: "Add"
  input: "loss_function/range"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/mod"
  op: "Mod"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/add"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Shape_1"
  op: "Shape"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/mod"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/range/start"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/range/delta"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/range"
  op: "Range"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/range/start"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Size"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/range/delta"
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Fill/value"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Fill"
  op: "Fill"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Shape_1"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/range"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/mod"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Shape"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Fill"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Maximum/y"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Maximum"
  op: "Maximum"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/DynamicStitch"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/floordiv"
  op: "Div"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Shape"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/Fill"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Tile"
  op: "Tile"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Reshape"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Shape_2"
  op: "Shape"
  input: "loss_function/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Shape_3"
  op: "Shape"
  input: "loss_function/d_loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Rank"
  op: "Rank"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Shape_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/range_1/start"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/range_1/delta"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/range_1"
  op: "Range"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/range_1/start"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Rank"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/range_1/delta"
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Prod"
  op: "Prod"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Shape_2"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/range_1"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Rank_1"
  op: "Rank"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Shape_3"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/range_2/start"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/range_2/delta"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/range_2"
  op: "Range"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/range_2/start"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Rank_1"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/range_2/delta"
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Prod_1"
  op: "Prod"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Shape_3"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/range_2"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Maximum_1/y"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Maximum_1"
  op: "Maximum"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Prod_1"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/floordiv_1"
  op: "Div"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Prod"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/d_loss_grad/Cast"
  op: "Cast"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/floordiv_1"
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
  name: "optimization_steps/gradients/loss_function/d_loss_grad/truediv"
  op: "Div"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Tile"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_1_grad/Shape"
  op: "Shape"
  input: "loss_function/Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_1_grad/Shape_1"
  op: "Shape"
  input: "loss_function/Log_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/Shape"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/loss_function/sub_1_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/truediv"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/loss_function/sub_1_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/Sum"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_1_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/loss_function/d_loss_grad/truediv"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/loss_function/sub_1_grad/Neg"
  op: "Neg"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_1_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/Neg"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/loss_function/sub_1_grad/Reshape"
  input: "^optimization_steps/gradients/loss_function/sub_1_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/loss_function/sub_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/Reshape"
  input: "^optimization_steps/gradients/loss_function/sub_1_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/loss_function/sub_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/Reshape_1"
  input: "^optimization_steps/gradients/loss_function/sub_1_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/loss_function/sub_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/Neg_grad/Neg"
  op: "Neg"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/Log_1_grad/Inv"
  op: "Inv"
  input: "loss_function/sub"
  input: "^optimization_steps/gradients/loss_function/sub_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/Log_1_grad/mul"
  op: "Mul"
  input: "optimization_steps/gradients/loss_function/sub_1_grad/tuple/control_dependency_1"
  input: "optimization_steps/gradients/loss_function/Log_1_grad/Inv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/Log_grad/Inv"
  op: "Inv"
  input: "model/discriminator/H2/sigmoid_output"
  input: "^optimization_steps/gradients/loss_function/Neg_grad/Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/Log_grad/mul"
  op: "Mul"
  input: "optimization_steps/gradients/loss_function/Neg_grad/Neg"
  input: "optimization_steps/gradients/loss_function/Log_grad/Inv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_grad/Shape"
  op: "Shape"
  input: "loss_function/sub/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/H2_1/sigmoid_output"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/loss_function/sub_grad/Shape"
  input: "optimization_steps/gradients/loss_function/sub_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/loss_function/sub_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/loss_function/Log_1_grad/mul"
  input: "optimization_steps/gradients/loss_function/sub_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/loss_function/sub_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/loss_function/sub_grad/Sum"
  input: "optimization_steps/gradients/loss_function/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/loss_function/Log_1_grad/mul"
  input: "optimization_steps/gradients/loss_function/sub_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/loss_function/sub_grad/Neg"
  op: "Neg"
  input: "optimization_steps/gradients/loss_function/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/loss_function/sub_grad/Neg"
  input: "optimization_steps/gradients/loss_function/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/loss_function/sub_grad/Reshape"
  input: "^optimization_steps/gradients/loss_function/sub_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/loss_function/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/loss_function/sub_grad/Reshape"
  input: "^optimization_steps/gradients/loss_function/sub_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/loss_function/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/loss_function/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/loss_function/sub_grad/Reshape_1"
  input: "^optimization_steps/gradients/loss_function/sub_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/loss_function/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/sigmoid_output_grad/sub/x"
  op: "Const"
  input: "^optimization_steps/gradients/loss_function/Log_grad/mul"
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
  name: "optimization_steps/gradients/model/discriminator/H2/sigmoid_output_grad/sub"
  op: "Sub"
  input: "optimization_steps/gradients/model/discriminator/H2/sigmoid_output_grad/sub/x"
  input: "model/discriminator/H2/sigmoid_output"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/sigmoid_output_grad/mul"
  op: "Mul"
  input: "model/discriminator/H2/sigmoid_output"
  input: "optimization_steps/gradients/model/discriminator/H2/sigmoid_output_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/sigmoid_output_grad/mul_1"
  op: "Mul"
  input: "optimization_steps/gradients/loss_function/Log_grad/mul"
  input: "optimization_steps/gradients/model/discriminator/H2/sigmoid_output_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/sigmoid_output_grad/sub/x"
  op: "Const"
  input: "^optimization_steps/gradients/loss_function/sub_grad/tuple/control_dependency_1"
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
  name: "optimization_steps/gradients/model/discriminator/H2_1/sigmoid_output_grad/sub"
  op: "Sub"
  input: "optimization_steps/gradients/model/discriminator/H2_1/sigmoid_output_grad/sub/x"
  input: "model/discriminator/H2_1/sigmoid_output"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/sigmoid_output_grad/mul"
  op: "Mul"
  input: "model/discriminator/H2_1/sigmoid_output"
  input: "optimization_steps/gradients/model/discriminator/H2_1/sigmoid_output_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/sigmoid_output_grad/mul_1"
  op: "Mul"
  input: "optimization_steps/gradients/loss_function/sub_grad/tuple/control_dependency_1"
  input: "optimization_steps/gradients/model/discriminator/H2_1/sigmoid_output_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/H2/linear/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/H2/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/H2/sigmoid_output_grad/mul_1"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/H2/sigmoid_output_grad/mul_1"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/H2/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/H2/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H2/linear/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/H2_1/linear/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/H2/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/H2_1/sigmoid_output_grad/mul_1"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/H2_1/sigmoid_output_grad/mul_1"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/MatMul"
  op: "MatMul"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/tuple/control_dependency"
  input: "model/discriminator/H2/linear/W/read"
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
  name: "optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "model/discriminator/H1/linear/add"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/tuple/control_dependency"
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
  name: "optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/MatMul_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/MatMul_1"
  input: "^optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/MatMul"
  op: "MatMul"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/tuple/control_dependency"
  input: "model/discriminator/H2/linear/W/read"
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
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "model/discriminator/H1_1/linear/add"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/tuple/control_dependency"
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
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/MatMul_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/MatMul_1"
  input: "^optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/add_grad/tuple/control_dependency_1"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/add_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/H1/linear/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/H1/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/H1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/H1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H1/linear/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/H1_1/linear/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/H1/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN_1"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/H2/linear/MatMul_grad/tuple/control_dependency_1"
  input: "optimization_steps/gradients/model/discriminator/H2_1/linear/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/MatMul"
  op: "MatMul"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/tuple/control_dependency"
  input: "model/discriminator/H1/linear/W/read"
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
  name: "optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "model/discriminator/C2/reshape"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/tuple/control_dependency"
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
  name: "optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/MatMul_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/MatMul_1"
  input: "^optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/MatMul"
  op: "MatMul"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/tuple/control_dependency"
  input: "model/discriminator/H1/linear/W/read"
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
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "model/discriminator/C2_1/reshape"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/tuple/control_dependency"
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
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/MatMul_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/MatMul_1"
  input: "^optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN_2"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/add_grad/tuple/control_dependency_1"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/add_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/reshape_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2/lrelu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/reshape_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/C2/reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/reshape_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2_1/lrelu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/reshape_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/C2_1/reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN_3"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/H1/linear/MatMul_grad/tuple/control_dependency_1"
  input: "optimization_steps/gradients/model/discriminator/H1_1/linear/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Shape_2"
  op: "Shape"
  input: "optimization_steps/gradients/model/discriminator/C2/reshape_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/zeros/Const"
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
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/zeros"
  op: "Fill"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Shape_2"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/GreaterEqual"
  op: "GreaterEqual"
  input: "model/discriminator/C2/conv/add"
  input: "model/discriminator/C2/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Select"
  op: "Select"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/GreaterEqual"
  input: "optimization_steps/gradients/model/discriminator/C2/reshape_grad/Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/LogicalNot"
  op: "LogicalNot"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/GreaterEqual"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Select_1"
  op: "Select"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/LogicalNot"
  input: "optimization_steps/gradients/model/discriminator/C2/reshape_grad/Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Select"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Select_1"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C2/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2/lrelu_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Shape_2"
  op: "Shape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/reshape_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/zeros/Const"
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
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/zeros"
  op: "Fill"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Shape_2"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/GreaterEqual"
  op: "GreaterEqual"
  input: "model/discriminator/C2_1/conv/add"
  input: "model/discriminator/C2_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Select"
  op: "Select"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/GreaterEqual"
  input: "optimization_steps/gradients/model/discriminator/C2_1/reshape_grad/Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/LogicalNot"
  op: "LogicalNot"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/GreaterEqual"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Select_1"
  op: "Select"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/LogicalNot"
  input: "optimization_steps/gradients/model/discriminator/C2_1/reshape_grad/Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Select"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Select_1"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2/mul/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/mul"
  op: "Mul"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/tuple/control_dependency_1"
  input: "model/discriminator/C2/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/mul"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/mul_1"
  op: "Mul"
  input: "model/discriminator/C2/mul/x"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/mul_1"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C2/mul_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2/mul_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C2/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2_1/mul/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/mul"
  op: "Mul"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/tuple/control_dependency_1"
  input: "model/discriminator/C2_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/mul"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/mul_1"
  op: "Mul"
  input: "model/discriminator/C2_1/mul/x"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/mul_1"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2_1/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN_4"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/C2/lrelu_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/C2/mul_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2/conv/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2/conv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/AddN_4"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/AddN_4"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C2/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2/conv/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN_5"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/C2_1/lrelu_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/C2_1/mul_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2_1/conv/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2/conv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/AddN_5"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/AddN_5"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1/lrelu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Shape"
  input: "model/discriminator/C2/conv/W/read"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2/conv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "model/discriminator/C1/lrelu"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Shape_1"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1_1/lrelu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Shape"
  input: "model/discriminator/C2/conv/W/read"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2/conv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "model/discriminator/C1_1/lrelu"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Shape_1"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN_6"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/add_grad/tuple/control_dependency_1"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/add_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Shape_2"
  op: "Shape"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/zeros/Const"
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
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/zeros"
  op: "Fill"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Shape_2"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/GreaterEqual"
  op: "GreaterEqual"
  input: "model/discriminator/C1/conv/add"
  input: "model/discriminator/C1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Select"
  op: "Select"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/GreaterEqual"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/LogicalNot"
  op: "LogicalNot"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/GreaterEqual"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Select_1"
  op: "Select"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/LogicalNot"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Select"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Select_1"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C1/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1/lrelu_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Shape_2"
  op: "Shape"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/zeros/Const"
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
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/zeros"
  op: "Fill"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Shape_2"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/GreaterEqual"
  op: "GreaterEqual"
  input: "model/discriminator/C1_1/conv/add"
  input: "model/discriminator/C1_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Select"
  op: "Select"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/GreaterEqual"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/LogicalNot"
  op: "LogicalNot"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/GreaterEqual"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Select_1"
  op: "Select"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/LogicalNot"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Select"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Select_1"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN_7"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/C2/conv/Conv2D_grad/tuple/control_dependency_1"
  input: "optimization_steps/gradients/model/discriminator/C2_1/conv/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1/mul/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/mul"
  op: "Mul"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/tuple/control_dependency_1"
  input: "model/discriminator/C1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/mul"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/mul_1"
  op: "Mul"
  input: "model/discriminator/C1/mul/x"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/mul_1"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C1/mul_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1/mul_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C1/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1_1/mul/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/mul"
  op: "Mul"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/tuple/control_dependency_1"
  input: "model/discriminator/C1_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/mul"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/mul_1"
  op: "Mul"
  input: "model/discriminator/C1_1/mul/x"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/mul_1"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1_1/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN_8"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/C1/lrelu_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/C1/mul_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1/conv/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1/conv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/AddN_8"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/AddN_8"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C1/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1/conv/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN_9"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/C1_1/lrelu_grad/tuple/control_dependency"
  input: "optimization_steps/gradients/model/discriminator/C1_1/mul_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1_1/conv/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1/conv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Shape"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients/AddN_9"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Sum"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients/AddN_9"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Sum_1"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Reshape_1"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Shape"
  op: "Shape"
  input: "model/discriminator/input_node"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Shape"
  input: "model/discriminator/C1/conv/W/read"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1/conv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "model/discriminator/input_node"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Shape_1"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Shape"
  op: "Shape"
  input: "model/generator/D2/output_node"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Shape"
  input: "model/discriminator/C1/conv/W/read"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1/conv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "model/generator/D2/output_node"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Shape_1"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN_10"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/add_grad/tuple/control_dependency_1"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/add_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients/AddN_11"
  op: "AddN"
  input: "optimization_steps/gradients/model/discriminator/C1/conv/Conv2D_grad/tuple/control_dependency_1"
  input: "optimization_steps/gradients/model/discriminator/C1_1/conv/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/beta1_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
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
  name: "optimization_steps/beta1_power"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
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
  name: "optimization_steps/beta1_power/Assign"
  op: "Assign"
  input: "optimization_steps/beta1_power"
  input: "optimization_steps/beta1_power/initial_value"
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
        s: "loc:@model/discriminator/C1/conv/W"
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
  name: "optimization_steps/beta1_power/read"
  op: "Identity"
  input: "optimization_steps/beta1_power"
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
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/beta2_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
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
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "optimization_steps/beta2_power"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
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
  name: "optimization_steps/beta2_power/Assign"
  op: "Assign"
  input: "optimization_steps/beta2_power"
  input: "optimization_steps/beta2_power/initial_value"
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
        s: "loc:@model/discriminator/C1/conv/W"
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
  name: "optimization_steps/beta2_power/read"
  op: "Identity"
  input: "optimization_steps/beta2_power"
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
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros"
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
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 1
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 32
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
  name: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer"
  input: "optimization_steps/zeros"
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
        s: "loc:@model/discriminator/C1/conv/W"
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
  name: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer"
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
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_1"
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
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 1
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 32
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
  name: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer_1"
  input: "optimization_steps/zeros_1"
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
        s: "loc:@model/discriminator/C1/conv/W"
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
  name: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer_1"
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
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_2"
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
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/b"
      }
    }
  }
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
          size: 32
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
  name: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer"
  input: "optimization_steps/zeros_2"
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
        s: "loc:@model/discriminator/C1/conv/b"
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
  name: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer"
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
        s: "loc:@model/discriminator/C1/conv/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_3"
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
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C1/conv/b"
      }
    }
  }
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
          size: 32
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
  name: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer_1"
  input: "optimization_steps/zeros_3"
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
        s: "loc:@model/discriminator/C1/conv/b"
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
  name: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer_1"
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
        s: "loc:@model/discriminator/C1/conv/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_4"
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
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 32
          }
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C2/conv/W"
      }
    }
  }
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
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
  name: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer"
  input: "optimization_steps/zeros_4"
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
        s: "loc:@model/discriminator/C2/conv/W"
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
  name: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer"
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
        s: "loc:@model/discriminator/C2/conv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_5"
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
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 32
          }
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C2/conv/W"
      }
    }
  }
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
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
  name: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer_1"
  input: "optimization_steps/zeros_5"
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
        s: "loc:@model/discriminator/C2/conv/W"
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
  name: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer_1"
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
        s: "loc:@model/discriminator/C2/conv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_6"
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
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C2/conv/b"
      }
    }
  }
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
          size: 64
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
  name: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer"
  input: "optimization_steps/zeros_6"
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
        s: "loc:@model/discriminator/C2/conv/b"
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
  name: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer"
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
        s: "loc:@model/discriminator/C2/conv/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_7"
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
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/C2/conv/b"
      }
    }
  }
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
          size: 64
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
  name: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer_1"
  input: "optimization_steps/zeros_7"
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
        s: "loc:@model/discriminator/C2/conv/b"
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
  name: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer_1"
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
        s: "loc:@model/discriminator/C2/conv/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_8"
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
          dim {
            size: 3136
          }
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H1/linear/W"
      }
    }
  }
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
          size: 3136
        }
        dim {
          size: 1024
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
  name: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer"
  input: "optimization_steps/zeros_8"
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
        s: "loc:@model/discriminator/H1/linear/W"
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
  name: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer"
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
        s: "loc:@model/discriminator/H1/linear/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_9"
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
          dim {
            size: 3136
          }
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H1/linear/W"
      }
    }
  }
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
          size: 3136
        }
        dim {
          size: 1024
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
  name: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer_1"
  input: "optimization_steps/zeros_9"
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
        s: "loc:@model/discriminator/H1/linear/W"
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
  name: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer_1"
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
        s: "loc:@model/discriminator/H1/linear/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_10"
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
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H1/linear/b"
      }
    }
  }
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
          size: 1024
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
  name: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer"
  input: "optimization_steps/zeros_10"
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
        s: "loc:@model/discriminator/H1/linear/b"
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
  name: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer"
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
        s: "loc:@model/discriminator/H1/linear/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_11"
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
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H1/linear/b"
      }
    }
  }
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
          size: 1024
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
  name: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer_1"
  input: "optimization_steps/zeros_11"
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
        s: "loc:@model/discriminator/H1/linear/b"
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
  name: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer_1"
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
        s: "loc:@model/discriminator/H1/linear/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_12"
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
          dim {
            size: 1024
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H2/linear/W"
      }
    }
  }
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
          size: 1024
        }
        dim {
          size: 1
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
  name: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer"
  input: "optimization_steps/zeros_12"
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
        s: "loc:@model/discriminator/H2/linear/W"
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
  name: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer"
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
        s: "loc:@model/discriminator/H2/linear/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_13"
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
          dim {
            size: 1024
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H2/linear/W"
      }
    }
  }
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
          size: 1024
        }
        dim {
          size: 1
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
  name: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer_1"
  input: "optimization_steps/zeros_13"
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
        s: "loc:@model/discriminator/H2/linear/W"
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
  name: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer_1"
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
        s: "loc:@model/discriminator/H2/linear/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_14"
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
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H2/linear/b"
      }
    }
  }
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
          size: 1
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
  name: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer"
  input: "optimization_steps/zeros_14"
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
        s: "loc:@model/discriminator/H2/linear/b"
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
  name: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer"
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
        s: "loc:@model/discriminator/H2/linear/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_15"
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
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/discriminator/H2/linear/b"
      }
    }
  }
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
          size: 1
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
  name: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer_1"
  input: "optimization_steps/zeros_15"
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
        s: "loc:@model/discriminator/H2/linear/b"
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
  name: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer_1"
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
        s: "loc:@model/discriminator/H2/linear/b"
      }
    }
  }
}
node {
  name: "optimization_steps/d_optimizer/learning_rate"
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
        float_val: 0.000199999994948
      }
    }
  }
}
node {
  name: "optimization_steps/d_optimizer/beta1"
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
  name: "optimization_steps/d_optimizer/beta2"
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
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "optimization_steps/d_optimizer/epsilon"
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
        float_val: 9.99999993923e-09
      }
    }
  }
}
node {
  name: "optimization_steps/d_optimizer/update_model/discriminator/C1/conv/W/ApplyAdam"
  op: "ApplyAdam"
  input: "model/discriminator/C1/conv/W"
  input: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer"
  input: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer_1"
  input: "optimization_steps/beta1_power/read"
  input: "optimization_steps/beta2_power/read"
  input: "optimization_steps/d_optimizer/learning_rate"
  input: "optimization_steps/d_optimizer/beta1"
  input: "optimization_steps/d_optimizer/beta2"
  input: "optimization_steps/d_optimizer/epsilon"
  input: "optimization_steps/gradients/AddN_11"
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
        s: "loc:@model/discriminator/C1/conv/W"
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
  name: "optimization_steps/d_optimizer/update_model/discriminator/C1/conv/b/ApplyAdam"
  op: "ApplyAdam"
  input: "model/discriminator/C1/conv/b"
  input: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer"
  input: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer_1"
  input: "optimization_steps/beta1_power/read"
  input: "optimization_steps/beta2_power/read"
  input: "optimization_steps/d_optimizer/learning_rate"
  input: "optimization_steps/d_optimizer/beta1"
  input: "optimization_steps/d_optimizer/beta2"
  input: "optimization_steps/d_optimizer/epsilon"
  input: "optimization_steps/gradients/AddN_10"
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
        s: "loc:@model/discriminator/C1/conv/b"
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
  name: "optimization_steps/d_optimizer/update_model/discriminator/C2/conv/W/ApplyAdam"
  op: "ApplyAdam"
  input: "model/discriminator/C2/conv/W"
  input: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer"
  input: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer_1"
  input: "optimization_steps/beta1_power/read"
  input: "optimization_steps/beta2_power/read"
  input: "optimization_steps/d_optimizer/learning_rate"
  input: "optimization_steps/d_optimizer/beta1"
  input: "optimization_steps/d_optimizer/beta2"
  input: "optimization_steps/d_optimizer/epsilon"
  input: "optimization_steps/gradients/AddN_7"
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
        s: "loc:@model/discriminator/C2/conv/W"
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
  name: "optimization_steps/d_optimizer/update_model/discriminator/C2/conv/b/ApplyAdam"
  op: "ApplyAdam"
  input: "model/discriminator/C2/conv/b"
  input: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer"
  input: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer_1"
  input: "optimization_steps/beta1_power/read"
  input: "optimization_steps/beta2_power/read"
  input: "optimization_steps/d_optimizer/learning_rate"
  input: "optimization_steps/d_optimizer/beta1"
  input: "optimization_steps/d_optimizer/beta2"
  input: "optimization_steps/d_optimizer/epsilon"
  input: "optimization_steps/gradients/AddN_6"
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
        s: "loc:@model/discriminator/C2/conv/b"
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
  name: "optimization_steps/d_optimizer/update_model/discriminator/H1/linear/W/ApplyAdam"
  op: "ApplyAdam"
  input: "model/discriminator/H1/linear/W"
  input: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer"
  input: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer_1"
  input: "optimization_steps/beta1_power/read"
  input: "optimization_steps/beta2_power/read"
  input: "optimization_steps/d_optimizer/learning_rate"
  input: "optimization_steps/d_optimizer/beta1"
  input: "optimization_steps/d_optimizer/beta2"
  input: "optimization_steps/d_optimizer/epsilon"
  input: "optimization_steps/gradients/AddN_3"
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
        s: "loc:@model/discriminator/H1/linear/W"
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
  name: "optimization_steps/d_optimizer/update_model/discriminator/H1/linear/b/ApplyAdam"
  op: "ApplyAdam"
  input: "model/discriminator/H1/linear/b"
  input: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer"
  input: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer_1"
  input: "optimization_steps/beta1_power/read"
  input: "optimization_steps/beta2_power/read"
  input: "optimization_steps/d_optimizer/learning_rate"
  input: "optimization_steps/d_optimizer/beta1"
  input: "optimization_steps/d_optimizer/beta2"
  input: "optimization_steps/d_optimizer/epsilon"
  input: "optimization_steps/gradients/AddN_2"
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
        s: "loc:@model/discriminator/H1/linear/b"
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
  name: "optimization_steps/d_optimizer/update_model/discriminator/H2/linear/W/ApplyAdam"
  op: "ApplyAdam"
  input: "model/discriminator/H2/linear/W"
  input: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer"
  input: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer_1"
  input: "optimization_steps/beta1_power/read"
  input: "optimization_steps/beta2_power/read"
  input: "optimization_steps/d_optimizer/learning_rate"
  input: "optimization_steps/d_optimizer/beta1"
  input: "optimization_steps/d_optimizer/beta2"
  input: "optimization_steps/d_optimizer/epsilon"
  input: "optimization_steps/gradients/AddN_1"
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
        s: "loc:@model/discriminator/H2/linear/W"
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
  name: "optimization_steps/d_optimizer/update_model/discriminator/H2/linear/b/ApplyAdam"
  op: "ApplyAdam"
  input: "model/discriminator/H2/linear/b"
  input: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer"
  input: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer_1"
  input: "optimization_steps/beta1_power/read"
  input: "optimization_steps/beta2_power/read"
  input: "optimization_steps/d_optimizer/learning_rate"
  input: "optimization_steps/d_optimizer/beta1"
  input: "optimization_steps/d_optimizer/beta2"
  input: "optimization_steps/d_optimizer/epsilon"
  input: "optimization_steps/gradients/AddN"
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
        s: "loc:@model/discriminator/H2/linear/b"
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
  name: "optimization_steps/d_optimizer/mul"
  op: "Mul"
  input: "optimization_steps/beta1_power/read"
  input: "optimization_steps/d_optimizer/beta1"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C1/conv/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C1/conv/b/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C2/conv/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C2/conv/b/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H1/linear/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H1/linear/b/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H2/linear/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H2/linear/b/ApplyAdam"
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
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/d_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/beta1_power"
  input: "optimization_steps/d_optimizer/mul"
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
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
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
  name: "optimization_steps/d_optimizer/mul_1"
  op: "Mul"
  input: "optimization_steps/beta2_power/read"
  input: "optimization_steps/d_optimizer/beta2"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C1/conv/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C1/conv/b/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C2/conv/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C2/conv/b/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H1/linear/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H1/linear/b/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H2/linear/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H2/linear/b/ApplyAdam"
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
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/d_optimizer/Assign_1"
  op: "Assign"
  input: "optimization_steps/beta2_power"
  input: "optimization_steps/d_optimizer/mul_1"
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
        s: "loc:@model/discriminator/C1/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
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
  name: "optimization_steps/d_optimizer"
  op: "NoOp"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C1/conv/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C1/conv/b/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C2/conv/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/C2/conv/b/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H1/linear/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H1/linear/b/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H2/linear/W/ApplyAdam"
  input: "^optimization_steps/d_optimizer/update_model/discriminator/H2/linear/b/ApplyAdam"
  input: "^optimization_steps/d_optimizer/Assign"
  input: "^optimization_steps/d_optimizer/Assign_1"
}
node {
  name: "optimization_steps/gradients_1/Shape"
  op: "Shape"
  input: "loss_function/g_loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/Const"
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
  name: "optimization_steps/gradients_1/Fill"
  op: "Fill"
  input: "optimization_steps/gradients_1/Shape"
  input: "optimization_steps/gradients_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape"
  op: "Shape"
  input: "loss_function/Neg_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Size"
  op: "Size"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/add"
  op: "Add"
  input: "loss_function/range_1"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/mod"
  op: "Mod"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/add"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape_1"
  op: "Shape"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/mod"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/range/start"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/range/delta"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/range"
  op: "Range"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/range/start"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Size"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/range/delta"
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Fill/value"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Fill"
  op: "Fill"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape_1"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/range"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/mod"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Fill"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Maximum/y"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Maximum"
  op: "Maximum"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/DynamicStitch"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/floordiv"
  op: "Div"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/Fill"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Tile"
  op: "Tile"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Reshape"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape_2"
  op: "Shape"
  input: "loss_function/Neg_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape_3"
  op: "Shape"
  input: "loss_function/g_loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Rank"
  op: "Rank"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_1/start"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_1/delta"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_1"
  op: "Range"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_1/start"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Rank"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_1/delta"
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Prod"
  op: "Prod"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape_2"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_1"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Rank_1"
  op: "Rank"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape_3"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_2/start"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_2/delta"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_2"
  op: "Range"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_2/start"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Rank_1"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_2/delta"
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Prod_1"
  op: "Prod"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Shape_3"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/range_2"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Maximum_1/y"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Maximum_1"
  op: "Maximum"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Prod_1"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/floordiv_1"
  op: "Div"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Prod"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/Cast"
  op: "Cast"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/floordiv_1"
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
  name: "optimization_steps/gradients_1/loss_function/g_loss_grad/truediv"
  op: "Div"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Tile"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/Neg_1_grad/Neg"
  op: "Neg"
  input: "optimization_steps/gradients_1/loss_function/g_loss_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/Log_2_grad/Inv"
  op: "Inv"
  input: "model/discriminator/H2_1/sigmoid_output"
  input: "^optimization_steps/gradients_1/loss_function/Neg_1_grad/Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/loss_function/Log_2_grad/mul"
  op: "Mul"
  input: "optimization_steps/gradients_1/loss_function/Neg_1_grad/Neg"
  input: "optimization_steps/gradients_1/loss_function/Log_2_grad/Inv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/sigmoid_output_grad/sub/x"
  op: "Const"
  input: "^optimization_steps/gradients_1/loss_function/Log_2_grad/mul"
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
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/sigmoid_output_grad/sub"
  op: "Sub"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/sigmoid_output_grad/sub/x"
  input: "model/discriminator/H2_1/sigmoid_output"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/sigmoid_output_grad/mul"
  op: "Mul"
  input: "model/discriminator/H2_1/sigmoid_output"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/sigmoid_output_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/sigmoid_output_grad/mul_1"
  op: "Mul"
  input: "optimization_steps/gradients_1/loss_function/Log_2_grad/mul"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/sigmoid_output_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/H2_1/linear/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/H2/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Shape"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/sigmoid_output_grad/mul_1"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Sum"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/sigmoid_output_grad/mul_1"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Sum_1"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Reshape_1"
  input: "^optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/MatMul"
  op: "MatMul"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/tuple/control_dependency"
  input: "model/discriminator/H2/linear/W/read"
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
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "model/discriminator/H1_1/linear/add"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/add_grad/tuple/control_dependency"
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
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/MatMul_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/MatMul_1"
  input: "^optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/H1_1/linear/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/H1/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Shape"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/tuple/control_dependency"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Sum"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/H2_1/linear/MatMul_grad/tuple/control_dependency"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Sum_1"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Reshape_1"
  input: "^optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/MatMul"
  op: "MatMul"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/tuple/control_dependency"
  input: "model/discriminator/H1/linear/W/read"
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
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "model/discriminator/C2_1/reshape"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/add_grad/tuple/control_dependency"
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
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/MatMul_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/MatMul_1"
  input: "^optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/reshape_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2_1/lrelu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/reshape_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/H1_1/linear/MatMul_grad/tuple/control_dependency"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Shape_2"
  op: "Shape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/reshape_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/zeros/Const"
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
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/zeros"
  op: "Fill"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Shape_2"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/GreaterEqual"
  op: "GreaterEqual"
  input: "model/discriminator/C2_1/conv/add"
  input: "model/discriminator/C2_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Shape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Select"
  op: "Select"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/GreaterEqual"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/reshape_grad/Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/LogicalNot"
  op: "LogicalNot"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/GreaterEqual"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Select_1"
  op: "Select"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/LogicalNot"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/reshape_grad/Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Select"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Select_1"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Sum_1"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Reshape_1"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2_1/mul/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Shape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/mul"
  op: "Mul"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/tuple/control_dependency_1"
  input: "model/discriminator/C2_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/mul"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/mul_1"
  op: "Mul"
  input: "model/discriminator/C2_1/mul/x"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/mul_1"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Sum_1"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Reshape_1"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/AddN"
  op: "AddN"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/lrelu_grad/tuple/control_dependency"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/mul_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C2_1/conv/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2/conv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Shape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients_1/AddN"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients_1/AddN"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Sum_1"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Reshape_1"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1_1/lrelu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Shape"
  input: "model/discriminator/C2/conv/W/read"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C2/conv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "model/discriminator/C1_1/lrelu"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Shape_1"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Shape_2"
  op: "Shape"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/zeros/Const"
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
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/zeros"
  op: "Fill"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Shape_2"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/GreaterEqual"
  op: "GreaterEqual"
  input: "model/discriminator/C1_1/conv/add"
  input: "model/discriminator/C1_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Shape"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Select"
  op: "Select"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/GreaterEqual"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/tuple/control_dependency"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/LogicalNot"
  op: "LogicalNot"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/GreaterEqual"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Select_1"
  op: "Select"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/LogicalNot"
  input: "optimization_steps/gradients_1/model/discriminator/C2_1/conv/Conv2D_grad/tuple/control_dependency"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Select"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Select_1"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Sum_1"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Reshape_1"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1_1/mul/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Shape"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/mul"
  op: "Mul"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/tuple/control_dependency_1"
  input: "model/discriminator/C1_1/conv/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/mul"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/mul_1"
  op: "Mul"
  input: "model/discriminator/C1_1/mul/x"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/mul_1"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Sum_1"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Reshape_1"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/AddN_1"
  op: "AddN"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/lrelu_grad/tuple/control_dependency"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/mul_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Shape"
  op: "Shape"
  input: "model/discriminator/C1_1/conv/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1/conv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Shape"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients_1/AddN_1"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Sum"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients_1/AddN_1"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Sum_1"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Reshape_1"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Shape"
  op: "Shape"
  input: "model/generator/D2/output_node"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Shape"
  input: "model/discriminator/C1/conv/W/read"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Shape_1"
  op: "Shape"
  input: "model/discriminator/C1/conv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "model/generator/D2/output_node"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Shape_1"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/output_node_grad/sub/x"
  op: "Const"
  input: "^optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/tuple/control_dependency"
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
  name: "optimization_steps/gradients_1/model/generator/D2/output_node_grad/sub"
  op: "Sub"
  input: "optimization_steps/gradients_1/model/generator/D2/output_node_grad/sub/x"
  input: "model/generator/D2/output_node"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/output_node_grad/mul"
  op: "Mul"
  input: "model/generator/D2/output_node"
  input: "optimization_steps/gradients_1/model/generator/D2/output_node_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/output_node_grad/mul_1"
  op: "Mul"
  input: "optimization_steps/gradients_1/model/discriminator/C1_1/conv/Conv2D_grad/tuple/control_dependency"
  input: "optimization_steps/gradients_1/model/generator/D2/output_node_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Shape"
  op: "Shape"
  input: "model/generator/D2/deconv/conv2d_transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Shape_1"
  op: "Shape"
  input: "model/generator/D2/deconv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Shape"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/generator/D2/output_node_grad/mul_1"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Sum"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/generator/D2/output_node_grad/mul_1"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Sum_1"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Reshape_1"
  input: "^optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/Shape"
  op: "Shape"
  input: "model/generator/D2/deconv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/tuple/control_dependency"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/Shape"
  input: "model/generator/D1/relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/Conv2D"
  op: "Conv2D"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/tuple/control_dependency"
  input: "model/generator/D2/deconv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/Conv2DBackpropFilter"
  input: "^optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/Conv2D"
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/Conv2DBackpropFilter"
  input: "^optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/Conv2D"
  input: "^optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/Conv2D"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/tuple/control_dependency_1"
  input: "model/generator/D1/relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Shape"
  op: "Shape"
  input: "model/generator/D1/deconv/conv2d_transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Shape_1"
  op: "Shape"
  input: "model/generator/D1/deconv/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Shape"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/generator/D1/relu_grad/ReluGrad"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Sum"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/generator/D1/relu_grad/ReluGrad"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Sum_1"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Reshape_1"
  input: "^optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/Shape"
  op: "Shape"
  input: "model/generator/D1/deconv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/tuple/control_dependency"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/Shape"
  input: "model/generator/H1/reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/Conv2D"
  op: "Conv2D"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/tuple/control_dependency"
  input: "model/generator/D1/deconv/W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/Conv2DBackpropFilter"
  input: "^optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/Conv2D"
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/Conv2DBackpropFilter"
  input: "^optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/Conv2D"
  input: "^optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/Conv2D"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/reshape_grad/Shape"
  op: "Shape"
  input: "model/generator/H1/relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/reshape_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/tuple/control_dependency_1"
  input: "optimization_steps/gradients_1/model/generator/H1/reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "optimization_steps/gradients_1/model/generator/H1/reshape_grad/Reshape"
  input: "model/generator/H1/relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Shape"
  op: "Shape"
  input: "model/generator/H1/linear/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Shape_1"
  op: "Shape"
  input: "model/generator/H1/linear/b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Shape"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Shape_1"
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Sum"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/generator/H1/relu_grad/ReluGrad"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/BroadcastGradientArgs"
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
  name: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Reshape"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Sum"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Sum_1"
  op: "Sum"
  input: "optimization_steps/gradients_1/model/generator/H1/relu_grad/ReluGrad"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/BroadcastGradientArgs:1"
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
  name: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Reshape_1"
  op: "Reshape"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Sum_1"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Reshape_1"
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Reshape"
  input: "^optimization_steps/gradients_1/model/generator/H1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Reshape_1"
  input: "^optimization_steps/gradients_1/model/generator/H1/linear/add_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/H1/linear/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/MatMul"
  op: "MatMul"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/tuple/control_dependency"
  input: "model/generator/H1/linear/W/read"
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
  name: "optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "model/generator/input_node"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/tuple/control_dependency"
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
  name: "optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/MatMul_1"
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/MatMul"
  input: "^optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/MatMul_1"
  input: "^optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/tuple/group_deps"
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
        s: "loc:@optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "optimization_steps/beta1_power_1/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
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
  name: "optimization_steps/beta1_power_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
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
  name: "optimization_steps/beta1_power_1/Assign"
  op: "Assign"
  input: "optimization_steps/beta1_power_1"
  input: "optimization_steps/beta1_power_1/initial_value"
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
        s: "loc:@model/generator/H1/linear/W"
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
  name: "optimization_steps/beta1_power_1/read"
  op: "Identity"
  input: "optimization_steps/beta1_power_1"
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
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
}
node {
  name: "optimization_steps/beta2_power_1/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
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
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "optimization_steps/beta2_power_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
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
  name: "optimization_steps/beta2_power_1/Assign"
  op: "Assign"
  input: "optimization_steps/beta2_power_1"
  input: "optimization_steps/beta2_power_1/initial_value"
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
        s: "loc:@model/generator/H1/linear/W"
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
  name: "optimization_steps/beta2_power_1/read"
  op: "Identity"
  input: "optimization_steps/beta2_power_1"
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
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_16"
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
          dim {
            size: 10
          }
          dim {
            size: 6272
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/H1/linear/W/g_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
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
        dim {
          size: 6272
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
  name: "optimization_steps/model/generator/H1/linear/W/g_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/H1/linear/W/g_optimizer"
  input: "optimization_steps/zeros_16"
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
        s: "loc:@model/generator/H1/linear/W"
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
  name: "optimization_steps/model/generator/H1/linear/W/g_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/generator/H1/linear/W/g_optimizer"
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
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_17"
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
          dim {
            size: 10
          }
          dim {
            size: 6272
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/H1/linear/W/g_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
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
        dim {
          size: 6272
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
  name: "optimization_steps/model/generator/H1/linear/W/g_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/H1/linear/W/g_optimizer_1"
  input: "optimization_steps/zeros_17"
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
        s: "loc:@model/generator/H1/linear/W"
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
  name: "optimization_steps/model/generator/H1/linear/W/g_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/generator/H1/linear/W/g_optimizer_1"
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
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_18"
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
          dim {
            size: 6272
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/H1/linear/b/g_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/b"
      }
    }
  }
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
          size: 6272
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
  name: "optimization_steps/model/generator/H1/linear/b/g_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/H1/linear/b/g_optimizer"
  input: "optimization_steps/zeros_18"
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
        s: "loc:@model/generator/H1/linear/b"
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
  name: "optimization_steps/model/generator/H1/linear/b/g_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/generator/H1/linear/b/g_optimizer"
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
        s: "loc:@model/generator/H1/linear/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_19"
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
          dim {
            size: 6272
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/H1/linear/b/g_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/H1/linear/b"
      }
    }
  }
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
          size: 6272
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
  name: "optimization_steps/model/generator/H1/linear/b/g_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/H1/linear/b/g_optimizer_1"
  input: "optimization_steps/zeros_19"
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
        s: "loc:@model/generator/H1/linear/b"
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
  name: "optimization_steps/model/generator/H1/linear/b/g_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/generator/H1/linear/b/g_optimizer_1"
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
        s: "loc:@model/generator/H1/linear/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_20"
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
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 128
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/D1/deconv/W/g_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D1/deconv/W"
      }
    }
  }
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 128
        }
        dim {
          size: 128
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
  name: "optimization_steps/model/generator/D1/deconv/W/g_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/D1/deconv/W/g_optimizer"
  input: "optimization_steps/zeros_20"
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
        s: "loc:@model/generator/D1/deconv/W"
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
  name: "optimization_steps/model/generator/D1/deconv/W/g_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/generator/D1/deconv/W/g_optimizer"
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
        s: "loc:@model/generator/D1/deconv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_21"
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
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 128
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/D1/deconv/W/g_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D1/deconv/W"
      }
    }
  }
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 128
        }
        dim {
          size: 128
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
  name: "optimization_steps/model/generator/D1/deconv/W/g_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/D1/deconv/W/g_optimizer_1"
  input: "optimization_steps/zeros_21"
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
        s: "loc:@model/generator/D1/deconv/W"
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
  name: "optimization_steps/model/generator/D1/deconv/W/g_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/generator/D1/deconv/W/g_optimizer_1"
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
        s: "loc:@model/generator/D1/deconv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_22"
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
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/D1/deconv/b/g_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D1/deconv/b"
      }
    }
  }
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
          size: 128
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
  name: "optimization_steps/model/generator/D1/deconv/b/g_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/D1/deconv/b/g_optimizer"
  input: "optimization_steps/zeros_22"
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
        s: "loc:@model/generator/D1/deconv/b"
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
  name: "optimization_steps/model/generator/D1/deconv/b/g_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/generator/D1/deconv/b/g_optimizer"
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
        s: "loc:@model/generator/D1/deconv/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_23"
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
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/D1/deconv/b/g_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D1/deconv/b"
      }
    }
  }
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
          size: 128
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
  name: "optimization_steps/model/generator/D1/deconv/b/g_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/D1/deconv/b/g_optimizer_1"
  input: "optimization_steps/zeros_23"
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
        s: "loc:@model/generator/D1/deconv/b"
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
  name: "optimization_steps/model/generator/D1/deconv/b/g_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/generator/D1/deconv/b/g_optimizer_1"
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
        s: "loc:@model/generator/D1/deconv/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_24"
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
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 1
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/D2/deconv/W/g_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D2/deconv/W"
      }
    }
  }
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 128
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
  name: "optimization_steps/model/generator/D2/deconv/W/g_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/D2/deconv/W/g_optimizer"
  input: "optimization_steps/zeros_24"
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
        s: "loc:@model/generator/D2/deconv/W"
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
  name: "optimization_steps/model/generator/D2/deconv/W/g_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/generator/D2/deconv/W/g_optimizer"
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
        s: "loc:@model/generator/D2/deconv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_25"
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
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 1
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/D2/deconv/W/g_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D2/deconv/W"
      }
    }
  }
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 128
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
  name: "optimization_steps/model/generator/D2/deconv/W/g_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/D2/deconv/W/g_optimizer_1"
  input: "optimization_steps/zeros_25"
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
        s: "loc:@model/generator/D2/deconv/W"
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
  name: "optimization_steps/model/generator/D2/deconv/W/g_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/generator/D2/deconv/W/g_optimizer_1"
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
        s: "loc:@model/generator/D2/deconv/W"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_26"
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
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/D2/deconv/b/g_optimizer"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D2/deconv/b"
      }
    }
  }
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
          size: 1
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
  name: "optimization_steps/model/generator/D2/deconv/b/g_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/D2/deconv/b/g_optimizer"
  input: "optimization_steps/zeros_26"
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
        s: "loc:@model/generator/D2/deconv/b"
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
  name: "optimization_steps/model/generator/D2/deconv/b/g_optimizer/read"
  op: "Identity"
  input: "optimization_steps/model/generator/D2/deconv/b/g_optimizer"
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
        s: "loc:@model/generator/D2/deconv/b"
      }
    }
  }
}
node {
  name: "optimization_steps/zeros_27"
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
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "optimization_steps/model/generator/D2/deconv/b/g_optimizer_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@model/generator/D2/deconv/b"
      }
    }
  }
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
          size: 1
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
  name: "optimization_steps/model/generator/D2/deconv/b/g_optimizer_1/Assign"
  op: "Assign"
  input: "optimization_steps/model/generator/D2/deconv/b/g_optimizer_1"
  input: "optimization_steps/zeros_27"
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
        s: "loc:@model/generator/D2/deconv/b"
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
  name: "optimization_steps/model/generator/D2/deconv/b/g_optimizer_1/read"
  op: "Identity"
  input: "optimization_steps/model/generator/D2/deconv/b/g_optimizer_1"
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
        s: "loc:@model/generator/D2/deconv/b"
      }
    }
  }
}
node {
  name: "optimization_steps/g_optimizer/learning_rate"
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
        float_val: 0.000199999994948
      }
    }
  }
}
node {
  name: "optimization_steps/g_optimizer/beta1"
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
  name: "optimization_steps/g_optimizer/beta2"
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
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "optimization_steps/g_optimizer/epsilon"
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
        float_val: 9.99999993923e-09
      }
    }
  }
}
node {
  name: "optimization_steps/g_optimizer/update_model/generator/H1/linear/W/ApplyAdam"
  op: "ApplyAdam"
  input: "model/generator/H1/linear/W"
  input: "optimization_steps/model/generator/H1/linear/W/g_optimizer"
  input: "optimization_steps/model/generator/H1/linear/W/g_optimizer_1"
  input: "optimization_steps/beta1_power_1/read"
  input: "optimization_steps/beta2_power_1/read"
  input: "optimization_steps/g_optimizer/learning_rate"
  input: "optimization_steps/g_optimizer/beta1"
  input: "optimization_steps/g_optimizer/beta2"
  input: "optimization_steps/g_optimizer/epsilon"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/MatMul_grad/tuple/control_dependency_1"
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
        s: "loc:@model/generator/H1/linear/W"
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
  name: "optimization_steps/g_optimizer/update_model/generator/H1/linear/b/ApplyAdam"
  op: "ApplyAdam"
  input: "model/generator/H1/linear/b"
  input: "optimization_steps/model/generator/H1/linear/b/g_optimizer"
  input: "optimization_steps/model/generator/H1/linear/b/g_optimizer_1"
  input: "optimization_steps/beta1_power_1/read"
  input: "optimization_steps/beta2_power_1/read"
  input: "optimization_steps/g_optimizer/learning_rate"
  input: "optimization_steps/g_optimizer/beta1"
  input: "optimization_steps/g_optimizer/beta2"
  input: "optimization_steps/g_optimizer/epsilon"
  input: "optimization_steps/gradients_1/model/generator/H1/linear/add_grad/tuple/control_dependency_1"
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
        s: "loc:@model/generator/H1/linear/b"
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
  name: "optimization_steps/g_optimizer/update_model/generator/D1/deconv/W/ApplyAdam"
  op: "ApplyAdam"
  input: "model/generator/D1/deconv/W"
  input: "optimization_steps/model/generator/D1/deconv/W/g_optimizer"
  input: "optimization_steps/model/generator/D1/deconv/W/g_optimizer_1"
  input: "optimization_steps/beta1_power_1/read"
  input: "optimization_steps/beta2_power_1/read"
  input: "optimization_steps/g_optimizer/learning_rate"
  input: "optimization_steps/g_optimizer/beta1"
  input: "optimization_steps/g_optimizer/beta2"
  input: "optimization_steps/g_optimizer/epsilon"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/conv2d_transpose_grad/tuple/control_dependency"
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
        s: "loc:@model/generator/D1/deconv/W"
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
  name: "optimization_steps/g_optimizer/update_model/generator/D1/deconv/b/ApplyAdam"
  op: "ApplyAdam"
  input: "model/generator/D1/deconv/b"
  input: "optimization_steps/model/generator/D1/deconv/b/g_optimizer"
  input: "optimization_steps/model/generator/D1/deconv/b/g_optimizer_1"
  input: "optimization_steps/beta1_power_1/read"
  input: "optimization_steps/beta2_power_1/read"
  input: "optimization_steps/g_optimizer/learning_rate"
  input: "optimization_steps/g_optimizer/beta1"
  input: "optimization_steps/g_optimizer/beta2"
  input: "optimization_steps/g_optimizer/epsilon"
  input: "optimization_steps/gradients_1/model/generator/D1/deconv/add_grad/tuple/control_dependency_1"
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
        s: "loc:@model/generator/D1/deconv/b"
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
  name: "optimization_steps/g_optimizer/update_model/generator/D2/deconv/W/ApplyAdam"
  op: "ApplyAdam"
  input: "model/generator/D2/deconv/W"
  input: "optimization_steps/model/generator/D2/deconv/W/g_optimizer"
  input: "optimization_steps/model/generator/D2/deconv/W/g_optimizer_1"
  input: "optimization_steps/beta1_power_1/read"
  input: "optimization_steps/beta2_power_1/read"
  input: "optimization_steps/g_optimizer/learning_rate"
  input: "optimization_steps/g_optimizer/beta1"
  input: "optimization_steps/g_optimizer/beta2"
  input: "optimization_steps/g_optimizer/epsilon"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/conv2d_transpose_grad/tuple/control_dependency"
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
        s: "loc:@model/generator/D2/deconv/W"
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
  name: "optimization_steps/g_optimizer/update_model/generator/D2/deconv/b/ApplyAdam"
  op: "ApplyAdam"
  input: "model/generator/D2/deconv/b"
  input: "optimization_steps/model/generator/D2/deconv/b/g_optimizer"
  input: "optimization_steps/model/generator/D2/deconv/b/g_optimizer_1"
  input: "optimization_steps/beta1_power_1/read"
  input: "optimization_steps/beta2_power_1/read"
  input: "optimization_steps/g_optimizer/learning_rate"
  input: "optimization_steps/g_optimizer/beta1"
  input: "optimization_steps/g_optimizer/beta2"
  input: "optimization_steps/g_optimizer/epsilon"
  input: "optimization_steps/gradients_1/model/generator/D2/deconv/add_grad/tuple/control_dependency_1"
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
        s: "loc:@model/generator/D2/deconv/b"
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
  name: "optimization_steps/g_optimizer/mul"
  op: "Mul"
  input: "optimization_steps/beta1_power_1/read"
  input: "optimization_steps/g_optimizer/beta1"
  input: "^optimization_steps/g_optimizer/update_model/generator/H1/linear/W/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/H1/linear/b/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D1/deconv/W/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D1/deconv/b/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D2/deconv/W/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D2/deconv/b/ApplyAdam"
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
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
}
node {
  name: "optimization_steps/g_optimizer/Assign"
  op: "Assign"
  input: "optimization_steps/beta1_power_1"
  input: "optimization_steps/g_optimizer/mul"
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
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
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
  name: "optimization_steps/g_optimizer/mul_1"
  op: "Mul"
  input: "optimization_steps/beta2_power_1/read"
  input: "optimization_steps/g_optimizer/beta2"
  input: "^optimization_steps/g_optimizer/update_model/generator/H1/linear/W/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/H1/linear/b/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D1/deconv/W/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D1/deconv/b/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D2/deconv/W/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D2/deconv/b/ApplyAdam"
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
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
}
node {
  name: "optimization_steps/g_optimizer/Assign_1"
  op: "Assign"
  input: "optimization_steps/beta2_power_1"
  input: "optimization_steps/g_optimizer/mul_1"
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
        s: "loc:@model/generator/H1/linear/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
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
  name: "optimization_steps/g_optimizer"
  op: "NoOp"
  input: "^optimization_steps/g_optimizer/update_model/generator/H1/linear/W/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/H1/linear/b/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D1/deconv/W/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D1/deconv/b/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D2/deconv/W/ApplyAdam"
  input: "^optimization_steps/g_optimizer/update_model/generator/D2/deconv/b/ApplyAdam"
  input: "^optimization_steps/g_optimizer/Assign"
  input: "^optimization_steps/g_optimizer/Assign_1"
}
node {
  name: "generator_accuracy/add/y"
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
  name: "generator_accuracy/add"
  op: "Add"
  input: "model/discriminator/H2/sigmoid_output"
  input: "generator_accuracy/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "generator_accuracy/Floor"
  op: "Floor"
  input: "generator_accuracy/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "generator_accuracy/Equal"
  op: "Equal"
  input: "generator_accuracy/Floor"
  input: "ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "generator_accuracy/add_1/y"
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
  name: "generator_accuracy/add_1"
  op: "Add"
  input: "model/discriminator/H2_1/sigmoid_output"
  input: "generator_accuracy/add_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "generator_accuracy/Floor_1"
  op: "Floor"
  input: "generator_accuracy/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "generator_accuracy/Equal_1"
  op: "Equal"
  input: "generator_accuracy/Floor_1"
  input: "zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "generator_accuracy/Cast"
  op: "Cast"
  input: "generator_accuracy/Equal"
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
  name: "generator_accuracy/Rank"
  op: "Rank"
  input: "generator_accuracy/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "generator_accuracy/range/start"
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
  name: "generator_accuracy/range/delta"
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
  name: "generator_accuracy/range"
  op: "Range"
  input: "generator_accuracy/range/start"
  input: "generator_accuracy/Rank"
  input: "generator_accuracy/range/delta"
}
node {
  name: "generator_accuracy/d_true_images_acc"
  op: "Mean"
  input: "generator_accuracy/Cast"
  input: "generator_accuracy/range"
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
  name: "generator_accuracy/Cast_1"
  op: "Cast"
  input: "generator_accuracy/Equal_1"
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
  name: "generator_accuracy/Rank_1"
  op: "Rank"
  input: "generator_accuracy/Cast_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "generator_accuracy/range_1/start"
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
  name: "generator_accuracy/range_1/delta"
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
  name: "generator_accuracy/range_1"
  op: "Range"
  input: "generator_accuracy/range_1/start"
  input: "generator_accuracy/Rank_1"
  input: "generator_accuracy/range_1/delta"
}
node {
  name: "generator_accuracy/d_fake_images_acc"
  op: "Mean"
  input: "generator_accuracy/Cast_1"
  input: "generator_accuracy/range_1"
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
  name: "generator_accuracy/AddN"
  op: "AddN"
  input: "generator_accuracy/d_true_images_acc"
  input: "generator_accuracy/d_fake_images_acc"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "generator_accuracy/Div/y"
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
        float_val: 2.0
      }
    }
  }
}
node {
  name: "generator_accuracy/Div"
  op: "Div"
  input: "generator_accuracy/AddN"
  input: "generator_accuracy/Div/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "init"
  op: "NoOp"
  input: "^model/generator/H1/linear/W/Assign"
  input: "^model/generator/H1/linear/b/Assign"
  input: "^model/generator/D1/deconv/W/Assign"
  input: "^model/generator/D1/deconv/b/Assign"
  input: "^model/generator/D2/deconv/W/Assign"
  input: "^model/generator/D2/deconv/b/Assign"
  input: "^model/discriminator/C1/conv/W/Assign"
  input: "^model/discriminator/C1/conv/b/Assign"
  input: "^model/discriminator/C2/conv/W/Assign"
  input: "^model/discriminator/C2/conv/b/Assign"
  input: "^model/discriminator/H1/linear/W/Assign"
  input: "^model/discriminator/H1/linear/b/Assign"
  input: "^model/discriminator/H2/linear/W/Assign"
  input: "^model/discriminator/H2/linear/b/Assign"
  input: "^optimization_steps/beta1_power/Assign"
  input: "^optimization_steps/beta2_power/Assign"
  input: "^optimization_steps/model/discriminator/C1/conv/W/d_optimizer/Assign"
  input: "^optimization_steps/model/discriminator/C1/conv/W/d_optimizer_1/Assign"
  input: "^optimization_steps/model/discriminator/C1/conv/b/d_optimizer/Assign"
  input: "^optimization_steps/model/discriminator/C1/conv/b/d_optimizer_1/Assign"
  input: "^optimization_steps/model/discriminator/C2/conv/W/d_optimizer/Assign"
  input: "^optimization_steps/model/discriminator/C2/conv/W/d_optimizer_1/Assign"
  input: "^optimization_steps/model/discriminator/C2/conv/b/d_optimizer/Assign"
  input: "^optimization_steps/model/discriminator/C2/conv/b/d_optimizer_1/Assign"
  input: "^optimization_steps/model/discriminator/H1/linear/W/d_optimizer/Assign"
  input: "^optimization_steps/model/discriminator/H1/linear/W/d_optimizer_1/Assign"
  input: "^optimization_steps/model/discriminator/H1/linear/b/d_optimizer/Assign"
  input: "^optimization_steps/model/discriminator/H1/linear/b/d_optimizer_1/Assign"
  input: "^optimization_steps/model/discriminator/H2/linear/W/d_optimizer/Assign"
  input: "^optimization_steps/model/discriminator/H2/linear/W/d_optimizer_1/Assign"
  input: "^optimization_steps/model/discriminator/H2/linear/b/d_optimizer/Assign"
  input: "^optimization_steps/model/discriminator/H2/linear/b/d_optimizer_1/Assign"
  input: "^optimization_steps/beta1_power_1/Assign"
  input: "^optimization_steps/beta2_power_1/Assign"
  input: "^optimization_steps/model/generator/H1/linear/W/g_optimizer/Assign"
  input: "^optimization_steps/model/generator/H1/linear/W/g_optimizer_1/Assign"
  input: "^optimization_steps/model/generator/H1/linear/b/g_optimizer/Assign"
  input: "^optimization_steps/model/generator/H1/linear/b/g_optimizer_1/Assign"
  input: "^optimization_steps/model/generator/D1/deconv/W/g_optimizer/Assign"
  input: "^optimization_steps/model/generator/D1/deconv/W/g_optimizer_1/Assign"
  input: "^optimization_steps/model/generator/D1/deconv/b/g_optimizer/Assign"
  input: "^optimization_steps/model/generator/D1/deconv/b/g_optimizer_1/Assign"
  input: "^optimization_steps/model/generator/D2/deconv/W/g_optimizer/Assign"
  input: "^optimization_steps/model/generator/D2/deconv/W/g_optimizer_1/Assign"
  input: "^optimization_steps/model/generator/D2/deconv/b/g_optimizer/Assign"
  input: "^optimization_steps/model/generator/D2/deconv/b/g_optimizer_1/Assign"
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
            size: 46
          }
        }
        string_val: "model/discriminator/C1/conv/W"
        string_val: "model/discriminator/C1/conv/b"
        string_val: "model/discriminator/C2/conv/W"
        string_val: "model/discriminator/C2/conv/b"
        string_val: "model/discriminator/H1/linear/W"
        string_val: "model/discriminator/H1/linear/b"
        string_val: "model/discriminator/H2/linear/W"
        string_val: "model/discriminator/H2/linear/b"
        string_val: "model/generator/D1/deconv/W"
        string_val: "model/generator/D1/deconv/b"
        string_val: "model/generator/D2/deconv/W"
        string_val: "model/generator/D2/deconv/b"
        string_val: "model/generator/H1/linear/W"
        string_val: "model/generator/H1/linear/b"
        string_val: "optimization_steps/beta1_power"
        string_val: "optimization_steps/beta1_power_1"
        string_val: "optimization_steps/beta2_power"
        string_val: "optimization_steps/beta2_power_1"
        string_val: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer"
        string_val: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer_1"
        string_val: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer"
        string_val: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer_1"
        string_val: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer"
        string_val: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer_1"
        string_val: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer"
        string_val: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer_1"
        string_val: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer"
        string_val: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer_1"
        string_val: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer"
        string_val: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer_1"
        string_val: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer"
        string_val: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer_1"
        string_val: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer"
        string_val: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer_1"
        string_val: "optimization_steps/model/generator/D1/deconv/W/g_optimizer"
        string_val: "optimization_steps/model/generator/D1/deconv/W/g_optimizer_1"
        string_val: "optimization_steps/model/generator/D1/deconv/b/g_optimizer"
        string_val: "optimization_steps/model/generator/D1/deconv/b/g_optimizer_1"
        string_val: "optimization_steps/model/generator/D2/deconv/W/g_optimizer"
        string_val: "optimization_steps/model/generator/D2/deconv/W/g_optimizer_1"
        string_val: "optimization_steps/model/generator/D2/deconv/b/g_optimizer"
        string_val: "optimization_steps/model/generator/D2/deconv/b/g_optimizer_1"
        string_val: "optimization_steps/model/generator/H1/linear/W/g_optimizer"
        string_val: "optimization_steps/model/generator/H1/linear/W/g_optimizer_1"
        string_val: "optimization_steps/model/generator/H1/linear/b/g_optimizer"
        string_val: "optimization_steps/model/generator/H1/linear/b/g_optimizer_1"
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
            size: 46
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
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
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
  input: "model/discriminator/C1/conv/W"
  input: "model/discriminator/C1/conv/b"
  input: "model/discriminator/C2/conv/W"
  input: "model/discriminator/C2/conv/b"
  input: "model/discriminator/H1/linear/W"
  input: "model/discriminator/H1/linear/b"
  input: "model/discriminator/H2/linear/W"
  input: "model/discriminator/H2/linear/b"
  input: "model/generator/D1/deconv/W"
  input: "model/generator/D1/deconv/b"
  input: "model/generator/D2/deconv/W"
  input: "model/generator/D2/deconv/b"
  input: "model/generator/H1/linear/W"
  input: "model/generator/H1/linear/b"
  input: "optimization_steps/beta1_power"
  input: "optimization_steps/beta1_power_1"
  input: "optimization_steps/beta2_power"
  input: "optimization_steps/beta2_power_1"
  input: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer"
  input: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer_1"
  input: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer"
  input: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer_1"
  input: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer"
  input: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer_1"
  input: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer"
  input: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer_1"
  input: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer"
  input: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer_1"
  input: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer"
  input: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer_1"
  input: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer"
  input: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer_1"
  input: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer"
  input: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer_1"
  input: "optimization_steps/model/generator/D1/deconv/W/g_optimizer"
  input: "optimization_steps/model/generator/D1/deconv/W/g_optimizer_1"
  input: "optimization_steps/model/generator/D1/deconv/b/g_optimizer"
  input: "optimization_steps/model/generator/D1/deconv/b/g_optimizer_1"
  input: "optimization_steps/model/generator/D2/deconv/W/g_optimizer"
  input: "optimization_steps/model/generator/D2/deconv/W/g_optimizer_1"
  input: "optimization_steps/model/generator/D2/deconv/b/g_optimizer"
  input: "optimization_steps/model/generator/D2/deconv/b/g_optimizer_1"
  input: "optimization_steps/model/generator/H1/linear/W/g_optimizer"
  input: "optimization_steps/model/generator/H1/linear/W/g_optimizer_1"
  input: "optimization_steps/model/generator/H1/linear/b/g_optimizer"
  input: "optimization_steps/model/generator/H1/linear/b/g_optimizer_1"
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
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
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
        string_val: "model/discriminator/C1/conv/W"
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
  input: "model/discriminator/C1/conv/W"
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
        s: "loc:@model/discriminator/C1/conv/W"
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
        string_val: "model/discriminator/C1/conv/b"
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
  input: "model/discriminator/C1/conv/b"
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
        s: "loc:@model/discriminator/C1/conv/b"
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
        string_val: "model/discriminator/C2/conv/W"
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
  input: "model/discriminator/C2/conv/W"
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
        s: "loc:@model/discriminator/C2/conv/W"
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
        string_val: "model/discriminator/C2/conv/b"
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
  input: "model/discriminator/C2/conv/b"
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
        s: "loc:@model/discriminator/C2/conv/b"
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
        string_val: "model/discriminator/H1/linear/W"
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
  input: "model/discriminator/H1/linear/W"
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
        s: "loc:@model/discriminator/H1/linear/W"
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
        string_val: "model/discriminator/H1/linear/b"
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
  input: "model/discriminator/H1/linear/b"
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
        s: "loc:@model/discriminator/H1/linear/b"
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
        string_val: "model/discriminator/H2/linear/W"
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
  input: "model/discriminator/H2/linear/W"
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
        s: "loc:@model/discriminator/H2/linear/W"
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
        string_val: "model/discriminator/H2/linear/b"
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
  input: "model/discriminator/H2/linear/b"
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
        s: "loc:@model/discriminator/H2/linear/b"
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
  name: "save/restore_slice_8/tensor_name"
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
        string_val: "model/generator/D1/deconv/W"
      }
    }
  }
}
node {
  name: "save/restore_slice_8/shape_and_slice"
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
  name: "save/restore_slice_8"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_8/tensor_name"
  input: "save/restore_slice_8/shape_and_slice"
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
  name: "save/Assign_8"
  op: "Assign"
  input: "model/generator/D1/deconv/W"
  input: "save/restore_slice_8"
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
        s: "loc:@model/generator/D1/deconv/W"
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
  name: "save/restore_slice_9/tensor_name"
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
        string_val: "model/generator/D1/deconv/b"
      }
    }
  }
}
node {
  name: "save/restore_slice_9/shape_and_slice"
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
  name: "save/restore_slice_9"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_9/tensor_name"
  input: "save/restore_slice_9/shape_and_slice"
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
  name: "save/Assign_9"
  op: "Assign"
  input: "model/generator/D1/deconv/b"
  input: "save/restore_slice_9"
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
        s: "loc:@model/generator/D1/deconv/b"
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
  name: "save/restore_slice_10/tensor_name"
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
        string_val: "model/generator/D2/deconv/W"
      }
    }
  }
}
node {
  name: "save/restore_slice_10/shape_and_slice"
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
  name: "save/restore_slice_10"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_10/tensor_name"
  input: "save/restore_slice_10/shape_and_slice"
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
  name: "save/Assign_10"
  op: "Assign"
  input: "model/generator/D2/deconv/W"
  input: "save/restore_slice_10"
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
        s: "loc:@model/generator/D2/deconv/W"
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
  name: "save/restore_slice_11/tensor_name"
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
        string_val: "model/generator/D2/deconv/b"
      }
    }
  }
}
node {
  name: "save/restore_slice_11/shape_and_slice"
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
  name: "save/restore_slice_11"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_11/tensor_name"
  input: "save/restore_slice_11/shape_and_slice"
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
  name: "save/Assign_11"
  op: "Assign"
  input: "model/generator/D2/deconv/b"
  input: "save/restore_slice_11"
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
        s: "loc:@model/generator/D2/deconv/b"
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
  name: "save/restore_slice_12/tensor_name"
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
        string_val: "model/generator/H1/linear/W"
      }
    }
  }
}
node {
  name: "save/restore_slice_12/shape_and_slice"
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
  name: "save/restore_slice_12"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_12/tensor_name"
  input: "save/restore_slice_12/shape_and_slice"
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
  name: "save/Assign_12"
  op: "Assign"
  input: "model/generator/H1/linear/W"
  input: "save/restore_slice_12"
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
        s: "loc:@model/generator/H1/linear/W"
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
  name: "save/restore_slice_13/tensor_name"
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
        string_val: "model/generator/H1/linear/b"
      }
    }
  }
}
node {
  name: "save/restore_slice_13/shape_and_slice"
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
  name: "save/restore_slice_13"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_13/tensor_name"
  input: "save/restore_slice_13/shape_and_slice"
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
  name: "save/Assign_13"
  op: "Assign"
  input: "model/generator/H1/linear/b"
  input: "save/restore_slice_13"
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
        s: "loc:@model/generator/H1/linear/b"
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
  name: "save/restore_slice_14/tensor_name"
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
        string_val: "optimization_steps/beta1_power"
      }
    }
  }
}
node {
  name: "save/restore_slice_14/shape_and_slice"
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
  name: "save/restore_slice_14"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_14/tensor_name"
  input: "save/restore_slice_14/shape_and_slice"
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
  name: "save/Assign_14"
  op: "Assign"
  input: "optimization_steps/beta1_power"
  input: "save/restore_slice_14"
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
        s: "loc:@model/discriminator/C1/conv/W"
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
  name: "save/restore_slice_15/tensor_name"
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
        string_val: "optimization_steps/beta1_power_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_15/shape_and_slice"
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
  name: "save/restore_slice_15"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_15/tensor_name"
  input: "save/restore_slice_15/shape_and_slice"
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
  name: "save/Assign_15"
  op: "Assign"
  input: "optimization_steps/beta1_power_1"
  input: "save/restore_slice_15"
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
        s: "loc:@model/generator/H1/linear/W"
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
  name: "save/restore_slice_16/tensor_name"
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
        string_val: "optimization_steps/beta2_power"
      }
    }
  }
}
node {
  name: "save/restore_slice_16/shape_and_slice"
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
  name: "save/restore_slice_16"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_16/tensor_name"
  input: "save/restore_slice_16/shape_and_slice"
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
  name: "save/Assign_16"
  op: "Assign"
  input: "optimization_steps/beta2_power"
  input: "save/restore_slice_16"
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
        s: "loc:@model/discriminator/C1/conv/W"
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
  name: "save/restore_slice_17/tensor_name"
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
        string_val: "optimization_steps/beta2_power_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_17/shape_and_slice"
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
  name: "save/restore_slice_17"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_17/tensor_name"
  input: "save/restore_slice_17/shape_and_slice"
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
  name: "save/Assign_17"
  op: "Assign"
  input: "optimization_steps/beta2_power_1"
  input: "save/restore_slice_17"
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
        s: "loc:@model/generator/H1/linear/W"
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
  name: "save/restore_slice_18/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_18/shape_and_slice"
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
  name: "save/restore_slice_18"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_18/tensor_name"
  input: "save/restore_slice_18/shape_and_slice"
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
  name: "save/Assign_18"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer"
  input: "save/restore_slice_18"
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
        s: "loc:@model/discriminator/C1/conv/W"
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
  name: "save/restore_slice_19/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_19/shape_and_slice"
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
  name: "save/restore_slice_19"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_19/tensor_name"
  input: "save/restore_slice_19/shape_and_slice"
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
  name: "save/Assign_19"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C1/conv/W/d_optimizer_1"
  input: "save/restore_slice_19"
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
        s: "loc:@model/discriminator/C1/conv/W"
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
  name: "save/restore_slice_20/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_20/shape_and_slice"
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
  name: "save/restore_slice_20"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_20/tensor_name"
  input: "save/restore_slice_20/shape_and_slice"
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
  name: "save/Assign_20"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer"
  input: "save/restore_slice_20"
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
        s: "loc:@model/discriminator/C1/conv/b"
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
  name: "save/restore_slice_21/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_21/shape_and_slice"
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
  name: "save/restore_slice_21"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_21/tensor_name"
  input: "save/restore_slice_21/shape_and_slice"
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
  name: "save/Assign_21"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C1/conv/b/d_optimizer_1"
  input: "save/restore_slice_21"
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
        s: "loc:@model/discriminator/C1/conv/b"
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
  name: "save/restore_slice_22/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_22/shape_and_slice"
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
  name: "save/restore_slice_22"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_22/tensor_name"
  input: "save/restore_slice_22/shape_and_slice"
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
  name: "save/Assign_22"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer"
  input: "save/restore_slice_22"
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
        s: "loc:@model/discriminator/C2/conv/W"
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
  name: "save/restore_slice_23/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_23/shape_and_slice"
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
  name: "save/restore_slice_23"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_23/tensor_name"
  input: "save/restore_slice_23/shape_and_slice"
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
  name: "save/Assign_23"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C2/conv/W/d_optimizer_1"
  input: "save/restore_slice_23"
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
        s: "loc:@model/discriminator/C2/conv/W"
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
  name: "save/restore_slice_24/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_24/shape_and_slice"
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
  name: "save/restore_slice_24"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_24/tensor_name"
  input: "save/restore_slice_24/shape_and_slice"
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
  name: "save/Assign_24"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer"
  input: "save/restore_slice_24"
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
        s: "loc:@model/discriminator/C2/conv/b"
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
  name: "save/restore_slice_25/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_25/shape_and_slice"
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
  name: "save/restore_slice_25"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_25/tensor_name"
  input: "save/restore_slice_25/shape_and_slice"
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
  name: "save/Assign_25"
  op: "Assign"
  input: "optimization_steps/model/discriminator/C2/conv/b/d_optimizer_1"
  input: "save/restore_slice_25"
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
        s: "loc:@model/discriminator/C2/conv/b"
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
  name: "save/restore_slice_26/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_26/shape_and_slice"
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
  name: "save/restore_slice_26"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_26/tensor_name"
  input: "save/restore_slice_26/shape_and_slice"
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
  name: "save/Assign_26"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer"
  input: "save/restore_slice_26"
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
        s: "loc:@model/discriminator/H1/linear/W"
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
  name: "save/restore_slice_27/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_27/shape_and_slice"
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
  name: "save/restore_slice_27"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_27/tensor_name"
  input: "save/restore_slice_27/shape_and_slice"
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
  name: "save/Assign_27"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H1/linear/W/d_optimizer_1"
  input: "save/restore_slice_27"
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
        s: "loc:@model/discriminator/H1/linear/W"
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
  name: "save/restore_slice_28/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_28/shape_and_slice"
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
  name: "save/restore_slice_28"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_28/tensor_name"
  input: "save/restore_slice_28/shape_and_slice"
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
  name: "save/Assign_28"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer"
  input: "save/restore_slice_28"
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
        s: "loc:@model/discriminator/H1/linear/b"
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
  name: "save/restore_slice_29/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_29/shape_and_slice"
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
  name: "save/restore_slice_29"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_29/tensor_name"
  input: "save/restore_slice_29/shape_and_slice"
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
  name: "save/Assign_29"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H1/linear/b/d_optimizer_1"
  input: "save/restore_slice_29"
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
        s: "loc:@model/discriminator/H1/linear/b"
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
  name: "save/restore_slice_30/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_30/shape_and_slice"
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
  name: "save/restore_slice_30"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_30/tensor_name"
  input: "save/restore_slice_30/shape_and_slice"
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
  name: "save/Assign_30"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer"
  input: "save/restore_slice_30"
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
        s: "loc:@model/discriminator/H2/linear/W"
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
  name: "save/restore_slice_31/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_31/shape_and_slice"
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
  name: "save/restore_slice_31"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_31/tensor_name"
  input: "save/restore_slice_31/shape_and_slice"
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
  name: "save/Assign_31"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H2/linear/W/d_optimizer_1"
  input: "save/restore_slice_31"
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
        s: "loc:@model/discriminator/H2/linear/W"
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
  name: "save/restore_slice_32/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_32/shape_and_slice"
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
  name: "save/restore_slice_32"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_32/tensor_name"
  input: "save/restore_slice_32/shape_and_slice"
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
  name: "save/Assign_32"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer"
  input: "save/restore_slice_32"
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
        s: "loc:@model/discriminator/H2/linear/b"
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
  name: "save/restore_slice_33/tensor_name"
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
        string_val: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_33/shape_and_slice"
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
  name: "save/restore_slice_33"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_33/tensor_name"
  input: "save/restore_slice_33/shape_and_slice"
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
  name: "save/Assign_33"
  op: "Assign"
  input: "optimization_steps/model/discriminator/H2/linear/b/d_optimizer_1"
  input: "save/restore_slice_33"
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
        s: "loc:@model/discriminator/H2/linear/b"
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
  name: "save/restore_slice_34/tensor_name"
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
        string_val: "optimization_steps/model/generator/D1/deconv/W/g_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_34/shape_and_slice"
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
  name: "save/restore_slice_34"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_34/tensor_name"
  input: "save/restore_slice_34/shape_and_slice"
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
  name: "save/Assign_34"
  op: "Assign"
  input: "optimization_steps/model/generator/D1/deconv/W/g_optimizer"
  input: "save/restore_slice_34"
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
        s: "loc:@model/generator/D1/deconv/W"
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
  name: "save/restore_slice_35/tensor_name"
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
        string_val: "optimization_steps/model/generator/D1/deconv/W/g_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_35/shape_and_slice"
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
  name: "save/restore_slice_35"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_35/tensor_name"
  input: "save/restore_slice_35/shape_and_slice"
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
  name: "save/Assign_35"
  op: "Assign"
  input: "optimization_steps/model/generator/D1/deconv/W/g_optimizer_1"
  input: "save/restore_slice_35"
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
        s: "loc:@model/generator/D1/deconv/W"
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
  name: "save/restore_slice_36/tensor_name"
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
        string_val: "optimization_steps/model/generator/D1/deconv/b/g_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_36/shape_and_slice"
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
  name: "save/restore_slice_36"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_36/tensor_name"
  input: "save/restore_slice_36/shape_and_slice"
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
  name: "save/Assign_36"
  op: "Assign"
  input: "optimization_steps/model/generator/D1/deconv/b/g_optimizer"
  input: "save/restore_slice_36"
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
        s: "loc:@model/generator/D1/deconv/b"
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
  name: "save/restore_slice_37/tensor_name"
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
        string_val: "optimization_steps/model/generator/D1/deconv/b/g_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_37/shape_and_slice"
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
  name: "save/restore_slice_37"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_37/tensor_name"
  input: "save/restore_slice_37/shape_and_slice"
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
  name: "save/Assign_37"
  op: "Assign"
  input: "optimization_steps/model/generator/D1/deconv/b/g_optimizer_1"
  input: "save/restore_slice_37"
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
        s: "loc:@model/generator/D1/deconv/b"
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
  name: "save/restore_slice_38/tensor_name"
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
        string_val: "optimization_steps/model/generator/D2/deconv/W/g_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_38/shape_and_slice"
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
  name: "save/restore_slice_38"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_38/tensor_name"
  input: "save/restore_slice_38/shape_and_slice"
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
  name: "save/Assign_38"
  op: "Assign"
  input: "optimization_steps/model/generator/D2/deconv/W/g_optimizer"
  input: "save/restore_slice_38"
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
        s: "loc:@model/generator/D2/deconv/W"
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
  name: "save/restore_slice_39/tensor_name"
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
        string_val: "optimization_steps/model/generator/D2/deconv/W/g_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_39/shape_and_slice"
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
  name: "save/restore_slice_39"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_39/tensor_name"
  input: "save/restore_slice_39/shape_and_slice"
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
  name: "save/Assign_39"
  op: "Assign"
  input: "optimization_steps/model/generator/D2/deconv/W/g_optimizer_1"
  input: "save/restore_slice_39"
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
        s: "loc:@model/generator/D2/deconv/W"
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
  name: "save/restore_slice_40/tensor_name"
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
        string_val: "optimization_steps/model/generator/D2/deconv/b/g_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_40/shape_and_slice"
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
  name: "save/restore_slice_40"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_40/tensor_name"
  input: "save/restore_slice_40/shape_and_slice"
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
  name: "save/Assign_40"
  op: "Assign"
  input: "optimization_steps/model/generator/D2/deconv/b/g_optimizer"
  input: "save/restore_slice_40"
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
        s: "loc:@model/generator/D2/deconv/b"
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
  name: "save/restore_slice_41/tensor_name"
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
        string_val: "optimization_steps/model/generator/D2/deconv/b/g_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_41/shape_and_slice"
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
  name: "save/restore_slice_41"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_41/tensor_name"
  input: "save/restore_slice_41/shape_and_slice"
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
  name: "save/Assign_41"
  op: "Assign"
  input: "optimization_steps/model/generator/D2/deconv/b/g_optimizer_1"
  input: "save/restore_slice_41"
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
        s: "loc:@model/generator/D2/deconv/b"
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
  name: "save/restore_slice_42/tensor_name"
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
        string_val: "optimization_steps/model/generator/H1/linear/W/g_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_42/shape_and_slice"
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
  name: "save/restore_slice_42"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_42/tensor_name"
  input: "save/restore_slice_42/shape_and_slice"
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
  name: "save/Assign_42"
  op: "Assign"
  input: "optimization_steps/model/generator/H1/linear/W/g_optimizer"
  input: "save/restore_slice_42"
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
        s: "loc:@model/generator/H1/linear/W"
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
  name: "save/restore_slice_43/tensor_name"
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
        string_val: "optimization_steps/model/generator/H1/linear/W/g_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_43/shape_and_slice"
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
  name: "save/restore_slice_43"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_43/tensor_name"
  input: "save/restore_slice_43/shape_and_slice"
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
  name: "save/Assign_43"
  op: "Assign"
  input: "optimization_steps/model/generator/H1/linear/W/g_optimizer_1"
  input: "save/restore_slice_43"
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
        s: "loc:@model/generator/H1/linear/W"
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
  name: "save/restore_slice_44/tensor_name"
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
        string_val: "optimization_steps/model/generator/H1/linear/b/g_optimizer"
      }
    }
  }
}
node {
  name: "save/restore_slice_44/shape_and_slice"
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
  name: "save/restore_slice_44"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_44/tensor_name"
  input: "save/restore_slice_44/shape_and_slice"
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
  name: "save/Assign_44"
  op: "Assign"
  input: "optimization_steps/model/generator/H1/linear/b/g_optimizer"
  input: "save/restore_slice_44"
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
        s: "loc:@model/generator/H1/linear/b"
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
  name: "save/restore_slice_45/tensor_name"
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
        string_val: "optimization_steps/model/generator/H1/linear/b/g_optimizer_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_45/shape_and_slice"
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
  name: "save/restore_slice_45"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_45/tensor_name"
  input: "save/restore_slice_45/shape_and_slice"
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
  name: "save/Assign_45"
  op: "Assign"
  input: "optimization_steps/model/generator/H1/linear/b/g_optimizer_1"
  input: "save/restore_slice_45"
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
        s: "loc:@model/generator/H1/linear/b"
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
  input: "^save/Assign_8"
  input: "^save/Assign_9"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
  input: "^save/Assign_19"
  input: "^save/Assign_20"
  input: "^save/Assign_21"
  input: "^save/Assign_22"
  input: "^save/Assign_23"
  input: "^save/Assign_24"
  input: "^save/Assign_25"
  input: "^save/Assign_26"
  input: "^save/Assign_27"
  input: "^save/Assign_28"
  input: "^save/Assign_29"
  input: "^save/Assign_30"
  input: "^save/Assign_31"
  input: "^save/Assign_32"
  input: "^save/Assign_33"
  input: "^save/Assign_34"
  input: "^save/Assign_35"
  input: "^save/Assign_36"
  input: "^save/Assign_37"
  input: "^save/Assign_38"
  input: "^save/Assign_39"
  input: "^save/Assign_40"
  input: "^save/Assign_41"
  input: "^save/Assign_42"
  input: "^save/Assign_43"
  input: "^save/Assign_44"
  input: "^save/Assign_45"
}
versions {
  producer: 9
}
