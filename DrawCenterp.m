function vbl=DrawCenterp(w,wr,color,size,cx)
%画中央十字
%w 窗口指针
%wr 窗口范围
%color 颜色
%size 大小(占分辨率大小)
%cx 粗细
%ht 每帧持续时间
s=wr(3:end);%获取屏幕分辨率
[c(1),c(2)]=RectCenter(wr);%获取屏幕中央
if size<=0
    size=0.1;
end
sw=min(s)*size;%获取绘制长度
if cx<1
    cx=5;
end
Screen('DrawLine',w,color,c(1)-sw/2,c(2),c(1)+sw/2,c(2),cx);%画横线
Screen('DrawLine',w,color,c(1),c(2)-sw/2,c(1),c(2)+sw/2,cx);%画竖线
vbl=Screen('Flip',w);%翻转
end
