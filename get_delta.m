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

function [delta] = get_delta(syg1, syg2)
  
  assert(length(syg1) == length(syg2), 'length dont match');
  
  len = length(syg1);
  delta = 0.0;
  
  for i = 1 : len
    
    delta = delta + abs(syg1(i) - syg2(i));
    
  endfor
  
endfunction
