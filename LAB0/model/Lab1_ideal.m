 %Initialization
 clc;
 clear;
 close all;
 
 %Valuables setting
 a = [-0.0024 -0.0042 0.0095 0.02 -0.038 -0.0696 0.1374 0.4472 0.4472 0.1374 -0.0696 -0.038 0.02 0.0095 -0.0042 -0.0024];
 totaltime = 256;
 
 %Input setting
 x = zeros(totaltime,2);
 x(:,1) = 1:totaltime;
 %Impulse setting
 x(16,2) = 1;
 
 %Get the ideal impulse response
 Y = conv(a,x(:,2));
 
 %plot the figure
 figure(3);
 plot(Y); grid on;
 
 H2 = fftshift(fft(Y,128));
 H2 = H2/max(abs(H2));
 
 figure(4);
 plot(20*log10(abs(H2)));
 grid on;
 
 
 
 
 
 
 