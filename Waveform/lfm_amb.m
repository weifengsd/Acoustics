% Plot ambiguity function of LFM signal
% Created: 20150411 by FW
% Ref: MIT homework 2 problem 5

fmax = 300; % Hz
fmin = 200;
T = 1; % sec
Tw = .25*T;
k = (fmax - fmin)/T;

% window function
t = linspace(0, T, fmax);
fs = fmax; % sampling freq.
ind1 = find(t<0.25);
ind2 = find(t>0.75);
w_t(ind1) = sin(pi*t(ind1)/Tw/2).^2;
w_t(ind1(end)+1 : ind2(1)-1) = 1;
w_t(ind2) = sin(pi*(t(ind2)-T+2*Tw)/Tw/2).^2; 

% windowed complex envelope
s_t = w_t .* exp(1i*pi*k*t.^2);
% s_t = exp(1i*a*log(1-k*t));

% shift
N = 2^nextpow2(length(t)+1);
for deltaT = 0  : length(t)-1
   s_t_shifted = [zeros(1,deltaT) s_t(1 : end-deltaT)];
   p = s_t .* conj(s_t_shifted);
   
   % compute all Doppler shifts using fft
   T = fftshift(fft(p, N));
   Theta(:, deltaT+1) = abs(T).';
end

% normalize the ambiguity function to be 1 @ zero Doppler, zero range
Theta = Theta/max(max(Theta));

% fill out negative ranges from symmetry
Theta_total = [fliplr(flipud(Theta(:, 2:end))) Theta];

imagesc([-t(end :-1:1) t(2:end)], fs*([0:N-1]/N-0.5), ...
    20*log10(abs(Theta_total)), [-30 0]);
colorbar
xlabel(texlabel('Delta T, sec')), ylabel(texlabel('Delta f, Hz'));
title('LFM ambiguity function with window');


