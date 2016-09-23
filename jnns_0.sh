#!/bin/sh -eu

#まずモデルを導入(今回はCaffeNet)
./../scripts/download_model_binary.py models/bvlc_reference_caffenet/

#curet用のデータセットを用意
wget -O lmdb.zip https://www.dropbox.com/sh/csx2ol9ekvgvc7b/AABoCKd4i2gnGJBHeU7N5xcma?dl=1
unzip lmdb.zip
rm lmdb.zip
