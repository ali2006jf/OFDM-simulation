# OFDM Communication System Simulation with 16-QAM Modulation

## 🚀 Project Overview  
This MATLAB project provides a complete simulation of an Orthogonal Frequency Division Multiplexing (OFDM) system using 16-QAM modulation. It demonstrates the entire digital communication chain—from generating random binary data, mapping bits to complex 16-QAM symbols, performing OFDM modulation via IFFT, adding cyclic prefix for robustness, transmitting through an AWGN channel, to finally demodulating and recovering the original bits.

The simulation calculates key performance metrics such as Bit Error Rate (BER) and Signal-to-Noise Ratio (SNR), and visualizes constellation diagrams and BER performance curves, making it an excellent learning tool for understanding modern wireless communication techniques.

## ✨ Key Features  
- Generation of random binary input data  
- Bit-to-symbol mapping using 16-QAM modulation  
- OFDM modulation with Inverse Fast Fourier Transform (IFFT)  
- Cyclic prefix insertion to combat inter-symbol interference  
- Transmission through Additive White Gaussian Noise (AWGN) channel  
- Demodulation and bit recovery  
- Calculation and visualization of BER vs. SNR  
- Constellation diagram plotting for transmitted and received symbols

## 🛠️ Requirements  
- MATLAB (compatible with R2018b and later versions)

## 🎯 How to Use  
1. Open `ofdm_simulation.m` in MATLAB.  
2. Run the script to start the simulation.  
3. Observe constellation plots and BER vs. SNR graphs generated automatically.  
4. Adjust simulation parameters such as SNR range, number of subcarriers, or bit length directly in the script to experiment with different scenarios.

## 💡 Why This Project?  
OFDM is a cornerstone modulation technique used in many modern wireless systems including Wi-Fi, LTE, and 5G. This simulation offers hands-on insight into OFDM’s working principles and helps build a solid foundation for advanced study or research in digital communications.

---

*Feel free to contribute or report issues!*

