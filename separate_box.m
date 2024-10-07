function [r,bbox] = separate_box(NR)
r=[];
bbox=[];
[m,~]=size(NR);
for i=1:m
    val1(i)=NR(i,4);
end
for i=1:m
    val2(i)=NR(i,3);
end

mid1 = median(val1);
mid2 = median(val2);
k=1;
for i=1:m
    if((abs(val1(i)-mid1)<mid1*.2))&&(NR(i,4)>NR(i,3))
        if(abs(val2(i)-mid2)<mid2*.6)
            r(k)=i;
            bbox(k,:)=NR(i,:);k=k+1;
        end
    end
end

