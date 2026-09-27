function [T] = AnalyticHeatedPlate(Nx, Ny, a, b, T0, k)
% function [T] = AnalyticHeatedPlate(Nx, Ny, a, b, T0, K0)
% This function calculates the series solution for the Heated Plate
% problem. Note, this function only calculates the solution on the
% INTERIOR, not on the boundaries.
%
% INPUTS:
%       Nx:     Number of interior nodes in the x-direction
%       Ny:     Number of interior nodes in the y-direction
%       a:      Size of x domain [0,a]
%       b:      Size of y domain [0,b]
%       T0:     Boundary temperature
%       k:      Number of terms in the series
% OUTPUTS:
%       T:      The analytical solution as an array
%
% Written by:   Matt Ueckermann, Arpit Agarwal, Tapovan Lolla, 
%               Pierre Lermusiaux

if nargin <5
    k=100;T0=80;
end
% Note, we are doing only the interior points, but for an accurate dx, we
% need to include the exterior points.
x = linspace(0,a,Nx+2);
y = linspace(0,b,Ny+2);
[X,Y]=meshgrid(x,y);
X = X'; Y = Y'; % Transpose matrices to align with new definition of axes.
T = zeros(Nx+2,Ny+2);   % Set initial values to zero.
T(:,end) = T0;     % Set boundary conditions.
for i = 2:Nx+1
    for j = 2:Ny+1
        for n=k:-1:1
            m=2*n-1;
            s=sin(m*pi*X(i,j)/a)*sinh(m*pi*Y(i,j)/a)/m/sinh(m*pi*b/a);
            T(i,j)=T(i,j)+s;
        end;
        T(i,j)=T(i,j)*4*T0/pi;
    end;
end;

T = T(2:end-1,2:end-1); % Interior nodes only.