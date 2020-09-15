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

function [vect] = gen_ones(n, x)
  
  assert(n > 0, 'n must be greater than zero');
  assert(x <= n, 'x must be less or equal n');
  
  vect = zeros(1, n);
  vect(x) = 1.0;
  
endfunction
