% ELEC 4601 - Lab 3 - supporting files

clear all; close all; clc;

% IIR filter coefficients
a=0.3;
b=-0.412;

NN=1024;
x=zeros(NN,1);
x(6,1)=1; % Impulse input
y=zeros(NN,1);

% IIR filter difference equation
for n=6:NN
    y(n)=x(n)+a*y(n-3)+b*y(n-5);
end

% Plotting the filter impulse response
figure
stem(y(1:128)); title('Impulse response'); grid on;
ylabel('Amplitude h(h)'); xlabel('Sample index n')

H=fftshift(fft(y));
H=H/max(abs(H));

% Plotting the filter frequency response
figure(1);
ww=-1+2/NN:2/NN:1;
plot(ww,20*log10(abs(H)));title('Frequency Response'); grid on;
xlabel('Normalised frequency \omega/\pi');
ylabel('Amplitude (dB)');

N = NN;
st = 1/1e5;
st2 = st/2;
totaltime = N*st;
%impulse response
in = zeros(N,2);
in(:,1) = 0*st:st:N*st-st;
%Impulse setting
in(6,2) = 1;

sim('Q_4');
simout = simout.data;

H2 = fftshift(fft(simout,1024));
H2 = H2/max(abs(H2));
figure(1);
hold on;
x_lab = -1:2*1/1024:1-2*1/1024;
plot(x_lab,20*log10(abs(H2)),'x');
grid on;
title('Frequency Response');
xlabel('\times\pi');
legend ('Theory','ZedBoard');




