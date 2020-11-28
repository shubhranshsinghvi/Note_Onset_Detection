function [Pl]= WPD(Xkl)     % Phase deviation
K_uniq=size(Xkl,1);         %Computes number of rows in Xkl.
L=size(Xkl,2);              %Computes number of columns in Xkl.
Pl = zeros(1,L);
for b=1:L
for c=1:K_uniq   %conditions on K_uniq(odd/even) and c=1 to be added
    if(b==1)
        if(c==1)
            Pl(1,b) = Pl(1,b) + abs(angle(Xkl(c,b)))*abs(Xkl(c,b));
        else
            Pl(1,b) = Pl(1,b) + 2*abs(angle(Xkl(c,b)))*abs(Xkl(c,b));
        end
    elseif(b==2)
        if(c==1)
            Pl(1,b) = Pl(1,b) + abs(angle(Xkl(c,b))-2*angle(Xkl(c,b-1)))*abs(Xkl(c,b));
        else
            Pl(1,b) = Pl(1,b) + 2*abs(angle(Xkl(c,b))-2*angle(Xkl(c,b-1)))*abs(Xkl(c,b));
        end
    else
        if(c==1)
            Pl(1,b) = Pl(1,b) + abs(angle(Xkl(c,b))-2*angle(Xkl(c,b-1))+angle(Xkl(c,b-2)))*abs(Xkl(c,b));
        else
            Pl(1,b) = Pl(1,b) + 2*abs(angle(Xkl(c,b))-2*angle(Xkl(c,b-1))+angle(Xkl(c,b-2)))*abs(Xkl(c,b));
        end
    end
end
Pl(1,b) = 0.5*Pl(1,b)/K_uniq;
end


end