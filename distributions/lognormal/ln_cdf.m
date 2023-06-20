function [ y ] = ln_cdf( x, u, s)
% LN_CDF Generates the CDF Log-Normal
% ----------------------------------------------------
%        x : evaluation points            (row vector)
%        u : scale parameter Log-Normal      (1 value)
%        s : shape parameter Log-Normal      (1 value)
%      ---   -----------------------------------------
%        y : CDF values                   (row vector)
% --------   --------(example)------------------------
% [ y ] = ln_cdf( 0.001:0.001:10, 1, 0.5);
% -------------------(example)------------------------

% --- initial
[m,n]= size(x);
y = zeros(1,n);

% --- generating the requested CDFs Log-Normal
for n_1=1:n
    z = x(1,n_1);
    A_1 = (log(z)-u)/(s*sqrt(2));
    y(1,n_1) = 1/2 +(1/2)*erf(A_1);
    
    % avoiding the value of 0
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