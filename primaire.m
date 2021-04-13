clear all; 
Pp = 4;
Rs = 0.18;%Resistance stator vue en Park en ohm
Ld = 1.15;%Inductance stator de Park directe en mH
Lq = 3.31;%mH Inductance stator dePark quadratique
indc_aim = 1.3;% Induction remanente des aimants en Tesla
f_aim_spire = 200;%Flux des aimants vu par l'ensemble des spire d'une phase en mWb
RCI = 50;%Couple maximum en N.m
Wmbase = 350;%vitesse mecanique de base en rad/s
Emax = 400;%Tenson continue maixmale de l'onduleur en Volts
I_max = 55;%Courant crete maximal dans les phase en A
J = 800e-6; %Intertie entrainee
%% 1.Machine syncrhone
Wv = 70;
E = 12;
k = 0.3;
Cr = k;

for i = 1:120
    t(i)= 0.01*i;
    Vo1(i) = E*sign(sin(Wv*t(i)+pi));
    Vo2(i) = E*sign(sin(Wv*t(i)+pi-2*pi/3));
    Vo3(i) = E*sign(sin(Wv*t(i)+pi-4*pi/3));
end
i = 1:120;
t = 0.01*i;
vo1 = E*sign(sin(Wv*t+pi));
vo2 = E*sign(sin(Wv*t+pi-2*pi/3));
vo3 = E*sign(sin(Wv*t+pi-4*pi/3));
% figure(1)
% hold on
% plot(t,Vo1+5);plot(t,Vo2);plot(t,Vo3-5);
% hold off
% figure(2)
% hold on
% plot(t,vo1+5);plot(t,vo2);plot(t,vo3-5);
hold off
vd = sqrt(2/3)*(cos(Wv*t).*vo1+cos(Wv*t-2*pi/3).*vo2+cos(Wv*t-4*pi/3));
vq = sqrt(2/3)*(-sin(Wv*t).*vo1-sin(Wv*t-2*pi/3).*vo2-sin(Wv*t-4*pi/3));
figure(2)
hold on
plot(t,vd);plot(t,vq);