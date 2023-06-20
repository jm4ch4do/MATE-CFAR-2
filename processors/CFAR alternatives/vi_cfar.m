function [ d ] = vi_cfar( s,cut,g,T,T2,T3,T4,kMR,kVI )
% VI_CFAR Detection with VI-CFAR for fixed window
% ----------------------------------------------------------
%     s : data in the fixed window           (column vector)
%   cut : cell under test                          (1 value)
%     g : guard cells                              (1 value)
%     T : threshold multiplier for whole window    (1 value)
%    T2 : threshold multiplier for half window     (1 value)
%    T3 : threshold multiplier for SO              (1 value)
%    T4 : threshold multiplier for GO              (1 value)
%   kMR : threshold for Mean Ratio                 (1 value)
%   kVI : threshold for Var. Index                 (1 value)
% -----   --------------------------------------------------
%     d : result of detection                      (1 value)
% -----   ---------------(example)--------------------------
% [ d ] = vi_cfar( [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]',5,0,2,1.8,1.5,2,1.9,1.9 ) % CA
% [ d ] = vi_cfar( [1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2]',5,0,2,1.8,1.5,2,1.9,1.9 ) % GO
% [ d ] = vi_cfar( [10 1 1 10 1 10 1 1 1 1 1 1 1 1 1 1]',5,0,2,1.8,1.5,2,1.9,1.9 ) % CA-2
% [ d ] = vi_cfar( [10 1 1 10 1 10 1 1 1 1 6 1 6 1 1 6]',5,0,2,1.8,1.5,2,1.9,1.9 ) % SO
% -----------------------(example)--------------------------

% --- starting
[m,n] = size(s);
ss = cat(1,s(1:m/2-g),s(m/2+1+g:m)); % supress guard cells
[m,n] = size(ss);
d = 0;


% --- auxiliary steps
s1 = ss(1:m/2); %leading window
s2 = ss(m/2+1:m); %lagging window

% computing metrics
MR = mean(s1)/mean(s2);
VI1 = 1 + var(s1)/mean(s1);
VI2 = 1 + var(s2)/mean(s2);

% computing the average
if VI1 <= kVI && VI2<=kVI
    if MR <= kMR && MR >= kMR^(-1)
        c = mean(ss); % CA-CFAR
        TT = T; % use T threshold
    elseif mean(s1)>mean(s2)
        TT = T4; % use T4 threshold
        c = mean(s1); % GO-CFAR
    else
        TT = T4; % use T4 threshold
        c = mean(s2); % GO-CFAR
    end
elseif VI1 >= kVI && VI2<=kVI
    TT = T2; % use T2 threshold
    c = mean(s2); % CA/2
elseif VI1 <= kVI && VI2>=kVI
    TT = T2;% use T2 threshold
    c = mean(s1); % CA/2
else
    if mean(s1)>mean(s2)
        TT = T3; % use T3 threshold
        c = mean(s2); % SO-CFAR
    else
        TT = T3; % use T3 threshold
        c = mean(s1); % SO-CFAR
    end
end

% computing threshold
if cut > TT*c
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