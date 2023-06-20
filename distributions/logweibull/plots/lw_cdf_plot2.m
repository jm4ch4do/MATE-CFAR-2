function [  ] = lw_cdf_plot2( )
%LW_CDF_PLOT plots examples of CDF Log-Weibull 2.
%---------------------------
%
%INICIATING VALUES-----------------------------------------------------
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data
%
x1=1:0.01:5;
[m,n] = size(x1);
YMatrix1 = zeros(m,n);
YMatrix1(1,:)= lw_cdf(x1,1 ,  1);
YMatrix1(2,:)= lw_cdf(x1,2 ,  1);
YMatrix1(3,:)= lw_cdf(x1,5 ,  1);
YMatrix1(4,:)= lw_cdf(x1,10,  1);
%
%----------------------------------------------------------------------
%CREATING FIGURE-------------------------------------------------------
%
% Create figure
figure1 = figure;
%
% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
%
% Create multiple lines using matrix input to plot
plot1 = plot(x1,YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','a =  1  b=   1');
set(plot1(2),'DisplayName','a =  2  b=   1');
set(plot1(3),'DisplayName','a =  5  b=   1');
set(plot1(4),'DisplayName','a = 10  b=   1');
%
% Create xlabel
xlabel('magnitudes of the variable');
%
% Create ylabel
ylabel({'CDF Log-Weibull','(a,b)'});
%
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','NorthEast');
%

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