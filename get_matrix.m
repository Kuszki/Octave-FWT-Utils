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

function [out] = get_matrix(syg, waw, dec)
  
  size = length(syg);
  mat = lin_ident(@(x) fwt(x, waw, dec), size);
  
  out = mat;
  wsp = mat * syg;
  lmb = sqrt(2*log(size)) * median(abs(wsp(size / 2 : size))) / 0.6745;
      
  for i = 1 : size
    
    if abs(wsp(i)) <= lmb
      
      out(i,:) = zeros(1, size);
      
    endif
    
  endfor
  
  out = inv(mat) * out;
  
endfunction
