function Lf = interfacialarea(geometry, bpd, ift, check, pc, oillayer, teta)
if geometry == 1
    Lf = 0;
else
    if geometry == 2
        nc = 3;
        al = pi/(2*nc);
    elseif geometry == 3
        nc = 4;
        al = pi/nc;
    end
    b1 = @(x) pi/2 - al - x;
    b2 = @(x) pi/2 + al - x;
    b1_i = @(x)  x + al - pi/2;
    r = ift/pc;    
    if any(check == 1)
        if teta <= pi/2 - al
            %tetah = acos(pc.*bpd.*sin(al)./ift) - al
            Lf = 6*r*b1(teta);
        elseif teta > pi/2 - al
            %bpd   = ift.*cos(teta + al)./(pc.*sin(al));
            tetah = acos(pc.*bpd.*sin(al)./ift) - al;
            if tetah > pi/2 - al              
                Lf    = 6*r*b1(tetah)         ;       
            elseif tetah <= pi/2 -al
                Lf    = 6*r*b1(tetah);
            end
            if Lf<0
                error('imposible')
            end
        end
    elseif any(check == 0)        
        if any(oillayer)
            %bpd = ift.*cos(teta + al)./(pc.*sin(al));
            tetah = acos(pc.*bpd.*sin(al)./ift) - al;    
            
            Lf = 6*r*b1(tetah) + 6*r*b2(teta);
        else
            Lf = 0;
        end
    end
end
            
