function [ u_estim, l_estim ] = ig_estim_par( samples )
% IG_ESTIM_PAR Estimates the parameters InvGaus
% ------------------------------------------------------------------------------
%   samples : each column contains a dataset                         (vector 2D)
%       ---   ------------------------------------------------------------------
%   u_estim : estimations of the localization parameter InvGaus     (row vector)
%   l_estim : estimations of the scale parameter InvGaus            (row vector)
% ---------% --------------------(example)-------------------------------------
% [ samples ] = ig_gen_sets( 1000,ones(1,100),1*ones(1,100));
% [ u_estim, l_estim  ] = ig_estim_par( samples );
% -------------------------------(example)-------------------------------------

% initial
[m,n]=size(samples);
u_estim = zeros(1,n);
l_estim = zeros(1,n);

% looping
for n_1 = 1:n
    z = samples(:,n_1);
    u_estim(1,n_1) = (1/m)*sum(z);
    count = 0;
    for m_1 = 1:m
        count = count + sum((1/z(m_1,1))-(1/u_estim(1,n_1)));
    end
    l_estim(1,n_1) = (m-1)/count;
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