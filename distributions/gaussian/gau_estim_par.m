function [ u_estim, s_estim ] = gau_estim_par( samples)
% GAU_ESTIM_PAR Estimates the parameters Gaussian
% -----------------------------------------------------------------------
%   samples : each column contains a dataset                  (vector 2D)
%       ---   -----------------------------------------------------------
%   u_estim : estimations of the scale parameter Gaussian    (row vector)
%   s_estim : estimations of the shape parameter Gaussian    (row vector)
% ---------   --------------------(example)------------------------------
% [ samples ] = gau_gen_sets( 1000,ones(1,100),3*ones(1,100));
% [ u_estim, s_estim  ] = gau_estim_par( samples);
% --------------------------------(example)------------------------------

% initial
[m,n] = size(samples);
u_estim = zeros(1,n);
s_estim = zeros(1,n);

% looping through every group of samples
for n_1 = 1:n
    u_estim(1,n_1)=sum(samples(:,n_1))/m;
    s_estim(1,n_1)=sqrt(sum((samples(:,n_1)-u_estim(1,n_1)).^2)/(m-1));
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