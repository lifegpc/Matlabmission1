function vbl=DrawRect(w,wr,color,ht,t,vbl)
%画中央正方形
%w 窗口指针
%wr 窗口范围
%color 颜色
%ht 每帧持续时间
%t 持续时间
fn=round(t/ht);%帧数
[c(1),c(2)]=RectCenter(wr);
l=[wr(3)-wr(1),wr(4)-wr(2)]./4;
l=min(l);
ww=[c(1)-l,c(2)-l,c(1)+l,c(2)+l];%获取绘制范围
for i=1:fn
    Screen('FillRect',w,color,ww);%画正方形
    vbl=Screen('Flip',w,vbl+0.5*ht);%翻转
end
vbl=Screen('Flip',w,vbl+0.5*ht);%翻转
end
