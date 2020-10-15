clc;
close all;
clear all;

A = imread('C:\Users\Dell\Desktop\image.JPG');
k = 1;
f = 1;
c1 = [];
c2 = [];
[m ,n] = size(A);
for i=1:m
    for j=1:n
        A(i,j) = A(i,j)/255;
        if A(i,j) == 0
            c1(k,1) = i;
            c1(k,2) = j;
            k = k+1;
        else 
            c2(f,1) = i;
            c2(f,2) = j;
            f = f+1;
        end
    end
end

%c1=[4 2;2 4;2 3;3 6;4 4];
%c2=[9 10;6 8;9 5;8 7;10 8];
[m1 ,n1] = size(c1);
[m2 ,n2] = size(c2);
x = c1';
y = c2';
data = [x y];
fy = zeros(1,m1+m2);
mu1 = [0;0];
mu2 = [0;0];
S2 = [0 0;0 0];
S1 = [0 0;0 0];
w = [0;0];
%computing 1st class mean
for i=1:m1
    mu1 = mu1 + x(:,i);
end
mu1 = mu1 / m1;
%computing 2nd class mean
for j=1:m2
    mu2 = mu2 + y(:,j);
end
mu2 = mu2 / m2;
%computing S1 and S2
for i=1:m1
    temp = (x(:,i) - mu1);
    S1 = S1 + temp*temp';
end
S1 = S1/(m1-1);
for i=1:m2
    temp1 = (y(:,i) - mu2);
    S2 = S2 + temp1*temp1';
end
S2 = S2/(m2-1);
%computing Sw
Sw = S1 + S2;
%computing Sb
Sb = (mu1 - mu2)*(mu1 - mu2)';
%computing inv(Sw)*Sb
X = inv1(Sw)*Sb;
%computing eigen values
eigv = EigenValues(X);
%computing A1 = X-lambda*I
A1 = X;
A1(1,1) = X(1,1) - eigv(1,1);
A1(2,2) = X(2,2) - eigv(1,1);
A2 = X;
A2(1,1) = X(1,1) - eigv(2,2);
A2(2,2) = X(2,2) - eigv(2,2);
%computing eigenvectors
eigvec = EigenVec(A1);
eigvec1 = EigenVec(A2);
%computing w and w1
if eigv(1,1) > eigv(2,2)
    w = eigvec;
    w1 = eigvec1;
else
    w = eigvec1;
    w1 = eigvec;
end
for i=1:m1+m2
    fy(1,i) = w'*data(:,i);
    fy(2,i) = w1'*data(:,i);
end
%PLOTTING1
figure
ax1 = subplot(2,1,1);
plot(fy(1,1:m1),0,'og',fy(1,m1+1:m1+m2),0,'or');
title(ax1,'Projected Samples on eigenvector corresponding to highest eigenvalue');
ax1 = subplot(2,1,2);
plot(fy(2,1:m1),0,'og',fy(2,m1+1:m1+m2),0,'or');
title(ax1,'Projected Samples on eigenvector corresponding to smallest eigenvalue');
%PLOTTING2
figure
ax4 = subplot(2,2,1);
plot(c1(:,1),c1(:,2),'o',c2(:,1),c2(:,2),'x');
title(ax4,'Classes');
ax1 = subplot(2,2,2);
plot(fy(1,1:m1),0,'og',fy(1,m1+1:m1+m2),0,'or');
title(ax1,'Projected Samples on Eigenvector1');
ax2 = subplot(2,2,3);
plotv(w,'-');
title(ax2,'Eigenvector1');
ax3 = subplot(2,2,4);
plotv(w1,'-');
title(ax3,'Eigenvector2');

%PLOTTING3
figure
ay1 = subplot(1,1,1);
x = 0:10;
x1 = -10:0;
jm = w(2,1)/w(1,1);
jm1 = w1(2,1)/w1(1,1);
plot(x,jm*x);
hold on
plot(x1,jm1*x1);
plot(c1(:,1),c1(:,2),'o',c2(:,1),c2(:,2),'x');
hold off;
title(ay1,'data samples and eigenvectors');




   