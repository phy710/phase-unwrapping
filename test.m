clear;
clc;
close all;
%% Read the sound file, and pick up the first 1024 data.
[y, Fs] = audioread('sound.wav');
T = 1/Fs;
L = 1024;
t = T*(0:L-1);
f = Fs*(0:L/2-1)/L;
y = y(1:L);
%% FFT
Y = fft(y);
Y = Y(1:L/2); % Becasue FFT is symmetric, only take half
magnitude = 20*log10(abs(Y));
phase = angle(Y);
%% Plot the sound in time domain
figure;
subplot(2, 1, 1);
plot(t*1000, y);
xlabel('Time (mS)');
title('Sound Wave');
grid on;
%% Plot the magnitude of the sound in frequency domain in dB
subplot(2, 1, 2);
plot(f/1000, magnitude);
title('Magnitude (dB)');
xlabel('Frequency (kHz)');
grid on;
figure;
%% Plot the phase of the sound in frequency domain
subplot(3, 1, 1);
plot(f/1000, phase*180/pi);
title('Phase (^o)');
xlabel('Frequency (kHz)');
grid on;
%% Unwrap the phase
unwrappedPhase = unwrap(phase);
%% Plot the unwrapped phase of the sound in frequency domain
subplot(3, 1, 2);
plot(f/1000, unwrappedPhase*180/pi);
title('Unwrapped Phase (^o)');
xlabel('Frequency (kHz)');
grid on;
%% Wrap the phase
wrappedPhase = unwrappedPhase;
for i = 1 : numel(phase)
    while wrappedPhase(i)>=pi
        wrappedPhase(i) = wrappedPhase(i)-2*pi;
    end
    while wrappedPhase(i)<-pi
        wrappedPhase(i) = wrappedPhase(i)+2*pi;
    end
end
%% Plot the wrapped phase of the sound in frequency domain
subplot(3, 1, 3);
plot(f/1000, wrappedPhase*180/pi);
title('Wrapped Phase (^o)');
xlabel('Frequency (kHz)');
grid on;