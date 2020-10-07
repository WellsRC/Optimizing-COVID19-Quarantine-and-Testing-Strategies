function p = PDFavgIncubation(I,dt)
%PDFAVGINCUBATION Summary of this function goes here
%   Detailed explanation goes here
a=[698.941723121512];

p=(gamcdf(I+dt./2,a,8.29/a)-gamcdf(I-dt./2,a,8.29/a))./(gamcdf(21+dt./2,a,8.29/a)-gamcdf(1-dt./2,a,8.29/a));
end

