% This code will request the following requirements.
% 1.Your computer install libsvm
% (https://www.csie.ntu.edu.tw/~cjlin/libsvm/) and it's matlab wrapper.
% 2.Your target feature representation text must be alined together for
% each class and the class number should be the order.

% Please type the "file_name" the scaled feature representation libsvm format text
% file name.
% And type freely the file name of the ".mat" format you want to save to
% "save_name".
% Please check and type the number of classification class of your target
% dataset.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file_name = 'hoge.txt';
save_name = 'hoge.mat';
class_num = 7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



[y,x] = libsvmread(file_name);
half = int16(size(x,1)/2);
q = zeros(size(x,1)-half,size(x,2));
r = zeros(half,size(x,2));
% Y = zeros(half,1);
YY = zeros(size(x,1)-half,1);
end_num = zeros(class_num,1);
j=1;
k=1;
l=1;
for i =1:size(x,1)

    if mod(i,2) == 0
        q(j,:) = x(i,:);
        % Y(j,1) = y(i);
        
        if i == size(x,1) || i == size(x,1)-1
            end_num(l) = j;
            l = l+1;
        elseif  y(i) ~=  y(i+2)
            end_num(l) = j;
            l = l+1;
        end
        j = j+1;
    end

    if mod(i,2) == 1
        r(k,:) = x(i,:);
        YY(k,1) = y(i);
        k = k+1;
    end

end

m = svmtrain(YY,r,'-t 0 -c 0.03 -q');
save(save_name,'m','q','-v7.3')