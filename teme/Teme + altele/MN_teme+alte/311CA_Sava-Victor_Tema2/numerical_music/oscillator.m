function x = oscillator(freq, fs, dur, A, D, S, R)
  % Create time vector
  t_step = 1 / fs;
  t = [0 : t_step : dur - t_step]';

  % Create the sine wave
  sine_wave = sin(2 * pi * freq * t);

  % Compute number of envelope parameters
  total_params = size(t, 1);
  no_attacks = floor(A * fs);
  no_decays = floor(D * fs);
  no_releases = floor(R * fs);
  no_sustains = total_params - no_attacks - no_decays - no_releases;

  % Compute Attack - ramp from 0 to 1
  attack_envelope = linspace(0, 1, no_attacks)';

  % Compute Decay - ramp from 1 to S
  decay_envelope = linspace(1, S, no_decays)';

  % Compute Sustain - constant S
  sustain_envelope = S * ones(1, no_sustains)';

  % Compute Release - ramp from S to 0
  release_envelope = linspace(S, 0, no_releases)';

  % Concatenate attack, decay, sustain, release values
  envelope = [attack_envelope; decay_envelope; sustain_envelope; release_envelope];

  % Compute x
  x = sine_wave .* envelope;
end

