clc;
clear;
close all;
disp('programmer:Seid Saeed Mirbagheri (400126116)')
BC=input('Enter boundary condition: 1-Two condition piecewise function   2-Three condition piecewise function     3-Sinus function:  ');
method=input('  Enter method: 1-FTBS(UpWind)   2-Lax   3-LaxVenrof   4:MacCormack:  ');
a=0.5;
delta_x=0.01;
v=[ 1, 0.75 , 0.5 ,0.2];
disp('\nu =')
disp(v)
for i=1:length(v)
    delta_t=(v(i)*delta_x)/a;
    x=0:delta_x:1;
    t=0:delta_t:1;
    BBeta=0:pi/100:pi;
    [u,U_real]=BandI_conditions(BC,x,t);
    [G,u]=Linear_wave_solution_methods(u,BBeta,x,t,v(i),method);

    figure(1)
    if i==1
    plot(x,U_real,'b',LineWidth=1.5)
    hold on
    end
    plot(x,u(:,end),LineWidth=1.5);
    grid on;
    hold on;
    xlabel('x')
    ylabel('U')
    
    Beta=0:0.001:2*pi;
    figure(2)
    plot(BBeta./pi,G,LineWidth=1.5);
    xlabel('Phase angle (\Phi/pi)')
    ylabel('magnitude of Amplification factor (G)')
    hold on
    figure(3)
    polarplot(BBeta,G);
    hold on
end
figure(1)
legend('numerical solution','\nu=1','\nu=0.75','\nu=0.5','\nu=0.2')
figure(2)
legend('\nu=1','\nu=0.75','\nu=0.5','\nu=0.2')
figure(3)
legend('\nu=1','\nu=0.75','\nu=0.5','\nu=0.2')
    