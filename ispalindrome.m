function output = ispalindrome(~)
clc;
clear all;
s = input('Sentence: ','s');
s = regexprep(s,'[^\w'']',''); %just in case we do have punctuation
s = lower(s); 
a = char(s); %this will break down out sentence into just a character array
for i = 1:numel(a)
    b(i) = a(end-i+1); %So we take the initial value of b and set it to the last value of a.
end
if strcmp(b,a) 
    output = 1;
else
    output = 0;
end


