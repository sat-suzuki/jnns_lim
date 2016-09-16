% select class(you must select (high_class) > (low_class))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
low_class = 1;
high_class = 2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



M = load(save_name);
m = M.m;
x = M.q;

% calculate bias index
b_index = 0;
for i = 1:(low_class-1)
    b_index = b_index + (class_num-i);
end
b_index = b_index + (high_class - low_class);

if low_class == 1
    coef = [m.sv_coef(1:m.nSV(1),high_class-1);m.sv_coef(m.nSV(1:(high_class-1))+1:sum(m.nSV(1:high_class)),low_class)];
    SVs = [m.SVs(1:m.nSV(1),:);m.SVs(m.nSV(1)+1:sum(m.nSV(1:high_class)),:)];
    w = SVs'*coef;
    b = -m.rho(b_index);
    A = x(1:end_num(1),:);
    B = x(end_num(1)+1:end_num(high_class),:);
else
    coef = [m.sv_coef(sum(m.nSV(1:(low_class-1)))+1:sum(m.nSV(1:low_class)),high_class-1);m.sv_coef(sum(m.nSV(1:(high_class-1)))+1:sum(m.nSV(1:high_class)),low_class)];
    SVs = [m.SVs(sum(m.nSV(1:(low_class-1)))+1:sum(m.nSV(1:low_class)),:);m.SVs(sum(m.nSV(1:(high_class-1)))+1:sum(m.nSV(1:high_class)),:)];
    w = SVs'*coef;
    b = -m.rho(b_index);
    A = x(end_num(low_class-1)+1:end_num(low_class),:);
    B = x(end_num(high_class-1)+1:end_num(high_class),:);
end


p = A*w + b;
q = B*w + b;

% 各ビンにおける個数とその位置を取得
[n1,x1] = hist(p,10);
[n2,x2] = hist(q,10);
% ヒストグラムの描画
h1 = bar(x1,n1,'hist');
hold on
h2 = bar(x2,n2,'hist');
% 色や透明度の設定
set(h1,'FaceAlpha',0.2)
set(h2,'FaceAlpha',0.2,'FaceColor','r')
% ヒストグラムの描画
h1 = bar(x1,n1,'hist');
hold on
h2 = bar(x2,n2,'hist');
% 色や透明度の設定
set(h1,'FaceAlpha',0.2)
set(h2,'FaceAlpha',0.2,'FaceColor','r')

