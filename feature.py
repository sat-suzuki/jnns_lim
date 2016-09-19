import sys, os, os.path
import numpy as np
sys.path.insert(0,"../python/")
import caffe

caffe_root = '../' 
MEAN_FILE = '../python/caffe/imagenet/ilsvrc_2012_mean.npy'
MODEL_FILE = 'train_val.prototxt'
PRETRAINED = '/home/satoshi/caffe/models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel'
LAYER = 'fc7wi'
INDEX = 4

net = caffe.Classifier(MODEL_FILE, PRETRAINED)
net.set_mode_cpu()
net.set_mean('data', np.load(MEAN_FILE))
net.set_mean('data', np.load(caffe_root + 'python/caffe/imagenet/ilsvrc_2012_mean.npy'))


f = open('test.txt')
data1 = f.read()
f.close()
lines1 = data1.split('\n')
i = 0
for i in range(len(lines1)-1):
    image = caffe.io.load_image(lines1[i])
    net.predict([ image ])
    feat = net.blobs[LAYER].data[INDEX].flatten().tolist()
    l2_feat = feat/np.linalg.norm(feat)
    if i<100:
        print "0",
        print(' '.join(map(str, l2_feat)))
    else:
        print "1",
        print(' '.join(map(str, l2_feat)))
