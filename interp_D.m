function [value] = interp_D(valx1,valxmid,valx2,valy1,valy2)
value = valy1 + (valy2-valy1)*((valxmid-valx1)/(valx2-valx1));
%% SECTION TITLE
% DESCRIPTIVE TEXT

%% trdfui
