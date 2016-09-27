#!/bin/sh -eu

#まずモデルを導入(今回はCaffeNet)
./../scripts/download_model_binary.py ../models/bvlc_reference_caffenet/

#curet用のデータセットを用意
wget -O lmdb.zip https://www.dropbox.com/sh/87sd3ibw6x26o8j/AAApe9dhLkTVS7pUn_ojHyR9a?dl=1
unzip lmdb.zip
rm -rf lmdb.zip
