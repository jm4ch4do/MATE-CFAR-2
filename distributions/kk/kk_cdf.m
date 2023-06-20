function [ y ] = kk_cdf( x, mix,c1, v1,c2,v2)
% KK_CDF Generates the CDF K-K
% ----------------------------------------------------
%        x : evaluation points            (row vector)
%      mix : mixture parameter KK            (1 value)
%       c1 : scale parameter KK dist 1       (1 value)
%       v1 : shape parameter KK dist 1       (1 value)
%       c2 : scale parameter KK dist 2       (1 value)
%       v2 : shape parameter KK dist 2       (1 value)
%      ---   -----------------------------------------
%        y : CDF values                   (row vector)
% --------   --------(example)------------------------
% [ y ] = kk_cdf( 0:0.1:5, 0.5, 0.5, 2, 4, 10);
% -------------------(example)------------------------

% --- using the K CDF
K1 = k_cdf( x, c1, v1);
K2 = k_cdf( x, c2, v2);
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