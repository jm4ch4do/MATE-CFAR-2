function [  ] = pea_cdf_plot( )
%PEA_CDF_PLOT plots examples of CDF Pearson.
%---------------------------
%
%INICIATING VALUES-----------------------------------------------------
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data
%
x1=0.01:0.01:5;
[m,n] = size(x1);
YMatrix1 = zeros(m,n);
YMatrix1(1,:)= pea_cdf(x1, 1);
YMatrix1(2,:)= pea_cdf(x1, 2);
YMatrix1(3,:)= pea_cdf(x1, 3);
YMatrix1(4,:)= pea_cdf(x1, 4);
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
%grid;
%
% Create multiple lines using matrix input to plot
plot1 = plot(x1,YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','g =  1');
set(plot1(2),'DisplayName','g =  2');
set(plot1(3),'DisplayName','g =  3');
set(plot1(4),'DisplayName','g =  4');
%
% Create xlabel
xlabel('magnitudes of the variable');
%
% Create ylabel
ylabel({'CDF Pearson','(g)'});
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