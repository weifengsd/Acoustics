% Plot instantaneous frequency of HFM signal
% Created: 20150411 by FW
% Ref: MIT homework 2 problem 5

fmax = 300; % Hz
fmin = 200;
T = 1; % sec
k = (fmax - fmin)/T;
syms t
% t = linspace(0, T, fmax);

% complex envelope
s_t = exp(1i*pi*k*t.^2);

% phase
Phi_t = pi*k*t.^2;

% instantaneous frequency
syms finst(t)
finst(t) = 1/(2*pi)*diff(Phi_t, t)
t = linspace(0, T, fmax);
f = double(subs(finst));
plot(t,f);
xlabel('Time: s'); ylabel('Frequency: Hz');
title('Instantaneous frequency of LFM signal');


