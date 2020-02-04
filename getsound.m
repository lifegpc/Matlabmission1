function data=getsound(hz,ch,a,f,t,z)
%生成正弦波
%hz 采样频率
%ch 声道数
%a 最高振频
%f 初相
%t 时长(s)
%z 正弦波频率
if hz<=0 
    hz=48000;
end
if ch<=0
    ch=2;
end
if a<=0
    a=1;
end
if t<=0
    t=1;
end
if z<=0
    z=20;
end
l=hz*t;%采样点数
data=zeros(l,ch);
zi=hz/z;%一周期采样点数
for i=1:l
    te=a*sin(f+(i-1)*pi*2/zi);
    for j=1:ch
        data(i,j)=te;
    end
end
end