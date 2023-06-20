function [ pf ] = calculate_pf( x,p,w,g,T,varargin)
% CALCULATE_PF Computes false alarm probability (pf)
% -------------------------------------------------------------------
%     x : data with clutter                           (column vector)
%     p : number of processor to be used                    (1 value)
%     w : window size                                       (1 value)
%     g : guard cells                                       (1 value)
%     T : threshold multiplier                              (1 value)
%  vara : other auxiliary parameters                            (row)
% -----   -----------------------------------------------------------
%    pf : false alarm probability                           (1 value)
% -----   -------------------(example)-------------------------------
% x = lw_gen_sets( 1000,1,3);
% [ pf ] = calculate_pf( x,1,8,0,2 );
% ---------------------------(example)---------------------------------

[m,n] = size(x);
varargin = cell2mat(varargin);
[ d ] = sliding_cfar( x,p,w,g,T,varargin );
pf = sum(d)/m;

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