function [deltil,onset,no_onsets]=modified_onset_detection(Xkl,del,lamda,M)
L=size(Xkl,2);
deltil=zeros(1,L);
Xkl=[zeros(1,M) Xkl zeros(1,M)];

for b=M:L+M-1
    deltil(b-M+1)=del+lamda*median(abs(Xkl(b-M+1:b+M)));  
end

onset=zeros(1,L);
for l=1:L
onset(l)=Xkl(M+l-1)>deltil(l);
end
flag=0;
no_onsets = 0;
for l=1:L
    if(flag==1 && onset(l)==1)
        onset(l)=0;
    elseif(flag==1 && onset(l)==0)
        flag=0;
    elseif(flag==0 && onset(l)==1)
        flag=1;
        no_onsets = no_onsets+1;
    end
end
end