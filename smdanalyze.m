function [d, wN] = smdanalyze(m,c,k,IC)
% smdanalyze: Analyzes a spring-mass-damper system 
%[x, dx] = smdanalytical(m,c,k,F,IC):
%   Solves a spring-mass-damper system using the Symbolic toolbox MATLAB.
%
% input: 
%   m    = Mass
%   c    = Damping constant
%   k    = Spring constant
%   ic   = Initial conditions (Initial position and velocity)
% output: 
%   d    = Tupe of damping
%   wN   = Natural frequency
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 29 August 2021

    % Initial Conditions
    x0 = IC(1); dx0 = IC(2);
    % Reference: Mechanical Vibrations (Rao), Pg. No. 192
    
    zeta    = c/2/sqrt(m*k);                % Damping ratio
    wN      = sqrt(k/m);                    % Natural frequency
    %wD      = sqrt(1-zeta^2)*wN;            % Damped frequency
    %A       = sqrt(x0^2*wN^2 + dx0^2 + ...
    %          2*x0*dx0*zeta*wN)/wD;         % Amplitude
    
    if zeta < 1
        d = 'underdamped';
    elseif zeta > 1
        d = 'overdamped';
    else
        d = 'critically damped';
    end
end
