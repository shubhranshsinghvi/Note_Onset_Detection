function [deltil,ons]=median_thresh(dkl,del,lam,M)
L=size(dkl,2);
deltil=zeros(1,L);
dkl=[zeros(1,M) dkl zeros(1,M)];

for b=M:L+M-1
    deltil(b-M+1)=del+lam*median(abs(dkl(b-M+1:b+M))); 
end

ons=zeros(1,L);
for l=1:L
ons(l)=dkl(M+l-1)>deltil(l);
end
end