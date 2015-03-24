%image = readim('resources/cloth.im');
%imagesc(image);
%colormap(gray);

load ./resources/feat.mat

% segment the features into classes.
% use the 32 one since it's the easiest (for now)

feature = f32;
featureTest = f32t;





figure(1)
subplot(3,1,1)
aplot(f2)
subplot(3,1,2)
aplot(f8)
subplot(3,1,3)
aplot(f32)
legend('cloth', 'cotton', 'grass', 'pigskin', 'wood', 'cork', 'paper', 'stone', 'raiffa', 'face')