function [class] = get_micd_dis(test_pts, ms, sigmas)
    dists = zeros(10, 1);
    for i = 1:1:10
        dists(i, :) = (test_pts - ms(:,i)')*(sigmas(:, 2*i-1: 2*i)^-1)*(test_pts - ms(:,i)')'; 
    end
    [~, class] = min(dists);
end

