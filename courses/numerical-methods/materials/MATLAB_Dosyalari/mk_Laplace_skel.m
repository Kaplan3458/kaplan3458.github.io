function [A,RHS] = mk_Laplace(Nx, Ny, a, b, bcs, Node)
% function [A,F] = mk_Laplace(Nx, Ny, a, b, bcs, Node)
% This function creates the A matrix and RHS vector for the discretized 2D
% Laplace equation.
%
% INPUTS:
%       Nx:     Number of interior nodes in the x-direction
%       Ny:     Number of interior nodes in the y-direction
%       a:      Size of x domain [0,a]
%       b:      Size of y domain [0,b]
%       bcs:    Vector containing the values of dirichlet boundary
%                   conditions. [Left Right Bottom Top]
%       Node:   Is the node numbering matrix. size(Node) = [Nx,Ny]
% OUTPUTS:
%       A:      The A matrix
%       RHS:    The Right-hand-side vector (include BC contributions)
%
% Skeleton written by:   Matt Ueckermann, Tapovan Lolla.
% Skeleton completed by:

% Calculate the size of x and y increments
dx = a./(Nx+1);  % Watch Picket... uh... fencepost errors!
dy = b./(Ny+1);   % Watch Picket... uh... fencepost errors!
TotalNodes = Nx*Ny; % Total interior nodes

% Initialize the A matrix. Notice we are initializing it as a sparse
% matrix in order to reduce memory requirements. For a large number of
% nodes, this sparse matrix allocation would be essential, otherwise we may
% run out of memory.

A = spalloc(TotalNodes, TotalNodes, 9*TotalNodes); % A matrix for interior nodes.

% Initialize the RHS vector (in Ax=b, this is the 'b' vector)
RHS = zeros(TotalNodes,1);
for i=1:TotalNodes
    % Add source term contributions here
    RHS(i,1) = 0; %(Note, worry about the boundary values later)
end

% ----------------------------%
% Constructing the 'A' Matrix %
% ----------------------------%

% First account for interior nodes, which are not next to the boundary grid
% points

for i = 2:Nx-1      % The range 2 to Nx-1 excludes interior nodes next to boundaries
    for j = 2:Ny-1  % The range 2 to Ny-1 excludes interior nodes next to boundaries

        % Now we stamp the computational cell into the 'A' Matrix
        % The rows correspond to the equation for solving the ij'th node.
        % First we obtain this node's number from the 'Node' matrix.
        
        Rowij = Node(i,j);
        % The columns in the current row correspond to the variables used to
        % in the equation for solving the ij'th node.

        % Start with the middle node of stencil
        A(Rowij, Node(i,j)) = %FILL IN APPROPRIATE COEFFICIENT

        % Now the left-most component in the computational cell, and proceed
        % clock-wise;

        A(Rowij, Node(i,j-1) ) = %FILL IN APPROPRIATE COEFFICIENT
        A(Rowij, Node(i+1,j) ) = %FILL IN APPROPRIATE COEFFICIENT
        A(Rowij, Node(i,j+1) ) = %FILL IN APPROPRIATE COEFFICIENT
        A(Rowij, Node(i-1,j) ) = %FILL IN APPROPRIATE COEFFICIENT
    end
end

%% Now account for interior nodes that are next to the boundaries.

% Interior nodes next to Left boundary (y = 0)
j = 1;
for i = 2:Nx-1
    Rowij = Node(i,j);
    A(Rowij, Node(i,j)) =     %FILL IN APPROPRIATE COEFFICIENT
    
    A(Rowij, Node(i+1,j)) =  %FILL IN APPROPRIATE COEFFICIENT
    A(Rowij, Node(i,j+1)) =  %FILL IN APPROPRIATE COEFFICIENT
    A(Rowij, Node(i-1,j)) =  %FILL IN APPROPRIATE COEFFICIENT
    RHS(Rowij) = RHS(Rowij) - bcs(1)*%FILL IN APPROPRIATE COEFFICIENT
end

% Interior nodes next to right boundary (y = b)
j =    % FILL IN APPROPRIATE INDEX;
for i = % FILL IN APPROPRIATE RANGE;
    Rowij = Node(i,j);
    A(Rowij, Node(i, j)) = %FILL IN APPROPRIATE COEFFICIENT
    
    A(Rowij, Node(i,j-1)) = %FILL IN APPROPRIATE COEFFICIENT
    A(Rowij, Node(i+1,j)) = %FILL IN APPROPRIATE COEFFICIENT
    A(Rowij, Node(i-1,j)) = %FILL IN APPROPRIATE COEFFICIENT
    RHS(Rowij) = RHS(Rowij) - bcs(2)*%FILL IN APPROPRIATE COEFFICIENT
end

% Interior nodes next to bottom boundary (x = a)
i = Nx;
for j = 2:Ny-1
    Rowij = Node(i,j);
    A(Rowij, Node(i,j)) = %FILL IN APPROPRIATE COEFFICIENT
    
    A(Rowij, Node(i, j-1)) = %FILL IN APPROPRIATE COEFFICIENT
    A(Rowij, Node(i-1, j)) = %FILL IN APPROPRIATE COEFFICIENT
    A(Rowij, Node(i, j+1)) = %FILL IN APPROPRIATE COEFFICIENT
    RHS(Rowij) = RHS(Rowij) - bcs(3)* %FILL IN APPROPRIATE COEFFICIENT
end

% Interior nodes next to top of domain (x = 0)
i = 1;
for j = 2:Ny-1;
    Rowij = Node(i,j);
    A(Rowij, Node(i,j)) = %FILL IN APPROPRIATE COEFFICIENT
    
    A(Rowij, Node(i,j-1)) = %FILL IN APPROPRIATE COEFFICIENT
    A(Rowij, Node(i,j+1)) = %FILL IN APPROPRIATE COEFFICIENT
    A(Rowij, Node(i+1,j)) = %FILL IN APPROPRIATE COEFFICIENT
    RHS(Rowij)= RHS(Rowij) - bcs(4)*%FILL IN APPROPRIATE COEFFICIENT
end

% Now fill in corner interior points

% Bottom left
Rowij = Node(Nx,1);
A(Rowij, Node(Nx,1)) = %FILL IN APPROPRIATE COEFFICIENT
A(Rowij, Node(Nx,2)) = %FILL IN APPROPRIATE COEFFICIENT
A(Rowij, Node(Nx-1,1)) = %FILL IN APPROPRIATE COEFFICIENT
RHS(Rowij) = RHS(Rowij) - bcs(1)*%FILL IN APPROPRIATE COEFFICIENT
RHS(Rowij) = RHS(Rowij) - bcs(3)*%FILL IN APPROPRIATE COEFFICIENT

% Bottom right
Rowij = Node(Nx,Ny);
A(Rowij, Node(Nx,Ny)) = %FILL IN APPROPRIATE COEFFICIENT
A(Rowij, Node(Nx,Ny-1)) = %FILL IN APPROPRIATE COEFFICIENT
A(Rowij, Node(Nx-1,Ny)) = %FILL IN APPROPRIATE COEFFICIENT
RHS(Rowij)= RHS(Rowij) - bcs(2)*%FILL IN APPROPRIATE COEFFICIENT
RHS(Rowij)= RHS(Rowij) - bcs(3)*%FILL IN APPROPRIATE COEFFICIENT

% Top left
Rowij = Node(1,1);
A(Rowij, Node(1,1)) = %FILL IN APPROPRIATE COEFFICIENT
A(Rowij, Node(1,2)) = %FILL IN APPROPRIATE COEFFICIENT
A(Rowij, Node(2,1)) = %FILL IN APPROPRIATE COEFFICIENT
RHS(Rowij) = RHS(Rowij) - bcs(1)*%FILL IN APPROPRIATE COEFFICIENT
RHS(Rowij) = RHS(Rowij) - bcs(4)*%FILL IN APPROPRIATE COEFFICIENT

% Top right
Rowij = Node(1,Ny);
A(Rowij, Node(1,Ny)) = %FILL IN APPROPRIATE COEFFICIENT
A(Rowij, Node(1,Ny-1)) = %FILL IN APPROPRIATE COEFFICIENT;
A(Rowij, Node(2,Ny)) = %FILL IN APPROPRIATE COEFFICIENT;
RHS(Rowij)= RHS(Rowij) - bcs(2)*%FILL IN APPROPRIATE COEFFICIENT;
RHS(Rowij)= RHS(Rowij) - bcs(4)*%FILL IN APPROPRIATE COEFFICIENT;;