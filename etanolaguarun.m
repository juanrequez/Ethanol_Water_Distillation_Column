close all
%resolver la ecuación diferencial
tspan=[0 100];

x0=[ 0.6875    0.5667    0.4750    0.4024    0.3356    0.2643    0.2642...
    0.2641    0.2634    0.2585    0.2290    0.1258    0.0314]';

[t,x]=ode15s(@etanolagua,tspan,x0);
figure
subplot(2,1,1)
plot(t,x(:,1));
subplot(2,1,2)
plot(t,x(:,end));
figure
plot(t,x)

xini=x(end,:)