## * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
## *                                                                         *
## *  {description}                                                          *
## *  Copyright (C) 2018  Łukasz "Kuszki" Dróżdż  l.drozdz@openmailbox.org   *
## *                                                                         *
## *  This program is free software: you can redistribute it and/or modify   *
## *  it under the terms of the GNU General Public License as published by   *
## *  the  Free Software Foundation, either  version 3 of the  License, or   *
## *  (at your option) any later version.                                    *
## *                                                                         *
## *  This  program  is  distributed  in the hope  that it will be useful,   *
## *  but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty of   *
## *  MERCHANTABILITY  or  FITNESS  FOR  A  PARTICULAR  PURPOSE.  See  the   *
## *  GNU General Public License for more details.                           *
## *                                                                         *
## *  You should have  received a copy  of the  GNU General Public License   *
## *  along with this program. If not, see http://www.gnu.org/licenses/.     *
## *                                                                         *
## * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

function [u, c, w] = get_uncertainty(y)
  
  assert(isvector(y), 'y must be a vector');
 
  t = 0.0;
  il = 0;
  ir = 0;
  
  l = idivide(length(y), 10, 'fix');
  a = idivide(l, 2, 'fix');
  
  [n, x] = hist(y, l, 1);
  
  if mod(l, 2)
    
    t = t + n(a + 1);
    il = a;
    ir = a + 2;
    
  else
    
    il = a;
    ir = a + 1;
    
  endif
  
  while t < 0.95
      
      t = t + n(il) + n(ir);
      u = (abs(x(il)) + abs(x(ir)))/2;
      
      il = il - 1;
      ir = ir + 1;
      
  endwhile
  
  w = std(y);
  c = u / w;
  
endfunction
