function [Sfl]= SF(Xkl)      %Spectral  Difference L1 norm
K_uniq=size(Xkl,1);          %Computes number of rows in Xkl.
L=size(Xkl,2);               %Computes number of columns in Xkl.
Sfl = zeros(1,L);

for b=1:L
for c=1:K_uniq
    if(b==1)
        if(c==1)
            Sfl(1,b) = Sfl(1,b) + abs(Xkl(c,b)); 
        else
            Sfl(1,b) = Sfl(1,b) + 2*abs(Xkl(c,b)); %when c=1 i.e. k=0 the value had to be counted once added twice
        end
    else
        if(c==1)
            Sfl(1,b) = Sfl(1,b) + ((abs(Xkl(c,b))-abs(Xkl(c,b-1))+abs(abs(Xkl(c,b))-abs(Xkl(c,b-1)))))/2;
        else
            Sfl(1,b) = Sfl(1,b) + (abs(Xkl(c,b))-abs(Xkl(c,b-1))+abs(abs(Xkl(c,b))-abs(Xkl(c,b-1))));
    %whenK_uniq is even |Xkl|^2 should be added only once(tbc)
        end
    end
end
end


end