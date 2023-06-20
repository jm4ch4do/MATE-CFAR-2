function [ y ] = k_cdf( x, c, v)
% K_CDF Generates the CDF K
% ----------------------------------------------------
%        x : evaluation points            (row vector)
%        c : scale parameter K               (1 value)
%        v : shape parameter K               (1 value)
%      ---   -----------------------------------------
%        y : CDF values                   (row vector)
% --------   --------(example)------------------------
% [ y ] = k_cdf( 0.001:0.001:5, 1, 3);
% -------------------(example)------------------------

% --- initial
[m,n]= size(x);
y = zeros(1,n);

% --- generar curvas solicitadas de K
A_1 = 2*(c^v)/gamma(v); % first part of the formula
for n_1=1:n
    z = x(1,n_1);
    A_2 = z^v;
    A_3 = besselk(v,2*c*z);
    y(1,n_1) = 1-A_1*A_2*A_3;

    % avoiding x = 0
    if isnan(y(1,n_1))
        y(1,n_1) = 0.000000001;
    end
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