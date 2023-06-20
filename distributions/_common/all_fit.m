function [ selected,mean_PDF_res ] = all_fit( samples )
% ALL_GEN_COMPARE Compares a histogram from samples with the ideal PDF for all distributions
% -------------------------------------------------------------------------------------------------
%     samples : amount of samples in the set                                        (column vector)
%       max_i : maximum number of iterations in the search                                (1 value)
%       -------------------------------------------------------------------------------------------
%         PDF : probability density function theoretical                               (row vector)
%        PDFe : probability density function empirical                                 (row vector)
%         CDF : cumulative distribution function theoretical                           (row vector)
%        CDFe : cumulative distribution function empirical                             (row vector)
%           x : x axis for PDF and CDF plots                                           (row vector)
%     PDF_res : residuals between theoretical and empirical densities                  (row vector)
%     CDF_res : residuals between theoretical and empirical cumuliatives               (row vector)
%   PDF_res_x : x axis for 'PDF_res'                                                   (row vector)
%   CDF_res_x : x axis for 'CDF_res'                                                   (row vector)
%       p_chi : result of chi-squared goodnes of fittest                               (row vector)                         
%        p_ks : result of Kolmogorov-Smirnov goodness of fit test                      (row vector)
%           A : estimation of the first parameter                                         (1 value)
%           B : estimation of the second parameter                                        (1 value)
%------------   -------------------------(example)-------------------------------------------------
% [ samples ] = w_gen( 3000, 1, 1.1 );
% [ selected, mean_PDF_res] = all_fit( samples );
% ---------------------------------------(example)-------------------------------------------------

% executing the fit for every distribution
[ PDF01, PDFe01, CDFe01, CDF01, x01, PDF_res01,CDF_res01, p_chi01,p_ks01,A01] = exp_fit( samples );
[ PDF02, PDFe02, CDFe02, CDF02, x02, PDF_res02,CDF_res02, p_chi02,p_ks02,A02,B02] = gam_fit( samples );
[ PDF03, PDFe03, CDFe03, CDF03, x03, PDF_res03,CDF_res03, p_chi03,p_ks03,A03,B03] = ig_fit( samples );
[ PDF04, PDFe04, CDFe04, CDF04, x04, PDF_res04,CDF_res04, p_chi04,p_ks04,A04,B04] = igm_fit( samples );
[ PDF05, PDFe05, CDFe05, CDF05, x05, PDF_res05,CDF_res05, p_chi05,p_ks05,A05,B05] = k_fit( samples );
[ PDF06, PDFe06, CDFe06, CDF06, x06, PDF_res06,CDF_res06, p_chi06,p_ks06,A06,B06] = k2_fit( samples );
[ PDF07, PDFe07, CDFe07, CDF07, x07, PDF_res07,CDF_res07, p_chi07,p_ks07,A07,B07] = ln_fit( samples );
[ PDF08, PDFe08, CDFe08, CDF08, x08, PDF_res08,CDF_res08, p_chi08,p_ks08,A08,B08] = lom_fit( samples );
[ PDF09, PDFe09, CDFe09, CDF09, x09, PDF_res09,CDF_res09, p_chi09,p_ks09,A09,B09] = par_fit( samples );
[ PDF10, PDFe10, CDFe10, CDF10, x10, PDF_res10,CDF_res10, p_chi10,p_ks10,A10] = pea_fit( samples );
[ PDF11, PDFe11, CDFe11, CDF11, x11, PDF_res11,CDF_res11, p_chi11,p_ks11,A11] = ray_fit( samples );
[ PDF12, PDFe12, CDFe12, CDF12, x12, PDF_res12,CDF_res12, p_chi12,p_ks12,A12,B12] = gamr_fit( samples );
[ PDF13, PDFe13, CDFe13, CDF13, x13, PDF_res13,CDF_res13, p_chi13,p_ks13,A13,B13] = w_fit( samples, 100 );

% name of distributions
name = char('exp','gam','ig','igm','k','k2','ln','lom','par','pea','ray','gamr','w');
name = cellstr(name);

mean_PDF_res = cat(2,mean(abs(PDF_res01)),mean(abs(PDF_res02)),mean(abs(PDF_res03)),mean(abs(PDF_res04)),mean(abs(PDF_res05)),mean(abs(PDF_res06)),mean(abs(PDF_res07)),mean(abs(PDF_res08)),mean(abs(PDF_res09)),mean(abs(PDF_res10)),mean(abs(PDF_res11)),mean(abs(PDF_res12)),mean(abs(PDF_res13)));
[mean_PDF_res,index] = sort(mean_PDF_res);
[m,n] = size(mean_PDF_res);

for n_1 = 1:n
    selected(n_1) = name(index(n_1));
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