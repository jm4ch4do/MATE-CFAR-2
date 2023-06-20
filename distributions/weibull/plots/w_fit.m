function [  PDF, PDFe, CDFe, CDF, x, PDF_res,CDF_res,p_chi,p_ks,a,b] = w_fit( samples, max_i )
% W_GEN_COMPARE Compares a histogram from samples with the ideal PDF Weibull
% -------------------------------------------------------------------------------------------------
%     samples : set with clutter samples                                            (column vector)
%       max_i : maximum number of iterations in the search                                (1 value)
%       -------------------------------------------------------------------------------------------
%         PDF : probability density function theoretical                               (row vector)
%        PDFe : probability density function empirical                                 (row vector)
%         CDF : cumulative distribution function theoretical                           (row vector)
%        CDFe : cumulative distribution function empirical                             (row vector)
%           x : x axis for PDF and CDF plots                                           (row vector)
%     PDF_res : residuals between theoretical and empirical densities                  (row vector)
%     CDF_res : residuals between theoretical and empirical cumuliatives               (row vector)
%       p_chi : result of chi-squared goodnes of fittest                               (row vector)                         
%        p_ks : result of Kolmogorov-Smirnov goodness of fit test                      (row vector)
%           a : estimation of the scale parameter Weibull                                 (1 value)
%           b : estimation of the shape parameter Weibull                                 (1 value)
%------------   -------------------------(example)-------------------------------------------------
% [ samples ] = w_gen( 3000, 1, 1 );
% [ PDF, PDFe, CDFe, CDF, x, PDF_res,CDF_res, p_chi,p_ks,a,b] = w_fit( samples, 100 );
% ---------------------------------------(example)-------------------------------------------------

% --- initial
[m,n] = size(samples); 

% --- estimate parameters
[ a,b ] = w_estim_par( samples, max_i );

% --- suppressing negative estimations of the shape parameter (no relation between data and distribution)
if b < 0.0001
    b = 1;
    a = 1;
end

% --- find important percentiles
sorted = sort(samples);
the_99 = sorted(floor(99.5/100*m));
the_01 = sorted(ceil(01/100*m));

% --- PDF comparison
% computing observed values
step = (the_99-the_01)/100;
limit = the_99;
x = 0:step:limit;
[obs,x] = hist(samples,x);

% transforming amount of observed values into probability of observing values
n = floor((limit)/step + 1);
PDFe = zeros(1,n);
total = sum(obs);
for n_1 = 1:n
   PDFe(1,n_1) = ( obs(1,n_1)/total )   /step; % expression deduced from the histogram
end

% finding theoretical PDF
[ PDF ] = w_pdf( x, a, b);

% --- CDF comparison
% computing the cumulative histogram of the generated data
[m,n] = size(PDFe);
CDFe = zeros(1,n);
for n_1 = 1:n 
   for i = n_1:-1:1
       CDFe(1,n_1) = CDFe(1,n_1)+PDFe(1,i);
   end
end
CDFe = CDFe*step; 

% finding theoretical CDF
[ CDF ] = w_cdf( x, a,b);

% --- compute residuals
[ PDF_res ,res_pos, x_res_pos,res_neg, x_res_neg ] = pdf_residuals( PDF,PDFe,x );
PDF_res_x = sort(cat(2,x_res_pos,x_res_neg));

[ CDF_res ,res_pos, x_res_pos,res_neg, x_res_neg ] = pdf_residuals( CDF,CDFe,x );
CDF_res_x = sort(cat(2,x_res_pos,x_res_neg));

% --- chi-squared goodness of fit test

% computing observed values
[m,n] = size(samples);
x = 0:step:limit;
[M,N] = size(obs);  % the last value tends to be too high
obs(1,N)=obs(1,N-1); % so we force the last value to be equal to the previous one
x(1,1)= 0.00001; % making the first value different from 1
ideal= w_pdf(x, a, b);

% expected values for the ideal (theoretical) Weibull distribution
esp = ideal*m*step;

% computing variables requested for the MATLAB chi-2 function
n = (limit)/step + 1;
bins = 0:n-1;

% the last ´obs´ tends to be too high
obs(N:N) = esp(N:N);

% supression of the first values
obs(1:2) = esp(1:2);

% executing the Chi-2 function
[h,p_chi,st] = chi2gof(bins,'ctrs',bins,'frequency',obs,'expected',esp,'nparams',1);

% --- Kolmogorov-Smirnov goodness of fit test
    test(:,1) = sort(samples);
     % supression the first and last values
    [m,n] = size(test);
    test = test(3:(m-1),:);
    
    test(:,2) = (w_cdf((test(:,1))',a,b))';
    [ h, p_ks ] = kstest(test(:,1),'CDF',test);

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