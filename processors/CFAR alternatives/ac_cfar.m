function [ d ] = ac_cfar( s,cut,g,T,Tc )
% AC_CFAR Detection with AC-CA-CFAR for fixed window
% ----------------------------------------------------------
%     s : data in the fixed window           (column vector)
%   cut : cell under test                          (1 value)
%     g : guard cells                              (1 value)
%     T : threshold multiplier for CA              (1 value)
%    Tc : threshold multiplier for non-hom         (1 value)    
% -----   --------------------------------------------------
%     d : result of detection                      (1 value)
% -----   ---------------(example)--------------------------
% [ d ] = ac_cfar( [5 5 5 5 1 1 1 1 1 1 1 1 5 5 5 5]',5,0,2,3 )
% [ d ] = ac_cfar( [5 5 5 5 1 1 1 1 1 1 1 1 5 5 5 5]',5,0,2,6 )
% -----------------------(example)--------------------------

% --- starting
[m,n] = size(s);
ss = cat(1,s(1:m/2-g),s(m/2+1+g:m)); % supress guard cells
[m,n] = size(ss);
k1 = 1; % start of the new sliding window
k2 = m; % last cell to be considered for the new sliding window
d = 0;

% --- auxiliary steps
for m_1 = 1:m-1
    if m_1 < m/2 % looping through leading cells
        if ss(m_1)>Tc*ss(m_1+1) % high to low transition
            k1 = m_1;
        elseif ss(m_1+1)>Tc*ss(m_1) % low to high transition
            k1 = m_1;
        end
    elseif m_1 == m/2 % looping through edge between leading and lagging cells
        if ss(m_1)>Tc*ss(m_1+1) % high to low transition
            k2 = m_1; % test cell is always assumed high
            break
        elseif ss(m_1+1)>Tc*ss(m_1) % low to high transition
            k1 = m_1;
        end
    else % looping through lagging cells
        if ss(m_1)>Tc*ss(m_1+1) % high to low transition
            k2 = m_1;
            break
        elseif ss(m_1+1)>Tc*ss(m_1) % low to high transition
            k2 = m_1;
            break
        end
    end
end

% computing the average
sss = ss(k1+1:k2); 
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