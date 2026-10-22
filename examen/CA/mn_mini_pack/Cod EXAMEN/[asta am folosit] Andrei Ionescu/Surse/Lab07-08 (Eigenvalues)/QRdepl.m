function lambda = QRdepl(A, n, tol, maxiter)
  lambda = [];
  
  M = 0;
  if(M > maxiter)
  disp('S-a depasit nr de iter');
else
  if(n < 2)
  lambda(1) = A(1, 1);
else 
  E = A(n-1:n, n-1:n);
  e = eig(E);
  dep = [];
  if(abs(A(n,n)-e(1)) < abs(A(n,n) - e(2))) dep = e(1);
  else dep = e(2);
  endif
B = A-dep*eye(n);
[Q R] = qr(B);
Q
R
BB = R * Q + dep * eye(n)
if(BB(n,n-1) <= tol)
lambda(n) = BB(n, n);
A=BB(1:n-1, 1:n-1);
n--;
M++;
else 
A=BB;
M++;
endif
endif
endif
endfunction
