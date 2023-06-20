function [ y ] = kk_gen_sets( amount,mix, c1, v1, c2, v2)
% KK_GEN_SETS generates multiple sets K-K
% -----------------------------------------------------------------------
%    amount : amount of samples per set                         (1 value)
%       mix : mixture parameter KK                              (1 value)
%        c1 : scale parameter KK dist 1                         (1 value)
%        v1 : shape parameter KK dist 1                         (1 value)
%        c2 : scale parameter KK dist 2                         (1 value)
%        v2 : shape parameter KK dist 2                         (1 value)
%       ---   -----------------------------------------------------------
%         y : every colum contains a different set            (2D matriz)       
% ---------   ----------------(example)----------------------------------
% [ samples ] =kk_gen_sets( 1000,[0.5 0.5 0.5],[ 2 2 2 ],[ 0.5 0.5 0.5 ],[ 10 10 10 ],[ 20 20 20 ]);
% ----------------------------(example)----------------------------------

% initial
[m,n] = size(v1);
y = zeros(amount,n);

% generating requested samples
for n_1 = 1:n
    mixx = mix(1,n_1);
    cc1 = c1(1,n_1);
    vv1 = v1(1,n_1);
    cc2 = c2(1,n_1);
    vv2 = v2(1,n_1);
    y(:,n_1) = kk_gen(amount,mixx,cc1,vv1,cc2,vv2);
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