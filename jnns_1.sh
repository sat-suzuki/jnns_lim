#!/bin/sh -eu

#適用データのクラス数
CLASS=61
#train dataのありか
TRAIN=s_suzuki2016/train_lmdb
#test dataのありか
TEST=s_suzuki2016/test_lmdb
#meanファイルのありか
MEAN=s_suzuki2016/curet_mean.binaryproto
#作業ディレクトリ(solverとか置きたいとこ)
DIR=s_suzuki2016



#まずモデルを導入
./scripts/download_model_binary.py models/bvlc_reference_caffenet/

#必要なprototxtファイルをコピー
cp models/bvlc_reference_caffenet/train_val.prototxt ${DIR}/
cp models/bvlc_reference_caffenet/deploy.prototxt ${DIR}/
cp models/bvlc_reference_caffenet/solver.prototxt ${DIR}/

#train_val.prototxtを一部改造
sed -i".org" -e "s/fc8/fc8new/g" ${DIR}/train_val.prototxt
sed -i -e "s/num_output: 1000/num_output: ${CLASS}/g" ${DIR}/train_val.prototxt
sed -i -e "s@examples/imagenet/ilsvrc12_train_lmdb@${TRAIN}@g" ${DIR}/train_val.prototxt
sed -i -e "s@examples/imagenet/ilsvrc12_val_lmdb@${TEST}@g" ${DIR}/train_val.prototxt
sed -i -e "s@data/ilsvrc12/imagenet_mean.binaryproto@${MEAN}@g" ${DIR}/train_val.prototxt
#solver.prototxtも一部改造
sed -i".org" -e "s/GPU/CPU/g" ${DIR}/solver.prototxt
sed -i -e "s/base_lr: 0.01/base_lr: 0.005/g" ${DIR}/solver.prototxt
sed -i -e "s@models/bvlc_reference_caffenet/caffenet_train@transfer_caffenet@g" ${DIR}/solver.prototxt
sed -i -e "s@test_iter: 1000@test_iter: 140@g" ${DIR}/solver.prototxt
sed -i -e "s@models/bvlc_reference_caffenet/train_val.prototxt@${DIR}/train_val.prototxt@g" ${DIR}/solver.prototxt

#学習開始
sudo build/tools/caffe train -solver ${DIR}/solver.prototxt -weights models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel
