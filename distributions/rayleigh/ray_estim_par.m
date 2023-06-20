function [ a_estim ] = ray_estim_par( samples )
% RAY_ESTIM_PAR Estimates the parameters Rayleigh
% -----------------------------------------------------------------------
%   samples : each column contains a dataset                  (vector 2D)
%       ---   -----------------------------------------------------------
%   a_estim : estimations of the scale parameter Rayleigh    (row vector)
% ---------   --------------------(example)------------------------------
% [ samples ] = ray_gen_sets( 1000,ones(1,100));
% [ a_estim ] = ray_estim_par( samples );
% --------------------------------(example)------------------------------

% initial
[m,n] = size(samples);
a_estim = zeros(1,n);

% looping through 'samples' for estimating the parameter of each column
for n_1 = 1:n
   column = samples(:,n_1);
   aa = (sum(column.^2));
   aa = sqrt(aa/(2*m));
   a_estim(1,n_1) = aa;
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