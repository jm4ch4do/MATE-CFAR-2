function [ d ] = exc_cfar( s,cut,g,T,T2 )
% EXC_CFAR Detection with EXC-CFAR for fixed window
% ----------------------------------------------------------
%     s : data in the fixed window           (column vector)
%   cut : cell under test                          (1 value)
%     g : guard cells                              (1 value)
%     T : threshold multiplier for CA              (1 value)
%    T2 : threshold for peaks           (1 value)    
% -----   --------------------------------------------------
%     d : result of detection                      (1 value)
% -----   ---------------(example)--------------------------
% [ d ] = exc_cfar( [1 1 1 1 1 1 1 10]' ,5,0,4,8 )
% [ d ] = exc_cfar( [1 1 1 1 1 1 1 10]' ,5,0,4,11 )
% -----------------------(example)--------------------------

% --- starting
[m,n] = size(s);
ss = cat(1,s(1:m/2-g),s(m/2+1+g:m)); % supress guard cells
[m,n] = size(ss);
d = 0;
too_high = zeros(m,n);

% --- auxiliary steps
% find peaks
for i = 1:m
    if ss(i)>T2
        too_high(i) = 1;
    end
end
   
% supress peaks
sss = zeros(m-sum(too_high),1);
counter = 1;
for i = 1:m
    if too_high(i) ~= 1;
        sss(counter) = ss(i);
        counter = counter+1;
    end
end
        
% computing the average 
c = mean(sss);

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