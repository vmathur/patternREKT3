%image = readim('resources/cloth.im');
%imagesc(image);
%colormap(gray);

load ./resources/feat.mat

% segment the features into classes.
% use the 32 one since it's the easiest (for now)

feature = f32;
featureTest = f32t;

%preallocate for speed
means = zeros(2,10);
testMeans = means;
variances = zeros(2,20);
testVariances = variances;
datapoints = feature(1:2,1:160);
testDatapoints = feature(1:3,1:160); % using a different format so we have class info bound to our test data.

% 10 images. These numbers, coincidentally, also correspond to what class
% the data point belongs to.
for i=1:10
        count = 0;
        % 16 blocks per image
        %1-16, 17-32
        %lower bound: (16*i-15)
        %upper bound: (16*i)
        
        data = feature(1:2,16*i-15:16*i);              
        testdata = featureTest(1:2,16*i-15:16*i);      
        %these should each be a 2x16 matrix.
        
        %our mean/covariance thing takes a COLUMN of ROW VECTORS. rough.
        [m,S] = getMeanCovar(data');
        means(1:2,i) = m';
        variances(1:2,i*2-1:i*2) = S;
        
        [m,S] = getMeanCovar(testdata');
        testMeans(1:2,i) = m';
        testVariances(1:2,i*2-1:i*2) = S;   

end

clear i data testdata m S
        





figure(1)
subplot(3,1,1)
aplot(f2)
subplot(3,1,2)
aplot(f8)
subplot(3,1,3)
aplot(f32)
%legend('cloth', 'cotton', 'grass', 'pigskin', 'wood', 'cork', 'paper', 'stone', 'raiffa', 'face')
% can't use legend with aplot

%%part 4: seg! seeeeeeeeeeg!
imageSize = size(multim);
cimage = zeros(imageSize); 
for i=1:imageSize(1)
    for j=1:imageSize(2) 
        cimage(i,j) = micd_classify([multf8(i,j,1); multf8(i,j,2)],...
            f8means, f8covariances);
               
        %gurnses' micd signature!
        %micd_classify(testpoint,means,covariances)
    end
end

%we should NOT have any zeros in the output!
figure(40)
imagesc(multim)
title('Original composite image in imagesc')
figure(41)
imagesc(cimage)
title('Classified composite image in imagesc')


