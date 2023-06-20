function [ c_estim, v_estim ] = k2_estim_par( samples )
% K2_ESTIM_PAR Estimates the parameters K2
% -----------------------------------------------------------------------
%   samples : each column contains a dataset                  (vector 2D)
%     max_i : maximum number of iterations in the search        (1 value)
%       ---   -----------------------------------------------------------
%   c_estim : estimations of the scale parameter K2          (row vector)
%   v_estim : estimations of the shape parameter K2          (row vector)
% ---------   --------------------(example)------------------------------
% [ samples ] = k2_gen_sets( 1000,ones(1,100),3*ones(1,100));
% [ c_estim, v_estim  ] = k2_estim_par( samples );
% --------------------------------(example)------------------------------

% initial
[m,n] = size(samples);
c_estim = zeros(1,n);
v_estim = zeros(1,n);

% looping through every group of samples
for n_1 = 1:n
    m1 = (sum(samples(:,n_1)))/m; % computing algebraic moments
    m2 = (sum(samples(:,n_1).^2))/m;
    v_estim(1,n_1) = 2*m1^2/(m2-2*m1^2); % estimates shape parameter using mom
    c_estim(1,n_1) = sqrt(v_estim(1,n_1)/m1);
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