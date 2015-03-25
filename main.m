load ./resources/feat.mat
% get means and variances
[m_32, v_32] = get_feature_meancovar(f32);
[m_2, v_2] = get_feature_meancovar(f2);
[m_8, v_8] = get_feature_meancovar(f8);
%% segment the features into classes.
% use the 32 one since it's the easiest (for now)
% returning mean and covariance of feature set 


% array of class
%[M ,class] = max(dist, [], 2);

        
%% part 3-2
% classify and generate the confusion matrices.

% the confusion matrix is defined as:
%      \ predicted class
%actual
%class

%% Some image code
%image = readim('resources/cloth.im');
%imagesc(image);
%colormap(gray);
%% Part 2 figures
% figure(1)
% subplot(3,1,1)
% aplot(f2)
% subplot(3,1,2)
% aplot(f8)
% subplot(3,1,3)
% aplot(f32)
% legend('cloth', 'cotton', 'grass', 'pigskin', 'wood', 'cork', 'paper', 'stone', 'raiffa', 'face')

conf = zeros(10,10);

for i = 1:length(f32t)
    testpt = f32t(1:2,i);
    est = micd_classify(testpt, f32means, f32covariances);
    actual = f32t(3,i);
    
    if (actual == est)
        conf(actual,actual) = conf(actual,actual) + 1;
    else
        conf(actual,est) = conf(actual,est) + 1;
    end    
end

clear i

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

prototypes = k_means(10, f32');
figure(50)
hold on
aplot(f32)
scatter(prototypes(:,1),prototypes(:,2), 'filled');
title('k-means cluster, k=10');
ylabel('x2')
xlabel('x1');
hold off
