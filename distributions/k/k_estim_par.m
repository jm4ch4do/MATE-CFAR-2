function [ c_estim, v_estim ] = k_estim_par( samples )
% K_ESTIM_PAR Estimates the parameters K
% -----------------------------------------------------------------------
%   samples : each column contains a dataset                  (vector 2D)
%       ---   -----------------------------------------------------------
%   c_estim : estimations of the scale parameter K           (row vector)
%   v_estim : estimations of the shape parameter K           (row vector)
% ---------   --------------------(example)------------------------------
% [ samples ] = k_gen_sets( 1000,ones(1,100),3*ones(1,100));
% [ c_estim, v_estim  ] = k_estim_par( samples );
% --------------------------------(example)------------------------------

% initial
[m,n] = size(samples);
c_estim = zeros(1,n);
v_estim = zeros(1,n);

% looping through every group of samples
for n_1 = 1:n
   column = samples(:,n_1);
   m2 = (sum(column.^2))/m;
   m4 = (sum(column.^4))/m;
   A = m4/(2*(m2^2));
   vv= 1/(A-1);
   cc= sqrt(vv/m2);
   c_estim(1,n_1) = cc;
   v_estim(1,n_1) = vv;
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