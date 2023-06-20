function [ d ] = ml_cfar( s,cut,g,T )
% ML_CFAR Detection with ML-CFAR for fixed window
% ----------------------------------------------------------
%     s : data in the fixed window           (column vector)
%   cut : cell under test                          (1 value)
%     g : guard cells                              (1 value)
%     T : threshold multiplier                     (1 value)
% -----   --------------------------------------------------
%     d : result of detection                      (1 value)
% -----   ---------------(example)--------------------------
% [ d ] = os_cfar( [1 1 10 1 1 1 1 10]' ,5,0,4 ) % mean = 1
% [ d ] = ca_cfar( [1 1 1 1 1 1 1 10]' ,5,0,4 ) % mean = 2.125
% [ d ] = ml_cfar( [1 1 10 1 1 1 1 10]' ,5,0,4 ) % mean = 1.5625
% -----------------------(example)--------------------------

% --- starting
[m,n] = size(s);
ss = cat(1,s(1:m/2-g),s(m/2+1+g:m)); % supress guard cells
[m,n] = size(ss);
d = 0;

% --- auxiliary steps
c_ca = mean(ss);
ss = sort(ss); % sorting
c_os = (ss(abs(m/2))+ss(abs(m/2+1)))/2; % averaging the two central values

% choosing the average
c = mean(cat(1,c_ca,c_os));

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