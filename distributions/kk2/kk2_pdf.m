function [ y ] = kk2_pdf( x, mix, c1, v1, c2, v2)
% KK2_PDF Generates the PDF K-K2
% ----------------------------------------------------
%        x : evaluation points            (row vector)
%      mix : mixture parameter KK2           (1 value)
%       a1 : scale parameter KK2 dist 1      (1 value)
%       b1 : shape parameter KK2 dist 1      (1 value)
%       a2 : scale parameter KK2 dist 2      (1 value)
%       b2 : shape parameter KK2 dist 2      (1 value)
%      ---   -----------------------------------------
%        y : PDF values                   (row vector)
% --------   ----------(example)----------------------
% [ y ] =kk2_pdf( 0:0.1:5, 0.5, 0.5, 2, 4, 10);
% ---------------------(example)----------------------

% using the pdf function
K1 = k2_pdf( x, c1, v1);
K2 = k2_pdf( x, c2, v2);
y = (1-mix)*K1+mix*K2; 

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