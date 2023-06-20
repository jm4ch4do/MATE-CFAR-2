function [ y ] = pea_sur( x, g)
% PEA_SUR Generates the survival function Pearson
% ----------------------------------------------------
%        x : evaluation points            (row vector)
%        g : scale parameter Pearson         (1 value)
%      ---   -----------------------------------------
%        y : CDF values                   (row vector)
% --------   ----------(example)----------------------
% [ y ] = pea_sur( 0:0.01:5, 0.2);
% ---------------------(example)----------------------

% --- initial
[m,n]= size(x);

% using the cdf function
y = 1-pea_cdf( x, g); 

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