function [ y ] = ww_gen_sets( amount,mix, a1, b1, a2, b2)
% WW_GEN_SETS generates multiple sets Weibull-Weibull
% -----------------------------------------------------------------------
%    amount : amount of samples per set                         (1 value)
%       mix : mixture parameter WW                              (1 value)
%        a1 : scale parameter WW dist 1                         (1 value)
%        b1 : shape parameter WW dist 1                         (1 value)
%        a2 : scale parameter WW dist 2                         (1 value)
%        b2 : shape parameter WW dist 2                         (1 value)
%       ---   -----------------------------------------------------------
%         y : every colum contains a different set            (2D matriz)       
% ---------   ----------------(example)----------------------------------
% [ samples ] = ww_gen_sets( 1000,[0.5 0.5 0.5],[ 2 2 2 ],[ 0.5 0.5 0.5 ],[ 10 10 10 ],[ 20 20 20 ]);
% ----------------------------(example)----------------------------------

% initial
[m,n] = size(a);
y = zeros(amount,n);

% generating requested samples
for n_1 = 1:n
    mixx = mix(1,n_1);
    aa1 = a1(1,n_1);
    bb1 = b1(1,n_1);
    aa2 = a2(1,n_1);
    bb2 = b2(1,n_1);
    y(:,n_1) = ww_gen(amount,mixx,aa1,bb1,aa2,bb2);
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