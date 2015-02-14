function [value] = drawPhasors(Z)
format bank
figure
hold on
Len = max(Z);
plot ([-Len, Len], [0,0])
plot ([0,0], [-Len, Len])
axis ([-Len, Len,-Len, Len], 'square')
grid on
title('Phasor diagram')
xlabel('Real axis')
ylabel('Imaginary axis')

for k=1:length(Z)
myList = [real(Z(k)),imag(Z(k))];

arrow([0,0],[real(Z(k)),imag(Z(k))])
%str = sprintf('%f+ %fj', real(Z(k)),imag(Z(k)));
%text(real(Z(k)),imag(Z(k)),str)
end
end
