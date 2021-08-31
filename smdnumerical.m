function [x, v] = smdnumerical(m,c,k,f,ic,tspan)
% smdnumerical: Solves a spring-mass-damper system 
%[x, v] = smdnumerical(m,c,k,f,ic,tspan):
%   Solves a spring-mass-damper system using the Symbolic toolbox MATLAB.
%
% input: 
%   m     = Mass
%   c     = Damping constant
%   k     = Spring constant
%   f     = Force equation (Symbolic)
%   ic    = Initial conditions (Initial position and velocity)
%   tspan = A vector containig the simulation time steps
% output:
%   x    = Equation for position
%   v    = Equation for velocity
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 29 August 2021
    
    % Formulate the ODE in vector format
    odefun = @(t,x) [x(2); 1/m*(f(t) - c*x(2) - k*x(1))];
    [~,x] = ode45(odefun,tspan,ic);
    v = x(:,2);
    x = x(:,1);
end
