# Audio-encryption-decryption-image-format-secured-channel
A novel approach to securely encrypt audio files (.wav) and transmit it through a Additive White Gaussian Noise Channel (AWGN) in an .TIFF image format and decrypt the audio at the receiver end and calculated the Bit Error Rate and Noise Generated. Run trial.m to run the file in Matlab.

**Abstract**

This paper describes an algorithm of encrypting wave files in image format with a randomly generated orthogonal key decrypting them after being passed through a channel with white Gaussian noise. Gaussian noise is then removed and then matrix manipulations are done, to get the original audio back. In this age of information, audio encryption can be a secure way to communicate between individuals with assurance of privacy of the data.

**Publication**

Published in 2017 International Conference on Inventive Computing and Informatics (ICICI)

Date of Conference: 23-24 Nov. 2017

DOI: 10.1109/ICICI.2017.8365185

Publisher: IEEE

https://ieeexplore.ieee.org/document/8365185

**Dataset Used**
1. ah201.wav (https://drive.google.com/file/d/1vPwyrvw3VDxuZmJ18cJHMHom65y7AYod/view?usp=sharing)
2. jamesbond.wav(https://drive.google.com/file/d/1HcpfYWd7DohiK4LgUYYoTAPLiPFqXXdJ/view?usp=sharing)

**Introduction**

The working of the project focuses on an algorithm for securing communication of audio signals of all formats. The audio file is read using “audioread” and converted to a matrix. Using “imwrite” functions in MATLAB, this matrix is converted to an image file. Then the image is encrypted using a random generated orthogonal matrix key. Then the encrypted image is retrieved using “imread” function and then decrypted to get the original audio signal and the corresponding error signal is plotted. To check the efficiency of the algorithm, signal to noise ratio and bit error rate is calculated for five samples of audio. This algorithm can not only be used as steganographic but private data of individuals.

**METHODOLOGY**

**1. AUDIO FILE GENERATION**

Audio of any format can be used for encryption. The audio format should be converted to feasible matrix form for better encryption. In this report “ah201.wav” wave file was used to show the proposed algorithm of encrypting the audio file in tagged image format(“.tif”). The sound will be read and handled in MATLAB.

**2. IMAGE FORMATS AND COMPRESSION**

Digital image formats are methods for storing digital images in either uncompressed (e.g. TIFF) and compressed (e.g. JPEG) formats. Generally, there are two types of image file compression procedures, lossless and lossy. In lossless compression entire digital data is retained during compression thus preserving image quality. In lossy compressions, the digital data preservation takes place by compromising image quality. Here we will be discussing PNG, TIFF and JPEG formats and these are the formats in which the wave file will be encrypted in the paper. JPEG format has the most amount of image compression with a 10:1 compression ratio due to its is lossy compression characteristics. Portable network graphics or PNG files have less compression ratio of about 7:1 due to it is lossless compression technique. Whereas tagged image format (TIFF), TIF has almost 2:1 compression ratio because it can be stored uncompressed hence least amount of error can come by using TIF files.

**3. RANDOM ORTHOGONAL KEY**

In Encryption Key algorithm , the function randorthmat(d) creates a n by n random orthogonal matrix. Where ‘tol’ is a threshold value that finds the  linear dependencies of a new column with the current columns. Then ‘w’ becomes the random generated key which is then used to encrypt the audio by This orthogonal key is multiplied with the audio 2D matrix to encrypt the audio. This matrix is stored in a variable.

Step.1. : Start

Step.2. : Check if number of input arguments is equal to 1, then set to l to 𝑒−6.

Step.3. : Make a zero matrix ‘𝑀’ of size 𝑛.

Step.4. : Make a random row matrix ‘𝑣𝑖’ of size 𝑛

Step.5. : Set the first column values of ‘𝑀’ as normalised values of ‘𝑣𝑖’

Step.6. : For i from 2 to n, repeat Step 7 to Step 12

Step.7. : Initialize ‘𝑛𝑟𝑚’ to 0.

Step.8. : While 𝑛𝑟𝑚 is less than 𝑡𝑜𝑙, repeat Step 9 to Step 11

Step.9. : Declare ‘𝑣𝑖’ as a row matrix of random elements.

Step.10. : ‘𝑣𝑖’ is then decremented by value of 𝑀(:,1:𝑖−1)∗(𝑡𝑟𝑎𝑛𝑠𝑝𝑜𝑠𝑒 𝑜𝑓 𝑀(:,𝑖−1) ∗𝑣𝑖)

Step.11. : Declare ‘𝑛𝑟𝑚’ as Euclidean norm of vi

Step.12. : Declare 𝑀(:,𝑖) as vi divided by 𝑛𝑟𝑚

Step.13. : Stop

**4. TRANSMISSION THROUGH THE CHANNEL AND DECRYPTION AT THE END OF THE CHANNEL**

The encrypted matrix transmitted through a channel where white Gaussian noise is added to the image. The encrypted image is received from the channel and the image is converted to double data precision for conducting mathematical operations. The white Gaussian noise is removed from the encrypted image using suitable filter and then it is decrypted using the key generated by multiplying the inverse of key matrix with the image matrix. Then it is converted to a column matrix and stored in a variable. It is further converted to an audio file for analysis purposes.

**5. BIT ERROR RATE**

The Bit Error Rate value shows the number of bits which have errors compared to total bits that is received in transmission. The lesser the bit error value, the more efficient is the decryption algorithm and hence less noise is incorporated in the output audio.

**6. SIGNAL TO NOISE RATIO**

The signal to noise ratio of a signal is found by the comparing the signal withthe carrier signal in decibels(dB). If the value of SNR ratio is greater than one, then the noise component in the signal is less. Hence the error between the output and input audio is less.

**7. ALGORITHM OF THE CODE**

Step.1. : An audio file 𝑓(𝑡) in WAV file format and stored in a variable and the sampling frequncy is stored.

Step.2. : 𝑓(𝑡) is converted into a column matrix, 𝑓(𝑥) 𝑓rom the audio.

Step.3. : The column matrix is reshaped into a 2 dimensional matrix as 𝑓(𝑥,𝑦).

Step.4. : 𝑓(𝑥,𝑦) is converted into an image file in TIF format.

Step.5. : A randomly generated orthogonal key 𝑘(𝑥,𝑦) is generated which is used for both encryption and decryption

Step.6. : 𝑘(𝑥,𝑦) is multiplied with 𝑓(𝑥,𝑦) to form the encrypted file,𝑔(𝑥,𝑦).

Step.7. : 𝑔(𝑥,𝑦) is transmitted to a channel where Gaussian noise is added in the channel. 

Step.8. : At the receiving end of the channel, the Gaussian noise is removed from the image file using a filter of suitable mean and variance of the Gaussian noise.

Step.9. : For decryption, the image of 𝑔(𝑥,𝑦) is converted to 2 dimensional matrix format. It is multiplied with the inverse of 𝑘(𝑥,𝑦) to get the original matrix i.e., 𝑓(𝑥,𝑦).

Step.10. : The decrypted matrix, ℎ(𝑥,𝑦) formed is exactly not equal to 𝑓(𝑥,𝑦) due to image compression techniques.

Step.11. : The decrypted matrix can be converted to get the decrypted image. It can also be reshaped to a one dimensional matrix to get the decrypted audio, ℎ(𝑡).

Step.12. : The error signal, bit error rate, signal to noise ratio are calculated for the signal analysis. The waveforms of 𝑓(𝑡) and ℎ(𝑡) are also generated in MATLAB. 

**Input/Output**

**Original Audio Waveform and Audio Steganographed in the image (Ah201.wav)**

![Original Audio](https://user-images.githubusercontent.com/31190025/89286656-3b6e7f80-d670-11ea-8329-c9b719473d39.png)

![Original Image](https://user-images.githubusercontent.com/31190025/89286748-60fb8900-d670-11ea-99f2-007074dc16d2.png)

**Encrypted Signal Waveform and Steganographed encrypted audio in image**

![Encrypted Signal](https://user-images.githubusercontent.com/31190025/89286902-9c965300-d670-11ea-9d10-59f78e64b946.png)

![Encrypted Image](https://user-images.githubusercontent.com/31190025/89286924-a7e97e80-d670-11ea-90c3-cedcbd598e2b.png)

**Decrypted Signal Waveform and Steganographed Decrypted Audio in Image format**

![Decrypted Signal](https://user-images.githubusercontent.com/31190025/89287001-c51e4d00-d670-11ea-8178-dc577b258dd9.png)

![Decrypted Image](https://user-images.githubusercontent.com/31190025/89286616-285baf80-d670-11ea-979b-47e773369801.png)

**Error Generated**

![error](https://user-images.githubusercontent.com/31190025/89279310-d82b2000-d664-11ea-8bef-143cddaa81f1.png)

**Original Audio vs Decryped Audio**

![Decrypted Vs Original](https://user-images.githubusercontent.com/31190025/89287032-d5362c80-d670-11ea-91ad-00c365cccc7a.png)

**Bit Error Rate (BER) Plot**

![BER](https://user-images.githubusercontent.com/31190025/89287464-aa000d00-d671-11ea-8035-380442f339ae.JPG)


