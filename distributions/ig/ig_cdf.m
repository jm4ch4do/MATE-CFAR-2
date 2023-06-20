function [ y ] = ig_cdf( x, u,l)
% IG_CDF Generates the CDF InvGauss
% --------------------------------------------------------------
%        x : evaluation points                      (row vector)
%        u : localization parameter InvGaus            (1 value)
%        l : scale parameter InvGaus                   (1 value)
%      ---   ---------------------------------------------------
%        y : CDF values                             (row vector)
% --------   --------(example)----------------------------------
% [ y ] = ig_cdf( 0.001:0.001:5, 1, 1);
% -------------------(example)----------------------------------

% --- initial
[m,n]= size(x);
y = zeros(1,n);

% --- generating the requested CDFs Inversa Gamma
for n_1 = 1:n
    z = x(1,n_1);
    A =  sqrt(l/z)*(z/u-1);
    B = -sqrt(l/z)*(z/u+1);
    y(1,n_1) = gau_cdf(A,0,1)+exp(2*l/u)*gau_cdf(B,0,1);
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