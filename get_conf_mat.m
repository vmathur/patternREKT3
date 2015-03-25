function [ conf ] = get_conf_mat(feature, mean, cv)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
conf = zeros(10,10);

for i = 1:length(feature)
    testpt = feature(1:2,i);
    est = micd_classify(testpt, mean, cv);
    actual = feature(3,i);
    
    if (actual == est)
        conf(actual,actual) = conf(actual,actual) + 1;
    else
        conf(actual,est) = conf(actual,est) + 1;
    end    
end

clear i

end

