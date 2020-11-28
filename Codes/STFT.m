function [Xkl,t,f] = STFT(x,w,H,K,fs)
% Function to compute STFT of the signal x(n)
% Usually K=M; for K>M the sequence xl[m]
% zero  padded  and  the  spectrum  is  interpolated.
% K-Point FFT
N=length(x);
M=length(w);
L=1+floor((N-M)/H); 
% example: N=10, M=3,H=3 Therefore L=3
K_uniq=ceil((M+1)/2);
% example : M =3 , 0,120 complex conjugate of 240 
% Hermitian symmentry X*[M-f]=X[f] 
% X(f) = X*(-f)  (Cont. signals) for real signals  
%x1=zeros(size(w));
Xkl=zeros(K_uniq,L);
for l =0:L-1
x1=x(1+l*H:M+l*H) .* w;
X1=fft(x1,K);
Xkl(1:K_uniq,1+l)=X1(1:K_uniq);

t = (w/2:H:w/2+(L-1)*H)/fs;
f = (0:K_uniq-1)*fs/K;
end
end

