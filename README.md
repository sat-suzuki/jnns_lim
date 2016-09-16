# jnns_lim  
* 9/26,27に行われる日本神経回路学会時限研究会 (http://daemon.inf.uec.ac.jp/ja/events/ei4o9x) の鈴木担当分のソースコードである．
    
##内容
* jnns_1.sh
  * Shounoら[1]の手法をDeep Learningフレームワークの一つであるCaffe(http://caffe.berkeleyvision.org/) で実装した．    
* feature.py
  * 学習済みの.caffemodelからcaffeのpythonラッパーであるpycaffeを用いて特徴量を抽出するpythonコード．
* make_hist_mat.m,make_svmhist.m
  * Shounoら[1]やSuzukiら[2]で用いられているSVMヒストグラムのmatlabソースコード．

##引用
* 手法の詳細及び各自の文献への引用は下記を参照されたい．

```
  [1] Hayaru Shouno, Satoshi Suzuki, Shoji Kido, "A Transfer Learning Method with Deep Convolutional Neural Network for Diffuse Lung Disease Classification", The 22nd International Conference on Neural Information Processing (ICONIP2015) (2015)    
  @inproceedings{Shouno15,
	Author = {Shouno, H. and Suzuki, S. and Kido, S.},
	Booktitle = {Neural Information Processing, 22nd International Conference, ICONIP 2015, Istanbul, Turkey, November 9-12, 2015, Proceedings, Part I},
	Pages = {199-207},
	Publisher = {Springer},
	Series = {Lecture Notes in Computer Science},
	Title = {A Transfer Learning Method with Deep Convolutional Neural Network for Diffuse Lung Disease Classification},
	Volume = {9489},
	Year = {2015}}
   
   [2] Satoshi Suzuki, Hayaru Shouno, "An Architecture Design Method of Deep Convolutional Neural Network", The 23rd International Conference on Neural Information Processing (ICONIP2016) (2016)
   @inproceedings{Suzuki16ICONIP,
	Author = {Suzuki, S. and Shouno, H.},
	Booktitle = {Press},
	Pages = {},
	Publisher = {Springer},
	Series = {Lecture Notes in Computer Science},
	Title = {An Architecture Design Method of Deep Convolutinal Neural Network},
	Volume = {},
	Year = {2016}}
```

##Author
Satoshi Suzuki<sat.suzuki_at_uec.ac.jp>
