 %Initialization
 clc;
 clear;
 close all;
 
 N=128;
 st = 1/1e5;
 totaltime = 128*st;
 W = 16;
 D = 12;
 
 %Valuables setting
 a = [-0.0024 -0.0042 0.0095 0.02 -0.038 -0.0696 0.1374 0.4472 0.4472 0.1374 -0.0696 -0.038 0.02 0.0095 -0.0042 -0.0024];
 
 %Input setting
 x = zeros(N,2);
 x(:,1) = 0*st:st:N*st-st;
 %Impulse setting
 x(16,2) = 1;
 
 %Run the simulation
 sim('Lab1_broadcast');
 
 %Get the output
 simout = simout.data;
 
 
 H = fftshift(fft(simout,150));
 H = H/max(abs(H));
 
 x_lab = -pi:2*pi/150:pi-2*pi/150;
 
 
 %Get the ideal impulse response
 Y = conv(a,x(:,2));
 
 %plot the figure

 figure(1);

 plot(-1:127,simout,'-xr',1:143,Y,'-b'); grid on;
 legend ('simout','ideal');
 title('Impulse response');
 xlabel('time\timess');

 
 H2 = fftshift(fft(Y,150));
 H2 = H2/max(abs(H2));
 
 figure(2);
 plot(x_lab,20*log10(abs(H)),'-rx',x_lab,20*log10(abs(H2)),'-b');
 grid on;
 legend ('simout','ideal');
 title('Magnitude response');
 xlabel('\pi');

 
 
 