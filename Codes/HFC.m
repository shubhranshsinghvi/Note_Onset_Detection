function [Hl]= HFC(Xkl)     %High frequency content
K_uniq=size(Xkl,1);         %Computes number of rows in Xkl.
L=size(Xkl,2);              %Computes number of columns in Xkl.
Hl = zeros(1,L);
for b=1:L
for c=1:K_uniq
    Hl(1,b) = Hl(1,b) + 2*(c-1)*power(abs(Xkl(c,b)),2); %whenK_uniq is even |Xkl|^2 should be added only once(to be corrected)
end
end


end