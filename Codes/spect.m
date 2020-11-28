%load the piano sound
%[x,fs]=audioread('~/Desktop/COURSES/Signal Processing/finalproject-madlab/Samples/sp.wav');
[x,fs]=audioread('C:\Users\ramesh\Documents\GitHub\finalproject-madlab\Samples\sp.wav');
%sound(x);
%[x,fs]=audioread('~/Desktop/COURSES/Signal Processing/finalproject-madlab/Samples/sp.wav');
%sound(x);


%[x,fs]=audioread('~/Desktop/COURSES/Signal Processing/finalproject-madlab/Samples/sp.wav');
%[x,fs]=audioread('C:\Users\ramesh\Documents\GitHub\finalproject-madlab\Samples\sp.wav');
%[x,fs]=audioread('~/Desktop/COURSES/Signal Processing/finalproject-madlab/Samples/sp.wav');
%sound(x);
M=128;
w=hann(M);
H=68;
K=M;
[xkl1,t,f]=STFT(x,w,H,K,fs);
figure (1)
s=20*log(power(abs(xkl1),2)/(power(abs(max(max(xkl1))),2)));
S=surface(t,f,s);
S.EdgeColor = 'none';
colorbar

figure(2)
spectrogram(x,hann(128),60,128,8000,'yaxis');


% Method 1: Spectogram 
%Step1: Compute STFT of the signal x(n)
