function [ b_estim, a_estim ] = lom_estim_par( samples)
% LOM_ESTIM_PAR Estimates the parameters Lomax 
% -----------------------------------------------------------------------
%   samples : each column contains a dataset                  (vector 2D)
%       ---   -----------------------------------------------------------
%   b_estim : estimations of the scale parameter Lomax       (row vector)
%   a_estim : estimations of the shape parameter Lomax       (row vector)
% ---------   --------------------(example)------------------------------
% [ samples ] = lom_gen_sets( 1000,5*ones(1,100),5*ones(1,100));
% [ b_estim, a_estim  ] = lom_estim_par( samples );
% --------------------------------(example)------------------------------

% initial
[m,n]=size(samples);
b_estim = zeros(1,n);
a_estim = zeros(1,n);

% looping through "samples"
for n_1 = 1:n
    z = samples(:,n_1);
    m1 = mean(z);
    m2 = mean(z.^2);
    A = m1^2/m2;
    a_estim(1,n_1) = (2*A-2)/(2*A-1); 
    b_estim(1,n_1) = m1*(a_estim(1,n_1)-1);
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