function [ means, variances] = get_feature_meancovar( feature )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%preallocate for speed
means = zeros(2,10);
variances = zeros(2,20);

% 10 images. These numbers, coincidentally, also correspond to what class
% the data point belongs to.
    for i=1:10
            % 16 blocks per image
            %1-16, 17-32
            %lower bound: (16*i-15)
            %upper bound: (16*i)

            data = feature(1:2,16*i-15:16*i);                  
            %these should each be a 2x16 matrix.

            %our mean/covariance thing takes a COLUMN of ROW VECTORS. rough.
            [m,S] = getMeanCovar(data');
            means(1:2,i) = m';
            variances(1:2,i*2-1:i*2) = S;

            clear data testdata m S
    end

    clear i

end

