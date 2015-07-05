% Plot instantaneous frequency of HFM signal
% Created: 20150411 by FW
% Ref: MIT homework 2 problem 5

clear; clc;

syms t % fmax fmin T
fmax = 300; % Hz
fmin = 200;
T = 1; % sec
k = (fmax - fmin)/fmax/T;
a = - 2*pi*fmin/k;

% complex envelope
s_t = exp(1i*a*log(1-k*t));

% phase
Phi_t = a*log(1-k*t);

% instantaneous frequency
syms finst(t)
finst(t) = 1/(2*pi)*diff(Phi_t, t)
t = linspace(0, T, fmax);
f = double(subs(finst));
plot(t,f);
xlabel('Time: s'); ylabel('Frequency: Hz');
title('Instantaneous frequency of HFM signal');
