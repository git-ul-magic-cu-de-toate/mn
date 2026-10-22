function [S f t] = spectrogram(signal, fs, window_size)
  signal_size = size(signal, 1);
  no_of_windows = floor(signal_size / window_size);

  hanning_window = hanning(window_size);
  res = 2 * window_size;
  S = zeros(window_size, no_of_windows);

  for i = 1 : no_of_windows
    % Extract window
    start_idx = (i - 1) * window_size + 1;
    end_idx = start_idx + window_size - 1;
    window = signal(start_idx : end_idx, 1);

    % Apply Hann window
    windowed_signal = window .* hanning_window;

    % Compute fft
    fft_result = fft(windowed_signal, res);
    fft_no_conjugate = fft_result(1 : window_size);

    % Keep first half
    S(:, i) = abs(fft_no_conjugate);
  endfor
  % Frequency vector
  f = ((0 : (window_size - 1)) * fs / res)';

  % Time vector
  t = ((0 : (no_of_windows - 1)) * window_size / fs)';
end

