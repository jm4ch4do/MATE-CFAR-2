function [ g_estim ] = pea_estim_par( samples )
% PEa_ESTIM_PAR Estimates the parameters Pearson
% -----------------------------------------------------------------------
%   samples : each column contains a dataset                  (vector 2D)
%       ---   -----------------------------------------------------------
%   g_estim : estimations of the scale parameter Pearson     (row vector)
% ---------   --------------------(example)------------------------------
% [ samples ] = pea_gen_sets( 1000,0.2*ones(1,100));
% [ g_estim ] = pea_estim_par( samples );
% --------------------------------(example)------------------------------

% initial
[m,n]=size(samples);
g_estim = zeros(1,n);

% looping through 'samples' for estimating the parameter of each column
for n_1 = 1:n
    z = samples(:,n_1);
    total = 0;
    for m_1 = 1:m
        total = total + 1/z(m_1,1);
    end
    g_estim(1,n_1) = sqrt(m/total);
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