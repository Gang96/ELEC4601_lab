clear all;
%create two tone signal.
fs=8000;

%A1,A2 are the amplitude of the signals
%f1,f2 are the frequency of the signals (Hz)
%fs  sampling frequency (Hz)
%duration in seconds
%cycle no of cycles
A1=1;
A2=1;
f1=500;
f2=3000;
dur=1/2;
cycle=5;

values=0:1/fs:(dur-1/fs);
sig1=A1*sin(2*pi* f1*values);
sig2=A2*sin(2*pi* f2*values);
sigtemp=[sig1';sig2']';
sig=[];

for i=1:cycle
    sig=[sig';sigtemp']';
end

sig=sig';

%get filter coefficients
Wo=0.15; %normalized cut off frequency 0<W0<1;
taps=32;
[b]=fir1(taps,Wo,'Low'); %Low pass filter
freqz(b,1,512);% Plot filter responses with 512 fft points
%figure;freqz(b,1,512);
filtered_signal=filter(b(1:32),1,sig); %filter the signal

soundsc(sig,fs); %Play orginal
soundsc(filtered_signal,fs); %Play filtered









