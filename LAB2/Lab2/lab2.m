clear all;
%create two tone signal.
fs=8000;

N = 40000;
st = 1/1e5;
totaltime = N*st;
a(1) = 0.6732;
a(2) = -0.447;
b = -0.1118;

%impulse response
x = zeros(N,2);
x(:,1) = 0*st:st:N*st-st;
%Impulse setting
x(16,2) = 1;



sim('Q_2');
simout = simout.data;

sys = tf([a(1) a(2)],[1 b],st,'Variable','z^-1');

%---------------Plot the theory---------------%
pulse = impulse(sys);
H = fftshift(fft(pulse,1000));
H = H/max(abs(H));
figure(1);
x_lab = -1:2*1/1000:1-2*1/1000;
subplot(2,1,1);
plot(x_lab,20*log10(abs(H)),'-r');
grid on;
title('Theory Magnitude response');
xlabel('\times\pi');
subplot(2,1,2);
plot(x_lab,angle(H),'-r');
grid on;
title('Theory Phasor response');
xlabel('\times\pi');

%---------------Plot the simulation---------------%
H2 = fftshift(fft(simout,1000));
H2 = H2/max(abs(H2));
figure(2);
x_lab = -1:2*1/1000:1-2*1/1000;
subplot(2,1,1);
plot(x_lab,20*log10(abs(H2)));
grid on;
title('Simulation Magnitude response');
xlabel('\times\pi');
subplot(2,1,2);
plot(x_lab,angle(H2));
grid on;
title('Simulation Phasor response');
xlabel('\times\pi');