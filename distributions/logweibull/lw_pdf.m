function [ y ] = lw_pdf( x, a, b)
% LW_PDF Generates the PDF Log-Weibull
% ----------------------------------------------------
%        x : evaluation points            (row vector)
%        a : scale parameter Log-Weibull     (1 value)
%        b : shape parameter Log-Weibull     (1 value)
%      ---   -----------------------------------------
%        y : PDF values                   (row vector)
% --------   --------(example)------------------------
% [ y ] = lw_pdf( 1:0.001:6, 1, 3);
% -------------------(example)------------------------

% --- initial
[m,n]= size(x);
y = zeros(1,n);

% --- generating the requested Log-Weibull PDFs
for n_1=1:n
    z = x(1,n_1);
    A_1 = b/(a*(z));
    A_2 = (log(z)/a)^(b-1);
    A_3 = exp(-((log(z)/a)^b));
    y(1,n_1) = A_1 * A_2 * A_3;
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