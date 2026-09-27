% Heated_Plate Driver script
clear all;
clc;
clf;
close all;
a = 5; % Domain size in x-direction
b = 4; % Domain size in y-direction
bcs = [0 80 0 0]; % Boundary conditions on plate [left right bottom top]

% Series of grid sizes (Interior node points)
NX = [19 39]; 
NY = [15 31];
doplots = true; % Flag to put the boundary conditions back into the solution matrix before plotting
k = 120;        % Number of terms in the analytical series solution
for i = 1:length(NX) % For loop through different grid sizes
    Nx = NX(i);
    Ny = NY(i);
    is = 1;
    ie = Nx;
    js = 1;
    je = (1+Ny)/2;
    dx  = a./(Nx+1);  %Watch fencepost errors!
    dy = b./(Ny+1);   %Watch fencepost errors!
    
    % Create Node numbering matrix
    Node = zeros(Nx,Ny);
    Node(:) = ;% CREATE APPROPRIATE NODE NUMBERING

    % Constructing A and RHS
    [A RHS] =  mk_Laplace(Nx, Ny, a, b, bcs, Node);
   
    % Solving System
    display('Solving the system')
    Sol = A\RHS;
    
    % Calculate analytical series solution
    T = AnalyticHeatedPlate(Nx, Ny, a, b, bcs(2), k);
    
    % Plot the solution
    if doplots
        Plate_Plots;
    end
    
    % Calculate the errors (Only for the bottom half of the domain)
    Err(i) = norm(T(is:ie,js:je)-Sol(Node(is:ie,js:je)))/sqrt((ie-is+1)*(je-js+1));
    mErr(i) = max(max(abs(T(is:ie,js:je)-Sol(Node(is:ie,js:je)))));
end

% Determine the rate of convergence
Conv = log(Err(1:end-1)./Err(2:end))/log(2);
mConv = log(mErr(1:end-1)./mErr(2:end))/log(2);
fprintf('The rate of convergence in the L2 norm is %g\n',Conv);
fprintf('The rate of convergence in the infinity norm is %g\n',mConv);