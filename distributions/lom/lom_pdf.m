function [ y ] = lom_pdf( x, b, a)
% LOM_PDF Generates the PDF Lomax
% ----------------------------------------------------
%        x : evaluation points            (row vector)
%        b : scale parameter Lomax           (1 value)
%        a : shape parameter Lomax           (1 value)
%      ---   -----------------------------------------
%        y : PDF values                   (row vector)
% --------   --------(example)------------------------
% [ y ] = lom_pdf( 0:0.001:10, 5, 5);
% -------------------(example)------------------------

% --- initial
[m,n]= size(x);
y = zeros(1,n);

% --- generating the requested Lomax PDFs
A_1 = a/b; % first part of the formula
for n_1=1:n
    z = x(1,n_1);
    A_2 = (1+(z/b));
    y(1,n_1) = A_1 * A_2^(-(a+1));
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