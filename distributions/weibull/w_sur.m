function [ y ] = w_sur( x, a,b)
% W_SUR Generates the survival function Weibull
% ----------------------------------------------------
%        x : evaluation points            (row vector)
%        a : scale parameter Weibull         (1 value)
%        b : shape parameter Weibull         (1 value)
%      ---   -----------------------------------------
%        y : CDF values                   (row vector)
% --------   ----------(example)----------------------
% [ y ] = w_sur( 0:0.01:3, 1, 2);
% ---------------------(example)----------------------

% --- initial
[m,n]= size(x);

% using the cdf function
y = 1-w_cdf( x, a, b); 

end


%  Copyright 2017 José Raúl Machado Fernández.
%
%  This file is part of MATE-CFAR 2
%
%    MATE-CFAR 2 is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.

%    MATE-CFAR 2 is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.

%    You should have received a copy of the GNU General Public License
%    along with MATE-CFAR 2.  If not, see <http://www.gnu.org/licenses/>.