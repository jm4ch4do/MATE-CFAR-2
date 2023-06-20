function [ T ] = find_T( x,p,w,g,T_ini,T_end,pfd,error, varargin )
% FIND_T Finds threshold (T) for a requested Pf and 2D vectors using Monte Carlo simulations
% ------------------------------------------------------------
%     x : data with clutter + targets              (2D matrix)
%     p : processor to be used                       (1 value)
%     w : window size                                (1 value)
%     g : guard cells                                (1 value)
% T_ini : minimum T                                  (1 value)
% T_end : maximum T                                  (1 value)
%   pfd : design false alarm probability             (1 value)
% error : percentage error allowed  in the search    (1 value)
%  vara : other auxiliary parameters for the processor   (row)
% -----   ----------------------------------------------------
%     T : found T value                                  (row)
% -----   ----------------(example)---------------------------
% x = lw_gen_sets( 1000,[ 1 1 1 ],[ 3 3 3 ]);
% [ T ] = find_T( x,'ca',8,0,1,50,0.01,1 );
% ------------------------(example)---------------------------

% initial conditions
max_i = 40; % maximum iterations in the search for T
[m,n]= size (x);
error_magnitud = (error/100)*pfd; % turns the percentage into a value
varargin = cell2mat(varargin);

% --- Looping the columns which contain a group of samples
for n_1 = 1:n
    % extracting the desired column
    xx = x(:,n_1);
    e_pf = 0; % starting estimated pf for current iteration
    lim_inf = T_ini; % lower value for binary search
    lim_sup = T_end; % upper value for binary search
    c=0; % counter for iterations
    diference = 1000; % initial diference between design Pf and obtained Pf

    % performs iterations for selected column until getting small error
    while abs(diference)>error_magnitud
        TT = (lim_inf+lim_sup)/2 % choosing a new T value
        
        [ e_pf ] = calculate_pf( xx,p,w,g,TT, varargin ); % computing obtained Pf
        %e_pf % for tracking the progress in command line
        diference = e_pf-pfd % computes the commited error
        if diference > 0 % if the difference is >0 the results need to get higher
            lim_inf = TT;
        else
            lim_sup = TT;
        end
        
        % stoping criteria
        if c == max_i
            break;
        else
            c=c+1; % increasing iteration counter
        end
    end
    T(1,n_1) = TT;
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