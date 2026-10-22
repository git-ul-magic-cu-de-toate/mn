function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % basic conjugate gradient algo
  [m, n] = size(FeatureMatrix);
  Theta = zeros(n, 1);

  A = FeatureMatrix' * FeatureMatrix;
  b = FeatureMatrix' * Y;

  % check if positive defined matrix
  if not(issymmetric(A) == 1 & all(eig(A) > 0))
    return;
  endif

  r = b - A * Theta;
  v = r;
  tolsq = tol ^ 2;

  k = 1;
  while k <= iter & r' * r > tolsq
    t = (r' * r) / (v' * A * v);
    Theta = Theta + t * v;
    r_next = r - t * A * v;
    s = (r_next' * r_next) / (r' * r);
    v = r_next + s * v;
    r = r_next;
    k += 1;
  endwhile

  % add 0 at the start of Theta
  Theta = [0; Theta];
end
