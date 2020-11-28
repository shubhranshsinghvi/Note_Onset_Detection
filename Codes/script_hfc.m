%load the piano sound

%[x,fs]=audioread('~/Desktop/COURSES/Signal Processing/finalproject-madlab/Samples/piano.mp3');

%[x,fs]=audioread('~/Desktop/COURSES/Signal Processing/finalproject-madlab/Samples/sp.wav');

%[x,fs]=audioread('~/Documents/GitHub/finalproject-madlab/Samples/piano.mp3');
[x,fs]=audioread('C:\Users\ramesh\Documents\GitHub\finalproject-madlab\Samples\sp.wav');
%[x,fs]=audioread('C:\Users\ramesh\Downloads\songpop.mp3');
%[x,fs]=audioread('C:\Users\ramesh\Downloads\drums_short.mp3');
%sound(x);%Shubhransh
M=128;
w=hann(M);
H=68;
K=M;
N = length(x);
L=1+floor((N-M)/H); 
[xkl1,t,f]=STFT(x,w,H,K,fs);
Hl = HFC(xkl1);
Sfl = SF(xkl1);
Sdl = SD(xkl1);
Pl = PD(xkl1);
Wpl = WPD(xkl1);
l=1:L;

del=20;
lam=1;
M1=5;
scaler = 1;
%pHl=post_process(Hl);
%[deltil,ons]=mean_thresh(Hl,del,lam,M1);
% Sfl = SF(xkl1);
[deltil,ons,no_onsets]=modified_onset_detection(Hl,del,lam,M1);

% Sdl = SD(xkl1);
% Pl = PD(xkl1);
% Wpl = WPD(xkl1);
% l=1:L;
% 
% del=10;
% lam=1;
% M1=5;
% pHl=post_process(Hl);
% [deltil,ons]=mean_thresh(Hl,del,lam,M1);

figure(1)
hold on;
plot(deltil);
plot(Hl);
hold off;
legend('deltil','dkl')

figure(2)
stem(ons);
nnz(ons)
% disp(no_onsets);
% figure(1);
% plot(x);
% title('Original Signal');
% figure(2);
% plot(l,Hl);
% title('HFC');
% figure(3);
% plot(l,Sfl);
% title('SF~Spectral  Difference L1 norm');
% figure(4);
% plot(l,Sdl);
% title('SD~Spectral  Difference L2 norm');
% figure(5);
% plot(l,Pl);
% title('PD~Phase deviation');
% figure(6);
% plot(l,Wpl);
% title('WPD~Weighted Phase deviation');

% figire(7);
% 

%plot(l,Hl,l,Sfl,'--',l,Sdl,':');
%title('comparison');