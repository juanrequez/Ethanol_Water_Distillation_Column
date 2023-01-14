function dx=etanolagua(t,x)

%plato de alimentación
alim=6;
%etapas totales
nt=13;

%parametros
M=1.3382*ones(1,13);
M(1)=10;
M(13)=10;
%flujo de vapor
V=8;%entrada
%flujo de destilado
D=5;%entrada y salida
%flujo de alimentación
F=15*0.9;%entrada
%composición de alimentación
zf=0.2500;
%calculo de los otros flujos
L=V-D;%salida
B=F-D;%salida
%volatilidad
alfa=55.858*x.^4-138.26*x.^3+128.32*x.^2-55.953*x+11.582;
y=alfa.*x./(1+(alfa-1).*x);

%inicializar las derivadas de los estados en cero
dx=zeros(nt,1);

%calculo de los estados
n=1; %condensador
dx(n)=(V*y(n+1)-L*x(n)-D*x(n))/M(n);

for n=2:(alim-1)%plato de rectificación
    dx(n)=(L*x(n-1)+V*y(n+1)-L*x(n)-V*y(n))/M(n);
end

n=alim; %plato de alimentación
dx(n)=(L*x(n-1)+V*y(n+1)+F*zf-(L+F)*x(n)-V*y(n))/M(n);

for n=(alim+1):(nt-1) %platos sección de agotamiento
    dx(n)=((L+F)*x(n-1)+V*y(n+1)-(L+F)*x(n)-V*y(n))/M(n);
end
n=nt; %rehervidor
dx(n)=((L+F)*x(n-1)-B*x(n)-V*y(n))/M(n);








