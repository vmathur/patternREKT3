function [ class ] = micd_classify(test_pts, ms, sigmas )
    dists = zeros(10, 1);
    for i = 1:1:10
        dists(i, :) = (test_pts' - ms(:,i)')*(sigmas(:, 2*i-1: 2*i)^-1)*(test_pts' - ms(:,i)')'; 
    end
    [~, class] = min(dists);
% calll
% len = length(f32t);
% class = zeros(len, 1);
% for i= 1:1:len
%     class(i, :) = get_micd_dis(f32t(1:2, i)', m_32, v_32);
% end
end

