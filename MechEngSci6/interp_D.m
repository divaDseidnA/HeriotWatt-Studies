%Function interpolates between the two variable valy1 and valy2 taking into
%account the relationship between the other three variables valx1,valxmid
%and valx2.
function [value] = interp_D(valx1,valxmid,valx2,valy1,valy2)
value = valy1 + (valy2-valy1)*((valxmid-valx1)/(valx2-valx1));
