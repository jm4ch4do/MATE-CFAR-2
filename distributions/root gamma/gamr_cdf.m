function [ y ] = gamr_cdf( x, b, v)
% GAMR_CDF Generates the CDF Root-Gamma
% ----------------------------------------------------
%        x : evaluation points            (row vector)
%        b : scale parameter Root-Gamma      (1 value)
%        v : shape parameter Root-Gamma      (1 value)
%      ---   -----------------------------------------
%        y : CDF values                   (row vector)
% --------   --------(example)------------------------
% [ y ] = gamr_cdf( 0.001:0.001:4, 1, 3);
% -------------------(example)------------------------

% --- initial
[m,n]= size(x);
y = zeros(1,n);

% --- generar curvas solicitadas de Gamma
for n_1=1:n
    z = x(1,n_1);
    A_1 = gammainc(b^2*z^2,v);
    y(1,n_1) = A_1;
end

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