function [ y ] = pea_cdf( x, g)
% PEA_CDF Generates the CDF Pearson
% ---------------------------------------------------------
%        x : evaluation points                 (row vector)
%        g : scale parameter Pearson              (1 value)
%      ---   ----------------------------------------------
%        y : CDF values                        (row vector)
% --------   --------(example)-----------------------------
% [ y ] = pea_cdf( 0:0.001:5, 0.2);
% -------------------(example)-----------------------------

% --- initial
[m,n]= size(x);
y = zeros(1,n);

% --- generating the requested CDFs Pearson
for n_1=1:n
    z = x(1,n_1);
    y(1,n_1) = erfc(g/sqrt(2*z));
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