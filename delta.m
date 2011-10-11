function res = delta( class, type)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

a = find(class == type);

if length(a) > (length(class) - length(a))
    res = 1;
else
    res = 0;
end

end

