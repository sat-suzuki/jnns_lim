import sys, os, os.path
import numpy as np
import caffe

caffe_root = '../'
sys.path.insert(0, caffe_root + "python/")
MEAN_FILE = caffe_root + 'python/caffe/imagenet/ilsvrc_2012_mean.npy'
MODEL_FILE = 'deploy.prototxt'
PRETRAINED = caffe_root + 'models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel'
LAYER = 'fc6wi'
INDEX = 4

net = caffe.Classifier(MODEL_FILE, PRETRAINED)
#net.set_phase_test()
caffe.set_mode_cpu()
#net.set_mode_gpu()
net.transformer.set_mean('data', np.load(MEAN_FILE))
#net.set_mean('data', np.load(caffe_root + 'python/caffe/imagenet/ilsvrc_2012_mean.npy'))
net.transformer.set_raw_scale('data', 255)
net.transformer.set_channel_swap('data', (2,1,0))

image = caffe.io.load_image(caffe_root + '/examples/images/cat.jpg')
net.predict([ image ])
feat = net.blobs[LAYER].data[INDEX].flatten().tolist()
print(' '.join(map(str, feat)))



