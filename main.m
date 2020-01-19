%程序入口
sca;
close all;
clearvars;
mm=100;%次数
PsychDefaultSetup(2);%默认设置
sa=Screen('Screens');%获取屏幕
su=max(sa);%选择最大的
white=WhiteIndex(su);%白色
grey=white/2;%灰色
[w,wr]=PsychImaging('OpenWindow',su,grey);%新建窗口
hz=Screen('NominalFrameRate',w);%屏幕刷新率
ht=1/hz;%每帧持续时间
vbl=DrawCenterp(w,wr,[255 0 0],0.1,5);%画中心红十字
while true%等待被试按空格
    [s,k]=KbWait();%s时间 k按键
    if k(32)==1%判断是否为空格
        break;
    end
end
c=[];%存储出现顺序,0红圆,1蓝正方形
for i=1:round(mm/2)
    c=[c 0];
end
for i=1:(mm-round(mm/2))
    c=[c 1];
end
c=Shuffle(c);
Priority(MaxPriority(w));%设置最高优先级
r=[];%存储回答 0 向上 1 向下
vbl=Screen('Flip',w);%翻转
for i=1:mm
    WaitSecs(0.2);%等待0.2秒
    vbl=Screen('Flip',w);%翻转
    if c(i)==0
        vbl=DrawCircle(w,wr,[255 0 0],ht,0.1,vbl);%画红圆
    else
        vbl=DrawRect(w,wr,[0 0 255],ht,0.1,vbl);%画蓝正方形
    end
    while true%等待按键
        [s,k]=KbWait();%s时间 k按键
        if k(38)==1%向上
            r=[r 0];
            break;
        elseif k(40)==1%向下
            r=[r 1];
            break;
        end
    end
end
Priority(0);%解除最高优先级
sca;
re=false(mm,3);
num=0;
for i=1:mm%进行判断
    re(i,1)=boolean(c(i));%出现顺序
    re(i,2)=boolean(r(i));%回答原始情况
    if c(i)==r(i)%回答正确
        re(i,3)=true;
        num=num+1;
    else%回答错误
        re(i,3)=false;
    end
end
msgbox([char([20320 22238 31572 23545 20102]) num2str(num) char([39064 12290])],char([27979 35797 32467 26524]));
%弹出对话框 输出结果 你回答对了num次。
paras=inputdlg({char([25991 20214 21517 31216])},char([23384 20648 25991 20214]),1,{'re.mat'});
%文件名称 保存文件
if ~isempty(paras)
    save(paras{1},'re');
end
clearvars;
