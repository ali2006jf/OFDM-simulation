clc , clear
% Input Data
bits = randi([0 1], 1,256);

num_subcarriers = 64;
padding_needed = mod(256 - mod(length(bits), 256), 256);
bits = [bits, zeros(1, padding_needed)];
I_bits = bits;

% Bit-to-Symbol Mapping 16-QAMA
bit_4 = reshape(bits ,4, []);
symbols = zeros(1,size(bit_4,2));


for k=1:size(bit_4,2)
    pair = bit_4(: , k);
    if isequal(pair, [0; 0; 0; 0])
        symbols(k)= 1 + 1j;
    elseif isequal(pair, [0; 0; 0; 1])
        symbols(k) = 3 + 1j;
    elseif isequal(pair, [0; 1; 0; 0])
        symbols(k) = 1 + 3j;
    elseif isequal(pair, [0; 1; 0; 1])
        symbols(k) = 3 + 3j;
    elseif isequal(pair, [0; 0; 1; 0])
        symbols(k) = -1 + 1j;
    elseif isequal(pair, [0; 1; 1; 0])
        symbols(k) = -1 + 3j;
    elseif isequal(pair, [0; 0; 1; 1])
        symbols(k) = -3 + 1j;
    elseif isequal(pair, [0; 1; 1; 1])
        symbols(k) = -3 + 3j;
    elseif isequal(pair, [1; 0; 1; 0])
        symbols(k) = -1 - 1j;
    elseif isequal(pair, [1; 1; 1; 0])
        symbols(k) = -1 - 3j;
    elseif isequal(pair, [1; 0; 1; 1])
        symbols(k) = -3 - 1j;
    elseif isequal(pair, [1; 1; 1; 1])
        symbols(k) = -3 - 3j;
    elseif isequal(pair, [1; 0; 0; 0])
        symbols(k) = 1 - 1j;
    elseif isequal(pair, [1; 1; 0; 0])
        symbols(k) = 1 - 3j;
    elseif isequal(pair, [1; 0; 0; 1])
        symbols(k) = 3 - 1j;
    elseif isequal(pair, [1; 1; 0; 1])
        symbols(k) = 3 - 3j;
    end

end
%  Serial to Parallel
ofdm_blocks = reshape(symbols, num_subcarriers, []); 

% IFFT
ofdm_time = ifft(ofdm_blocks, num_subcarriers, 1);

% Adding Cyclic Prefix
cp_len = num_subcarriers / 8;
ofdm_with_cp = zeros(num_subcarriers + cp_len, size(ofdm_time,2));

for i = 1:size(ofdm_time, 2)
   cp = ofdm_time(end - cp_len + 1:end, i);
    ofdm_with_cp(:, i) = [cp; ofdm_time(:, i)];
end

% Parallel to Serial
ofdm_serial = ofdm_with_cp(:).';

% Channel
snr = 15; 
rx_serial = awgn(ofdm_serial, snr, 'measured');


% Serial to Parallel
rx_matrix = reshape(rx_serial,num_subcarriers + cp_len , []);

% Cyclic Prefix Removal
rx_no_cp = rx_matrix(cp_len+1:end, :); %remove cp

% FFT
rx_freq = fft(rx_no_cp, num_subcarriers, 1);  % size: [64 × num_blocks]

% Parallel to Serial
rx_symbols = rx_freq(:).'; 

% Symbol-to-Bit Mapping 16-QAM

sampled_I = real(rx_symbols);
sampled_Q = imag(rx_symbols);


Rbits = zeros(4,length(rx_symbols));
for k=1 :length(sampled_I)
    if sampled_I(k) > 0 && sampled_I(k) < 2 && sampled_Q(k) > 0 && sampled_Q(k) < 2
        Rbits(:, k) = [0; 0; 0 ; 0];
    elseif sampled_I(k) > 2 && sampled_Q(k) > 0 && sampled_Q(k) < 2
        Rbits(:, k) = [0; 0; 0; 1];
    elseif sampled_I(k) > 0 && sampled_I(k) < 2 && sampled_Q(k) > 2
        Rbits(:, k) = [0 ; 1; 0; 0];
    elseif sampled_I(k) > 2 && sampled_Q(k) > 2
        Rbits(:, k) = [0; 1; 0; 1];
    elseif sampled_I(k) > -2 && sampled_I(k) < 0 && sampled_Q(k) > 0 && sampled_Q(k) < 2
        Rbits(:, k) = [0; 0; 1; 0];
    elseif sampled_I(k) > -2 && sampled_I(k) < 0 && sampled_Q(k) > 2
        Rbits(:, k) = [0 ; 1; 1; 0];
    elseif sampled_I(k) > -2 && sampled_I(k) < 0 && sampled_Q(k) < 0 && sampled_Q(k) > -2
        Rbits(:, k) = [1; 0; 1; 0];
    elseif sampled_I(k) > -2 && sampled_I(k) < 0 && sampled_Q(k) < -2
        Rbits(:, k) = [1; 1; 1; 0];
    elseif sampled_I(k) < -2 && sampled_Q(k) > 0 && sampled_Q(k) < 2
        Rbits(:, k) = [0; 0; 1; 1];
    elseif sampled_I(k) < -2   && sampled_Q(k) > 2
        Rbits(:, k) = [0 ; 1; 1; 1];
    elseif sampled_I(k) < -2 && sampled_Q(k) < 0 && sampled_Q(k) > -2
        Rbits(:, k) = [1; 0; 1; 1];
    elseif sampled_I(k) < -2 && sampled_Q(k) < -2
        Rbits(:, k) = [1; 1; 1; 1];      
    elseif sampled_I(k) > 0 && sampled_I(k) < 2 && sampled_Q(k) < 0 && sampled_Q(k) > -2
        Rbits(:, k) = [1; 0; 0; 0];        
    elseif sampled_I(k) > 0 && sampled_I(k) < 2 && sampled_Q(k) < -2
        Rbits(:, k) = [1; 1; 0; 0];
    elseif sampled_I(k) > 2 && sampled_Q(k) < 0 && sampled_Q(k) > -2
        Rbits(:, k) = [1; 0; 0; 1];
    elseif sampled_I(k) > 2 && sampled_Q(k) < -2
        Rbits(:, k) = [1; 1; 0; 1];

    end
end



% Output Data

Rbits = Rbits(:).';

min_len = min(length(Rbits), length(I_bits));
num_errors = sum(Rbits(1:min_len) ~= I_bits(1:min_len));
ber = num_errors / min_len;
fprintf('BER: %.4f\n', ber);

figure;
plot(real(symbols), imag(symbols), 'bo', 'MarkerSize', 10, 'LineWidth', 2)
hold on;
plot(sampled_I, sampled_Q, 'rx', 'MarkerSize', 8);
legend('Original Symbols','Received Samples');
grid on;
xlim([-5 5]); ylim([-5 5]);
xlabel('I'); ylabel('Q');
title(['Constellation (SNR = ', num2str(snr), ' dB, BER = ', num2str(ber), ')']);
axis square;



figure;
subplot(2,1,1);
plot(real(ofdm_time(:,1)));
title('OFDM signal (without CP)');
xlabel('Sample Index'); ylabel('Amplitude');

subplot(2,1,2);
plot(real(ofdm_with_cp(:,1)));
title('OFDM signal (with CP)');
xlabel('Sample Index'); ylabel('Amplitude');
