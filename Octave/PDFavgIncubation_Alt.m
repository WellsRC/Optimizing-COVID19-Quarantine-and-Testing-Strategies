function p = PDFavgIncubation_Alt(I,dt)
%PDFAVGINCUBATION Summary of this function goes here
%   Detailed explanation goes here
a=[46.9481];

p=(gamcdf(I+dt./2,a,5.2/a)-gamcdf(I-dt./2,a,5.2/a))./(gamcdf(21+dt./2,a,5.2/a)-gamcdf(1-dt./2,a,5.2/a));
end

