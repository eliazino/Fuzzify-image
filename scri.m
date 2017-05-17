x = ones(1,100);
y = 0:5:600;
start = 1;
while start <= numel(y)
    j = y(start);
    x(1,start) = mod(j,7);
    start = start+ 1;
end
plot(y,x)