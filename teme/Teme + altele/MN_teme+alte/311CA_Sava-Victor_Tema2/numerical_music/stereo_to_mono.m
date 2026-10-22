function mono = stereo_to_mono(stereo)
  mono = mean(stereo, 2); % mean along rows

  % Normalize
  mono = mono / max(abs(mono));
end

