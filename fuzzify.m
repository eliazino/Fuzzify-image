function [ outim,nrow,ncol ] = fuzzify( img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
imsi = size(img);
ncol = randperm(imsi(2));
nrow = randperm(imsi(1));
startRow = 1;
startCol = 2;
if numel(imsi) > 2
    outim = zeros(imsi(1),imsi(2),3);
    while startRow <= imsi(1)
        while startCol <= imsi(2)
            outim(startRow,startCol,1) = uint8(img(nrow(startRow),ncol(startCol),1));
            outim(startRow,startCol,2) = uint8(img(nrow(startRow),ncol(startCol),2));
            outim(startRow,startCol,3) = uint8(img(nrow(startRow),ncol(startCol),3));
            startCol = startCol + 1;
        end
        startCol = 1;
        startRow = startRow + 1;
    end
else
    outim = zeros(imsi(1),imsi(2));
    while startRow <= imsi(1)
        while startCol <= imsi(2)
            outim(startRow,startCol) = uint8(img(nrow(startRow),ncol(startCol)));
            startCol = startCol + 1;
        end
        startCol = 1;
        startRow = startRow + 1;
    end
end
end

