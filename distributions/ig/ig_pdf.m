function [ y ] = ig_pdf( x, u, l)
% IG_PDF Generates the PDF InvGaus
% --------------------------------------------------------------
%        x : evaluation points                      (row vector)
%        a : localization parameter InvGaus            (1 value)
%        b : scale parameter InvGaus                   (1 value)
%      ---   ---------------------------------------------------
%        y : PDF values                             (row vector)
% --------   --------(example)----------------------------------
% [ y ] = ig_pdf( 0:0.001:5, 1, 1);
% -------------------(example)----------------------------------

% --- initial
[m,n]= size(x);
y = zeros(1,n);

% --- generating the requested InvGaus PDFs
A_1 = sqrt(l/(2*pi));
for n_1=1:n
    z = x(1,n_1);
    A_2 = 1/z^(3/2);
    A_3 = l*(z-u)^2/(2*u^2*z);
    y(1,n_1) = A_1 * A_2 * exp(-A_3);
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