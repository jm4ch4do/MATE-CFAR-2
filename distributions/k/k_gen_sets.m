function [ y ] = k_gen_sets( amount,c,v)
% K_GEN_SETS generates multiple sets K
% -----------------------------------------------------------------------
%    amount : amount of samples per set                         (1 value)
%         b : scale parameter for each set                   (row vector)
%         v : shape parameter for each set                   (row vector)
%       ---   -----------------------------------------------------------
%         y : every colum contains a different set            (2D matriz)       
% ---------   ----------------(example)----------------------------------
% [ samples ] = k_gen_sets( 1000,[ 1 1 1 ],[ 3 3 3 ]);
% ----------------------------(example)----------------------------------

% initial
[m,n] = size(v);
y = zeros(amount,n);

% generating requested samples
for n_1 = 1:n
    cc = c(1,n_1);
    vv = v(1,n_1);
    y(:,n_1) = k_gen(amount,cc,vv); 
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