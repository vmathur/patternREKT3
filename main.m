load ./resources/feat.mat
% get means and variances
[m_32, cv_32] = get_feature_meancovar(f32);
[m_2, cv_2] = get_feature_meancovar(f2);
[m_8, cv_8] = get_feature_meancovar(f8);

%% Part 2 figures
% figure(1)
% subplot(3,1,1)
% aplot(f2)
% subplot(3,1,2)
% aplot(f8)
% subplot(3,1,3)
% aplot(f32)
% legend('cloth', 'cotton', 'grass', 'pigskin', 'wood', 'cork', 'paper', 'stone', 'raiffa', 'face')
% can't use legend with aplot

        
%% part 3
% classify and generate the confusion matrices.

conf_32 = get_conf_mat(f32t, m_32, cv_32);
conf_2 = get_conf_mat(f2t, m_2, cv_2);
conf_8 = get_conf_mat(f8t, m_8, cv_8);

% error
error_32 = conf_error(conf_32);
error_2 = conf_error(conf_2);
error_8 = conf_error(conf_8);

% 
%% part 4: seg! seeeeeeeeeeg!
imageSize = size(multim);
cimage = zeros(imageSize); 
for i=1:imageSize(1)
    for j=1:imageSize(2) 
        cimage(i,j) = micd_classify([multf8(i,j,1); multf8(i,j,2)],...
            m_8, cv_8);
    end
end

%we should NOT have any zeros in the output!
figure(40);
imagesc(multim);
hold on
title('Original composite image in imagesc');
hold off

labels = {'cloth', 'cotton', 'grass', 'pigskin', 'wood', 'cork', 'paper', 'stone', 'raiffa', 'face'};
figure(41);
imagesc(cimage);
colormap(jet(10));
hold on
title('Classified composite image in imagesc')
lcolorbar(labels);
hold off
%% part 5
prototypes = k_means(10, f32');
figure(50)
hold on
aplot(f32)
scatter(prototypes(:,1),prototypes(:,2), 'filled');
title('k-means cluster, k=10');
ylabel('x2')
xlabel('x1');
hold off
