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