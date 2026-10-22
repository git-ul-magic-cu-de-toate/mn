n = input('Introduceti variabila: ')
sum = 0;
if (mod(n, 2) == 0)
  n--;
endif
while n >= 1
  sum += n;
  n -= 2;
endwhile
disp(sum)
