function signal = apply_reverb(signal, impulse_response)
  % Transform impulse response to mono
  impulse_response = stereo_to_mono(impulse_response);

  % Compute convolution
  convolution = fftconv(signal, impulse_response);

  % Normalize convolution
  convolution = convolution / max(abs(convolution));

  signal = convolution;
end

