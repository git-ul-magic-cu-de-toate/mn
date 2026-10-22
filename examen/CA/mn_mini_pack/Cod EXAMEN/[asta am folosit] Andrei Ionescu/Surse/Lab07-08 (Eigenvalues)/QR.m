function [lambda] = QR(A, maxiter)
  [n n] = size(A);
  iter = 0;
  tol = 0.000001;
  lambda = [];
  
  while n > 1
    while abs(A(n, n-1)) > tol && iter < maxiter
      [Q R] = qr(A);
      A = R*Q
      iter += 1;
    endwhile
    
    if iter == maxiter
      break;
    endif
    
    lambda = vertcat(lambda, A(n, n));
     # Cutting the last row & column
     A = A(1:end-1,1:end-1);
     n -= 1;
     
  endwhile
  
  if n == 1
    lambda = vertcat(lambda, A(n,n));
  endif
  
endfunction