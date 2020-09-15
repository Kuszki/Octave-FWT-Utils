function e = job(len, syg, A)
  
  n = wgn(len, 1, -20);
  a = mod_matrix(syg + n, A);
  
  e = a(50,:) * n;
  
end