function [ d ] = so_cfar( s,cut,g,T )
% SO_CFAR Detection with SO-CFAR for fixed window
% ----------------------------------------------------------
%     s : data in the fixed window           (column vector)
%   cut : cell under test                          (1 value)
%     g : guard cells                              (1 value)
%     T : threshold multiplier                     (1 value)
% -----   -------------------------------------------------
%     d : result of detection                      (1 value)
% -----   ---------------(example)--------------------------
% [ d ] = so_cfar( [2 2 2 2 1 1 1 1]' ,5,0,4 )
% [ d ] = so_cfar( [1 1 1 1 2 2 2 2]' ,5,0,4 )
% -----------------------(example)--------------------------

% --- starting
[m,n] = size(s);
ss = cat(1,s(1:m/2-g),s(m/2+1+g:m)); % supressing guard cells
[m,n] = size(ss);
d = 0;

% --- auxiliary steps
left_w = ss(1:m/2,1); % left_w = left window 
right_w = ss(m/2+1:m); % right_w = right window 
LW = mean(left_w);
RW = mean(right_w);

% choosing the average
if LW < RW
    c = LW;
else
    c = RW;
end

% computing threshold
if cut > T*c
    d=1;
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