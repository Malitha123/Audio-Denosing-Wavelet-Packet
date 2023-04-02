clear all
close all
clc


db_val='10';
s_or_h='s'; 
a='D:\sorted_audios\';
b=strcat('punchi_maluo','_',db_val,'db.wav');
path=strcat(a,b);

[clear_speech,fs]=audioread('clean2.WAV');
[noisy_speech,Fs]=audioread('noisy.WAV');

wavename={'haar','db5','db10','db15','sym5','sym10','sym15','coif3','coif4','coif5'};
%vad= VoiceActivityDetector (noisy_speech, Fs);
level=5;
%method='bal_sn';
method='sqtwologswn';
dd={};
t_new=array2table(zeros(1,6),'VariableNames',{'MSE_in','MSE_out','SNR','SNR_improve','PESQ_in','PESQ_out'});
for i=1:1:length(wavename)
    ww=char(wavename(i));
    [vv,denoised_speech]=wave_packet(clear_speech,noisy_speech,ww,level,s_or_h,method,Fs,db_val);
    dd{i}=denoised_speech;
    t_new=vertcat(t_new,vv)
    
end

%figure;
% subplot(3,1,1)
% plot(clear_speech);
% title('clear speech')
% 
% subplot(3,1,2)
% plot(noisy_speech);
% title('noisy speech')
% % 
% subplot(3,1,3)
% plot(dd{1,1});
% title('denoised_speech')
% % 
% cc=strcat('C:\Users\Malitha Gunawardhana\Desktop\Software\','sym10_',db_val,'db.wav');
% audiowrite(cc,dd{1,1},Fs)
% 
% cc=strcat('C:\Users\Malitha Gunawardhana\Desktop\Software\','sym15_',db_val,'db.wav');
% audiowrite(cc,dd{1,2},Fs)


% figure(1)
% subplot(4,1,1)
% plot(clear_speech);
% title('clear speech')
% 
% subplot(4,1,2)
% plot(noisy_speech);
% title('noisy speech')
% 
% subplot(4,1,3)
% plot(vad);
% title('VAD')
% 
% subplot(4,1,4)
% plot(denoised_speech);
% title('denoised_speech')
% sound(denoised_speech,Fs)
% audiowrite('wavelet.wav', denoised_speech, Fs);
% 
% L = length(clear_speech);  
% f = Fs*(0:(L/2))/L;
% Y_clear = fft(clear_speech);
% P2_clear = abs(Y_clear/L);
% P1_clear = P2_clear(1:L/2+1);
% P1_clear(2:end-1) = 2*P1_clear(2:end-1);
% 
% Y_noisy = fft(noisy_speech);
% P2_noisy = abs(Y_noisy/L);
% P1_noisy = P2_noisy(1:L/2+1);
% P1_noisy(2:end-1) = 2*P1_noisy(2:end-1);
% 
% Y_denoised = fft(denoised_speech);
% P2_denoised = abs(Y_denoised/L);
% P1_denoised = P2_denoised(1:L/2+1);
% P1_denoised(2:end-1) = 2*P1_denoised(2:end-1);
% 
% figure(2)
% plot(f,P1_clear)
% title('fft clear')
% figure(3)
% plot(f,P1_noisy)
% title('fft noisy')
% figure(4)
% plot(f,P1_denoised)
% title('fft denoised')
% 
% figure(5)
% psd(spectrum.periodogram,clear_speech,'Fs',Fs);
% title('psd clear')
% 
% figure(6)
% psd(spectrum.periodogram,noisy_speech,'Fs',Fs);
% title('psd noisy')
% 
% figure(7)
% psd(spectrum.periodogram,denoised_speech,'Fs',Fs);
% title('psd denoised')

