function [Sdl]= SD(Xkl)      % Spectral  Difference L2 norm
K_uniq=size(Xkl,1);          %Computes number of rows in Xkl.
L=size(Xkl,2);               %Computes number of columns in Xkl.
Sdl = zeros(1,L);

for b=1:L
for c=1:K_uniq
    if(b==1)
        if(c==1)
            Sdl(1,b) = Sdl(1,b) + power(abs(Xkl(c,b)),2); 
        else
            Sdl(1,b) = Sdl(1,b) + power(2*abs(Xkl(c,b)),2); %when c=1 i.e. k=0 the value had to be counted once added twice
        end
    else
        if(c==1)
            Sdl(1,b) = Sdl(1,b) + power(((abs(Xkl(c,b))-abs(Xkl(c,b-1))+abs(abs(Xkl(c,b))-abs(Xkl(c,b-1)))))/2,2);
        else
            Sdl(1,b) = Sdl(1,b) + power((abs(Xkl(c,b))-abs(Xkl(c,b-1))+abs(abs(Xkl(c,b))-abs(Xkl(c,b-1)))),2);
    %whenK_uniq is even |Xkl|^2 should be added only once(to be corrected)
        end
    end
end
end


end