function [ u_estim, s_estim ] = ln_estim_par( samples)
% LN_ESTIM_PAR Estimates the parameters Log-Normal
% -----------------------------------------------------------------------
%   samples : each column contains a dataset                  (vector 2D)
%     max_i : maximum number of iterations in the search        (1 value)
%       ---   -----------------------------------------------------------
%   u_estim : estimations of the scale parameter Log-Normal  (row vector)
%   s_estim : estimations of the shape parameter Log-Normal  (row vector)
% ---------   --------------------(example)------------------------------
% [ samples ] = ln_gen_sets( 1000,ones(1,100),0.5*ones(1,100));
% [ u_estim, s_estim  ] = ln_estim_par( samples);
% --------------------------------(example)------------------------------

% initial
[m,n]=size(samples);
u_estim = zeros(1,n);
s_estim = zeros(1,n);

% looping
for n_1 = 1:n
    z = samples(:,n_1);
    u_estim(1,n_1) = (1/m)*sum(log(z));
    A = (1/(m-1));
    B = (log(z)).^2;
    C = B-(u_estim(1,n_1)^2);
    s_estim(1,n_1) = sqrt(A * sum(C) );
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