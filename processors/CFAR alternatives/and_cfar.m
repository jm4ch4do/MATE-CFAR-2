function [ d ] = and_cfar( s,cut,g,T_ca,T_os )
% AND_CFAR Detection with AND-CFAR for fixed window
% ----------------------------------------------------------
%     s : data in the fixed window           (column vector)
%   cut : cell under test                          (1 value)
%     g : guard cells                              (1 value)
%  T_ca : threshold multiplier for CA              (1 value)
%  T_os : threshold multiplier for OS              (1 value)
% -----   --------------------------------------------------
%     d : result of detection                      (1 value)
% -----   ---------------(example)--------------------------
% [ d ] = os_cfar( [1 1 10 1 1 1 1 10]' ,5,0,4 )
% [ d ] = ca_cfar( [1 1 1 1 1 1 1 10]' ,5,0,4 )
% [ d ] = and_cfar( [1 1 10 1 1 1 1 10]' ,5,0,4,4 )
% -----------------------(example)--------------------------

% --- starting
[m,n] = size(s);
ss = cat(1,s(1:m/2-g),s(m/2+1+g:m)); % supress guard cells
[m,n] = size(ss);
d = 0;

% --- auxiliary steps
c_ca = mean(ss);
ss = sort(ss); % sorting
c_os = mean(ss(abs(m/2))+ss(abs(m/2+1))); % averaging the two central values

% computing threshold
if cut > T_ca*c_ca && cut > T_os*c_os
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