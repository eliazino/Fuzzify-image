function [ outim ] = unfuzzify( img,nrow,ncol )
%UNFUZZIFY Summary of this function goes here
%   Detailed explanation goes here
imsi = size(img);
startRow = 1;
startCol = 2;
figure;
if numel(imsi) > 2
    outim = img;
    while startRow <= imsi(1)
        while startCol <= imsi(2)
            imshow(uint8(outim));
            drawnow;
            r = find(nrow == startRow);
            c = find(ncol == startCol);
            outim(startRow,startCol,1) = img(r,c,1);
            outim(startRow,startCol,2) = img(r,c,2);
            outim(startRow,startCol,3) = img(r,c,3);
            startCol = startCol + 1;
        end
        startCol = 1;
        startRow = startRow + 1;
    end
else
    r = find(nrow == startRow);
    c = find(ncol == startCol);
    outim = zeros(imsi(1),imsi(2));
    while startRow <= imsi(1)
        while startCol <= imsi(2)
            outim(startRow,startCol) = img(r,c);
            startCol = startCol + 1;
        end
        startCol = 1;
        startRow = startRow + 1;
    end
end

end

