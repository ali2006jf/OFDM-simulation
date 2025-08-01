OFDM Simulation with 16-QAM Modulation in MATLAB
Overview
This project simulates an Orthogonal Frequency Division Multiplexing (OFDM) communication system using 16-QAM modulation. It generates random bits, maps them to 16-QAM symbols, performs OFDM modulation with IFFT and cyclic prefix insertion, simulates an AWGN channel, and then demodulates the received signal to recover the bits. The system also computes Bit Error Rate (BER) and Signal-to-Noise Ratio (SNR) for performance evaluation.

Features
Random bit generation

16-QAM modulation and demodulation

OFDM modulation with cyclic prefix

AWGN channel simulation

BER and SNR calculation

Visualization of constellation diagrams and performance graphs

Requirements
MATLAB (tested on R2021a and later)

How to Run
Open the ofdm_simulation.m script in MATLAB.

Run the script. It will display constellation plots and BER vs. SNR graphs.

Modify SNR values in the script to test performance under different noise levels.

Applications
This simulation helps understand fundamental concepts of OFDM systems used in modern wireless communications like Wi-Fi and LTE.

