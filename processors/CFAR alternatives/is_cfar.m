function [ d ] = is_cfar( s,cut,g,T,T2,num )
% IS_CFAR Detection with IS-CFAR for fixed window
% ----------------------------------------------------------
%     s : data in the fixed window           (column vector)
%   cut : cell under test                          (1 value)
%     g : guard cells                              (1 value)
%     T : threshold multiplier for CA              (1 value)
%    T2 : threshold multiplier for set selection   (1 value)
%   num : number of samples to select lower set    (1 value)  
% -----   --------------------------------------------------
%     d : result of detection                      (1 value)
% -----   ---------------(example)--------------------------
% [ d ] = is_cfar( [5 5 5 1 1 5 1 5]',5,0,2,0.5,4 )
% [ d ] = is_cfar( [5 1 5 1 1 5 1 1]',5,0,2,0.5,4 )
% -----------------------(example)--------------------------

% --- starting
[m,n] = size(s);
ss = cat(1,s(1:m/2-g),s(m/2+1+g:m)); % supress guard cells
[m,n] = size(ss);
d = 0;

% --- auxiliary steps
counter_low = 0;
counter_high = 0;
low_set = zeros(m,1);
high_set = zeros(m,1);
TT = cut*T2;
for m_1 = 1:m
   if ss(m_1)<TT
       counter_low = counter_low+1;
       low_set(counter_low) = ss(m_1);
   else
       counter_high = counter_high+1;
       high_set(counter_high) = ss(m_1);
   end
end

% computing the average
if counter_low>=num
    c = mean(low_set(1:counter_low));
else
    c = mean(high_set(1:counter_high));
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