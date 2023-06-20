function [ a_estim, b_estim ] = lw_estim_par( samples,max_i)
% LW_ESTIM_PAR Estimates the parameters Log-Weibull
% -----------------------------------------------------------------------
%   samples : each column contains a dataset                  (vector 2D)
%     max_i : maximum number of iterations in the search        (1 value)
%       ---   -----------------------------------------------------------
%   a_estim : estimations of the scale parameter Log-Weibull (row vector)
%   b_estim : estimations of the shape parameter Log-Weibull (row vector)
% ---------   --------------------(example)------------------------------
% [ samples ] = lw_gen_sets( 1000,ones(1,100),3*ones(1,100));
% [ a_estim, b_estim  ] = lw_estim_par( samples,20);
% --------------------------------(example)------------------------------

% initial
[m,n] = size(samples);
a_estim = zeros(1,n);
b_estim = zeros(1,n);

for n_1 = 1:n
    bb = 10.45; % initial guest
    for i = 1:max_i
        % computing sums
        A = 0;
        B = 0;
        C = 0;
        for m_1 = 1:m
            z = samples(m_1,n_1);
            A = A + log(z)^bb;
            B = B + log(log(z));
            C = C + log(z)^bb*log(log(z)); 
        end

        % beta estimation
        bb = 1/(C/A - B/m);
    end

    a_estim(1,n_1) = (A/m)^(1/bb);
    b_estim(1,n_1) = bb;
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