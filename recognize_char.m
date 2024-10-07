function [char_ans]=recognize_char(I)
load('NewTemplates.mat')
%I=imread('0.bmp');
for i=1:size(NewTemplates,2)
    char=logical(NewTemplates{1,i});
    val = corr2(char,I);
    %figure,imshow(val);
    final_val(i)=sum(val(:));
end
    [~,b]=max(final_val);
    char_ans = char_name(b);
