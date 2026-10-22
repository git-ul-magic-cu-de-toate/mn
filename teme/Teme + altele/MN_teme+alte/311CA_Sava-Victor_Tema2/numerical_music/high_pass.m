function signal = high_pass(signal, fs, cutoff_freq)
  % Compute fft of signal
  signal_size = size(signal, 1);
  fft_result = fft(signal, signal_size);

  % Frequency vector
  f = ((0 : (signal_size - 1)) * fs / signal_size);

  % Create mask
  mask = zeros(signal_size, 1);

  for i = 1 : floor(signal_size / 2)
    if f(i) >= cutoff_freq
      mask(i) = 1;
      mask(signal_size - i + 1) = 1;
    endif
  endfor

  if mod(f(floor(signal_size / 2 + 1)), 2) == 0
    mask(signal_size / 2 + 1) = 1;
  endif

  % Apply mask
  filtered_fft = fft_result .* mask;

  % Inverse fft
  signal = ifft(filtered_fft);  % Use real to remove tiny imaginary parts

  % Normalize signal
  signal = signal / max(abs(signal));
end

