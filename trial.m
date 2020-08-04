%========================AUDIO GENERATION=================================>
[b,fs]=audioread('C:\Users\Wriddhirup Dutta\Desktop\ah201.wav');
N=size(b)
n=N(1)
n=n-1000
D=b(1:n);
subplot 321
plot(D)
title('Original Audio')
xlabel('Amplitude')
ylabel('Samples')
%fprintf('Press Enter to start Factor Generation')
%pause
% sound(D);
%<========================FACTOR GENERATION==============================>
if isprime(n)
    s=round(n,-1)
    a=divisors(s);
    p=size(a);
     if (a(p(2)/2)*a(p(2)/2+1))==n
                c=(a(p(2)/2))
                d=(a(p(2)/2+1))
                
            end
      disp(c*d)
else 
a=divisors(n);
    p=size(a);      
    if (a(p(2)/2)*a(p(2)/2+1))==n
                c=(a(p(2)/2))
                d=(a(p(2)/2+1)) 
            end
        disp(c*d)
end
A=reshape(D,[c d]);
%A=double(A);
subplot 322
imwrite(A,'C:\Users\Wriddhirup Dutta\Desktop\cc.tif');
A_img = imread('C:\Users\Wriddhirup Dutta\Desktop\cc.tif');
A_Resized=imresize(A_img, [400 700]);
imshow(A_Resized)
title('Original Audio Image')
%fprintf('Press Enter to generate Random Key...')
%pause
%<==========KEY GENERATION CONSISTING OF RANDOM ORTHOGONAL MATRIX=========>
w=RandOrthMat(d);
%fprintf('Press Enter to start Encrypting...')
%pause
%<==========ENCRYPTING THE AUDIO-IMAGE MATRIX USING THE KEY===============>
%w=double(w); 
z=A*w;  %Encrypted Matrix 
subplot 324
imwrite(z,'C:\Users\Wriddhirup Dutta\Desktop\dd.tif');
Encrypted_img = imread('C:\Users\Wriddhirup Dutta\Desktop\dd.tif');
Encrpyted_Resized=imresize(Encrypted_img, [400 700]);
imshow(Encrpyted_Resized)
title('Encrypted Image')

%<======================Encrypted Audio==================================>
u=z(:);
subplot 323
plot(u)
title('Encrpted Signal')
xlabel('Amplitude')
ylabel('Samples')
filename='C:\Users\Wriddhirup Dutta\Desktop\EncryptedAudio.wav';
audiowrite(filename,u,44100);
%fprintf('Press Enter to Decrypt the audio...')
%pause
%<===========Passing the encypted image through a channel=================>
J= imnoise(Encrypted_img,'Gaussian');
figure(3)
imshow(J)

G=imgaussfilt(J,0.01)
figure(4)
imshow(G)
imwrite(G,'C:\Users\Wriddhirup Dutta\Desktop\dechan.tif');
%<==========================DECRYPTION====================================>
E=imread('C:\Users\Wriddhirup Dutta\Desktop\dechan.tif');
Eq=im2double(E);
Eqc=Eq(:);
R=Eq*inv(w)
v=R(:);%Column matrix of R
%<=======================Decrypted Audio==================================>
filenam='C:\Users\Wriddhirup Dutta\Desktop\DecryptedAudio.wav';
audiowrite(filenam,v,44100)
subplot 326
%<======================Decrypted Image===================================>
imwrite(R,'C:\Users\Wriddhirup Dutta\Desktop\decrimg.tif');
Decrypted_img = imread('C:\Users\Wriddhirup Dutta\Desktop\decrimg.tif');
Decrpyted_Resized=imresize(Decrypted_img, [400 700]);
imshow(Decrpyted_Resized)
title('Decrpyted Image')
subplot 325
plot(v)
title('Decrypted Signal')
xlabel('Amplitude')
ylabel('Samples')
%sound(v)
figure
subplot 211
%<=============================Error Produced=============================>
error= (D-v)/D;
error1=error(:);
plot(error1)
title('Error Generated')
xlabel('Samples')
ylabel('Error')
subplot 212 



    
