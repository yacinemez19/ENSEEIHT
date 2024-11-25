% function noircir_pixels_blancs (pour exercice_3.m)

function I_sans_blanc = noircir_pixels_blancs(I)

    I_sans_blanc = I;
    I_sans_blanc(I >= 245) = 0;

    
end
