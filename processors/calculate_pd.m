function [ pd,pf,d ] = calculate_pd( x,p,w,g,T,tp,varargin)
% CALCULATE_PD Computes probability of detection (Pd)
% -------------------------------------------------------------------
%     x : data with clutter + targets                 (column vector)
%     p : number of processor to be used                    (1 value)
%     w : window size                                       (1 value)
%     g : guard cells                                       (1 value)
%     T : threshold multiplier                              (1 value)
%    tp : target profile where '1' indicates target         (1 value)
%  vara : other auxiliary parameters                            (row)
% -----   -----------------------------------------------------------
%    pd : detection probability                             (1 value)
%    pf : false alarm probability                           (1 value)
%     p : detection result                                  (1 value)
% -----   -------------------(example)-------------------------------
% x = lw_gen_sets( 1000,1,3);
% [ samples_t, tp ] = add_targets( x, 25, 2, 1 , 5,1);
% [ pd,pf,d ] = calculate_pd( samples_t,1,8,0,3,tp);
% ---------------------------(example)---------------------------------

% using the sliding function to perform detection
[m,n] = size(x);
varargin = cell2mat(varargin);
[ d ] = sliding_cfar( x,p,w,g,T,varargin );

% computing by comparing the detection result with the target profile
good_d =0; % good detection
bad_d = 0; % bad detection
good_nd = 0; % good not detection
bad_nd = 0; % bad not detection
for m_1 = 1:m
    if tp(m_1) == 1 && d(m_1) == 1
        good_d = good_d + 1;
    elseif tp(m_1) == 1 && d(m_1) == 0
        bad_d = bad_d + 1;
    elseif tp(m_1) == 0 && d(m_1) == 0
        good_nd = good_nd + 1;
    elseif tp(m_1) == 0 && d(m_1) == 1
        bad_nd = bad_nd + 1;
    end
end

pd = good_d/(good_d+bad_d);
pf = bad_nd/(good_nd+bad_nd);

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