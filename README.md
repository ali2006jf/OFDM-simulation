# OFDM Communication System Simulation with 16-QAM Modulation

<!-- 📡 Block Diagram -->
<p align="center">
  <img src="ofdm-photos/ofdm-diagram.png" alt="OFDM Block Diagram" style="width: 100%; max-width: 900px; border-radius: 12px; border: 2px solid #ccc;">
</p>

## 🚀 Project Overview  
This MATLAB project provides a complete simulation of an Orthogonal Frequency Division Multiplexing (OFDM) system using 16-QAM modulation. It demonstrates the full digital communication pipeline—from random bit generation, 16-QAM symbol mapping, OFDM modulation using IFFT, cyclic prefix addition, transmission over an AWGN channel, and demodulation with BER evaluation.

## ✨ Key Features  
- Random bit generation  
- 16-QAM modulation & demodulation  
- OFDM with IFFT and cyclic prefix  
- AWGN channel model  
- BER vs. SNR performance evaluation  
- Constellation diagrams for received symbols

<!-- 🎯 Constellation Diagrams -->
<p align="center">
  <img src="https://your-link.com/constellation-snr5.png" alt="Constellation at SNR=5" width="200" style="margin: 10px; border-radius: 8px; border: 2px solid #aaa;">
  <img src="https://your-link.com/constellation-snr20.png" alt="Constellation at SNR=20" width="200" style="margin: 10px; border-radius: 8px; border: 2px solid #aaa;">
</p>

## 🛠️ Requirements  
- MATLAB (R2018b or newer)

## ▶️ How to Run  
1. Clone this repository  
2. Open `ofdm_simulation.m` in MATLAB  
3. Run the script to generate results and plots  
4. Modify parameters like SNR, number of subcarriers, or data size to experiment

## 📚 Learning Purpose  
OFDM is a foundational technology in modern wireless systems like Wi-Fi, LTE, and 5G. This simulation provides a clear and visual way to understand its inner workings.

---

*Feel free to star ⭐ this repo or contribute to improvements!*
