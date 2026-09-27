%Plate Plots
%Script that plots the solution for the Heated_Plate Problem

x = linspace(dx,a-dx,Nx); 
y = linspace(dy,b-dy,Ny); 
[X,Y] = meshgrid(x,y);
X = X';
Y = Y';
figure
set(gcf,'Color','w','Position', [300,0,400,800])
subplot(311)
surf(X,Y,Sol(Node)),xlim([0,a]), ylim([0,b])
TT(1)=xlabel('x(m)');TT(2)=ylabel('y(m)');TT(3)=zlabel('T(^oC)');
TT(4)=title(sprintf('Numerical Solution with\nNx=%g, Ny=%g',Nx,Ny));
formatplot([],gca,TT);

subplot(312)
surf(X,Y,T),xlim([0,a]), ylim([0,b])
TT(1)=xlabel('x(m)');TT(2)=ylabel('y(m)');TT(3)=zlabel('T(^oC)');
TT(4)=title(sprintf('Analytical Solution with\nNx=%g, Ny=%g',Nx,Ny));
formatplot([],gca,TT);

subplot(313)

surf(X(is:ie,js:je),Y(is:ie,js:je),T(is:ie,js:je)-Sol(Node(is:ie,js:je)))
xlim([0,a]), ylim([0,b/2])
TT(1)=xlabel('x(m)');TT(2)=ylabel('y(m)');TT(3)=zlabel('T(^oC)');
TT(4)=title(sprintf('Relative Error:\n |Analytical-Numerical|/Analytical',Nx,Ny));
formatplot([],gca,TT);