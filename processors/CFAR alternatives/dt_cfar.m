function [ d ] = dt_cfar( s,cut,g,T,T2 )
% DT_CFAR Detection with DT-CFAR for fixed window
% ----------------------------------------------------------
%     s : data in the fixed window           (column vector)
%   cut : cell under test                          (1 value)
%     g : guard cells                              (1 value)
%     T : threshold multiplier for CA              (1 value)
%    T2 : threshold multiplier for peaks           (1 value)    
% -----   --------------------------------------------------
%     d : result of detection                      (1 value)
% -----   ---------------(example)--------------------------
% [ d ] = dt_cfar( [1 1 1 1 1 1 1 10]' ,5,0,4,4 )
% [ d ] = dt_cfar( [1 1 1 1 1 1 1 10]' ,5,0,4,8 )
% -----------------------(example)--------------------------

% --- starting
[m,n] = size(s);
ss = cat(1,s(1:m/2-g),s(m/2+1+g:m)); % supress guard cells
[m,n] = size(ss);
d = 0;

% --- auxiliary steps (reducing the size of the sliding window)
sss = ss;
while 1 % continue until there are no more interfearing targets
    om = zeros(m,n); % cell ommited due to interfearence targets
    TT = mean(sss)*T2; %compute the threshold
    for m_1 = 1:m % finding peaks
        if sss(m_1) > TT
            om(m_1) = 1;
        end
    end
    new_sss = zeros(m-sum(om),1);
    [new_m,n] = size(new_sss);
    if new_m == m
        break % no change => loop is over
    else
        counter = 1;
        for m_1 = 1:m % excluding peaks
            if om(m_1) == 0 
                new_sss(counter) = sss(m_1);
                counter = counter + 1;
            end
        end
    sss = new_sss; % change => star over
    m = new_m;    
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