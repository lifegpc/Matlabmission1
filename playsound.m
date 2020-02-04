function playsound(i,j)
%i和j分别为显示和输入的情况
persistent data1;
persistent data2;
fs=48000;%频率
if isempty(data1)
    data1=getsound(fs,2,1,0,0.1,500);
end
if isempty(data2)
    data2=getsound(fs,2,1,0,0.1,2400);
end
if i==j
    sound(data1,fs);
else
    sound(data2,fs);
end
end