function [ d ] = sliding_cfar( x,p,w,g,T,varargin)
% SLIDING_CFAR Moves sliding window using selected processor
% ----------------------------------------------------------
%     x : data with clutter + targets            (2D matrix)
%     p : number of processor to be used           (1 value)
%     w : window size                              (1 value)
%     g : guard cells (pare)                       (1 value)
%     T : threshold multiplier                         (row)
%  vara : auxiliary parameters                         (row)
% -----   --------------------------------------------------
%     d : result of detection                    (2D matrix)
% -----   ---------------(example)--------------------------
% x = lw_gen_sets( 1000,[ 1 1 1 ],[ 3 3 3 ]);
% [ d ] = sliding_cfar( x,'ca',8,0,[2 2 2] );
% -----------------------(example)--------------------------

% handling the extra parameters
[m,n] = size(varargin);
aux = 1;
aux2 = 1;
aux3 = 1;
aux4 = 1;
aux5 = 1;
aux6 = 1;
if n >= 1
    aux = cell2mat(varargin(1));
end
if n >= 2
    aux2 = cell2mat(varargin(2));
end
if n >= 3
    aux3 = cell2mat(varargin(3));
end
if n >= 4
    aux4 = cell2mat(varargin(4));
end
if n >= 5
    aux5 = cell2mat(varargin(5));
end
if n >= 6
    aux6 = cell2mat(varargin(6));
end

% starting
[m,n] = size(x);
d = zeros(m,n);

% force 'w' to have parity 'even'
w = force_even(w);

% setting sliding window and cell under test (cut)
for n_1 = 1:n
   % adding samples for the begining to the end and viceversa
   xx = cat(1,x(m-w/2+1:m,n_1),x(:,n_1),x(1:w/2,n_1));
   for m_1 = w/2+1:m+w/2
       s =  cat(1,xx(m_1-w/2:m_1-1,1),xx(m_1+1:m_1+w/2,1)); % s = sliding window
       cut = xx(m_1,1); % cut = cell under test
       
       % selection of the processor to be used
       if p(1) == 1 || strcmpi(p, 'CA')
           d(m_1-w/2,n_1) = ca_cfar(s,cut,g,T(1,n_1));
       elseif p(1) == 2 || strcmpi(p, 'OS')
           d(m_1-w/2,n_1) = os_cfar(s,cut,g,T(1,n_1));
       elseif p(1) == 3 || strcmpi(p, 'GO')
           d(m_1-w/2,n_1) = go_cfar(s,cut,g,T(1,n_1));
       elseif p(1) == 4 || strcmpi(p, 'SO')
           d(m_1-w/2,n_1) = so_cfar(s,cut,g,T(1,n_1));
       elseif p(1) == 5 || strcmpi(p, 'OR')
           d(m_1-w/2,n_1) = or_cfar(s,cut,g,T(1,n_1),aux(1,n_1));
       elseif p(1) == 6 || strcmpi(p, 'AND')
           d(m_1-w/2,n_1) = and_cfar(s,cut,g,T(1,n_1),aux(1,n_1));
       elseif p(1) == 7 || strcmpi(p, 'ML')
           d(m_1-w/2,n_1) = ml_cfar(s,cut,g,T(1,n_1));
       elseif p(1) == 8 || strcmpi(p, 'MX')
           d(m_1-w/2,n_1) = mx_cfar(s,cut,g,T(1,n_1),aux(1,n_1));
       elseif p(1) == 9 || strcmpi(p, 'MN')
           d(m_1-w/2,n_1) = mn_cfar(s,cut,g,T(1,n_1),aux(1,n_1));
       elseif p(1) == 10 || strcmpi(p, 'CMLD')
           d(m_1-w/2,n_1) = cmld_cfar(s,cut,g,T(1,n_1),aux(1,n_1));
       elseif p(1) == 11 || strcmpi(p, 'TM')
           d(m_1-w/2,n_1) = tm_cfar(s,cut,g,T(1,n_1),aux(1,n_1));
       elseif p(1) == 12 || strcmpi(p, 'AC')
           d(m_1-w/2,n_1) = ac_cfar(s,cut,g,T(1,n_1),aux(1,n_1));
       elseif p(1) == 13 || strcmpi(p, 'MS')
           d(m_1-w/2,n_1) = ms_cfar(s,cut,g,T(1,n_1),aux(1,n_1));
       elseif p(1) == 14 || strcmpi(p, 'VI')
           d(m_1-w/2,n_1) = vi_cfar(s,cut,g,T(1,n_1),aux(1,n_1),aux2(1,n_1),aux3(1,n_1),aux4(1,n_1),aux5(1,n_1));
       elseif p(1) == 15 || strcmpi(p, 'VIm')
           d(m_1-w/2,n_1) = vim_cfar(s,cut,g,T(1,n_1),aux(1,n_1),aux2(1,n_1),aux3(1,n_1),aux4(1,n_1),aux5(1,n_1),aux6(1,n_1));
       elseif p(1) == 16 || strcmpi(p, 'EXC')
           d(m_1-w/2,n_1) = exc_cfar(s,cut,g,T(1,n_1),aux(1,n_1));
       elseif p(1) == 17 || strcmpi(p, 'DT')
           d(m_1-w/2,n_1) = dt_cfar(s,cut,g,T(1,n_1),aux(1,n_1));
       elseif p(1) == 18 || strcmpi(p, 'IS')
           d(m_1-w/2,n_1) = is_cfar(s,cut,g,T(1,n_1),aux(1,n_1),aux2(1,n_1));
       else
           d(m_1-w/2,n_1) = ca_cfar(s,cut,g,T(1,n_1));
       end
   end
end


end

function [ y ] = force_even( x )
% FORCE_EVEN forces a number have parity even
% -----------------------------------------------------------------
%   x : value with unknown parity                         (1 value)
% ---   -----------------------------------------------------------
%   y : value with parity                                 (1 value)
% ---   --------------------(example)------------------------------
% [ y ] = force_even( 3 );
% [ y ] = force_even( 1.4 );
% --------------------------(example)------------------------------

y = roundn(abs(x),0);
if roundn(y/2,0) ~= y/2 % if parity is none
    y = y+1;
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