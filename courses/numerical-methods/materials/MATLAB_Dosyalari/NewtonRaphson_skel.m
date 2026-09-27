function [x iter err] = NewtonRaphson(f,df,x,TOL, maxit)
% function [x iter] = NewtonRaphson(f,df,x,TOL, maxit)
%    NEWTONRAPHSON uses Newton-Raphson iteration to find the root of the
%       provided function until a specified error tolerance is reached
%
% INPUTS:
%           f:      function handle of the function whose root you wish
%                   to find.
%                   Note: f(x_exact) = 0            
% 			df:     function handle of the derivative of f
% 			x:      initial guess value (Optional, default=0)
% 			TOL:    error tolerance, stopping criteria
% 			Maxit:  maximum number of iterations, stopping criterio'
%
% OUTPUTS:
%           x:      Root of function. Value that sets |f(x)| < TOL
%           iter:   Iteration count till solution converged
%           err:    Final error in f(x)
%           

if (nargin<3 || isempty(x))
    x=0;
end
if nargin<4
    TOL=sqrt(eps);
end
if nargin<5 || maxit<1
    maxit=20;
end

%Initialize error and iteration

%Perform Newton iteration
while ( )
    
end
if nargout<2 %used for error checking
    fprintf('\n Newton Rhapson converged in %g iterations with error %g',...
        iter, err)
end