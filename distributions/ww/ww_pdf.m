function [ y ] = ww_pdf( x, mix, a1, b1, a2, b2)
% WW_PDF Generates the PDF Weibull-Weibull
% ----------------------------------------------------
%        x : evaluation points            (row vector)
%      mix : mixture parameter WW            (1 value)
%       a1 : scale parameter WW dist 1       (1 value)
%       b1 : shape parameter WW dist 1       (1 value)
%       a2 : scale parameter WW dist 2       (1 value)
%       b2 : shape parameter WW dist 2       (1 value)
%      ---   -----------------------------------------
%        y : PDF values                   (row vector)
% --------   ----------(example)----------------------
% [ y ] = ww_pdf( 0:0.01:20, 0.5, 2, 0.5, 10, 20);
% ---------------------(example)----------------------

% --- initial
[m,n]= size(x);

% using the pdf function
W1 = w_pdf( x, a1, b1);
W2 = w_pdf( x, a2, b2);
y = (1-mix)*W1+mix*W2; 

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