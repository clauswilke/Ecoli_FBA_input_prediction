% The data here is taken from Noise1Replicate1.Rout and related files. But
% at first I did not calculate the test data and training data sizes, so I
% re-did the analysis and took these measurements from
% Noise1Replicate1a.Rout and related files. Plots are drawn from here.!!
close all
clear all
clc

load N1R
load N3R
load N5R

RepNoise1=[2447 1224 490];
RepNoise5=[2418 1209 484];

figure(1)
subplot(1,2,2) % Intentionally swapped 1,2 subplots.
plot(RepNoise1,N1(1:3,1)/2446,'ro-','LineWidth',3);
hold on
%plot(Rep,N3(1:3,1)/2400,'go-','LineWidth',2);
plot(RepNoise5,N5(1:3,1)/2418,'ko-','LineWidth',3);
plot(RepNoise1,N1(1:3,4)/2446,'r*--','LineWidth',3);
%plot(Rep,N3(1:3,4)/2400,'g*--','LineWidth',2);
plot(RepNoise5,N5(1:3,4)/2418,'k*--','LineWidth',3);%,title('Effects of Noise & Training data size'));
hold off

ylim([0,0.45]);
xlabel('Training Data Size (Observations)','FontSize',15);
ylabel('Misclassification Rate','FontSize',15);
set(gca,'fontsize',15);
set(gca,'box','off');
%set(gca,'XColor','white','YColor','white');
%set(gca,'Visible','off')
%legend('Joint Prediction (1% Noise)','Joint Prediction (5% Noise)','Joint Prediction (10% Noise)','Separate Prediction (1% Noise)','Separate Prediction (5% Noise)','Separate Prediction (10% Noise)');
h_legend=legend('Joint Prediction (1 C/N Contamination)','Joint Prediction (10 C/N Contamination)','Separate Prediction (1 C/N Contamination)','Separate Prediction (10 C/N Contamination)');
set(h_legend,'FontSize',15);
%print('-dpng','-r300','VaryingData')
%title('Effects of Varying Noise Levels','FontSize',36);
% plot(N1[2,1:4:4],'ro-',N3[2,1:4:4],'go-',N5[2,1:4:4],'ko-',title('Replicate2 (1200 observations)'));
% plot(N1[3,1:4:4],'ro-',N3[3,1:4:4],'go-',N5[3,1:4:4],'ko-',title('Replicate3 (480 observations)'));


NoiseLevel=[1 5 10];

%figure(2)
subplot(1,2,1)
semilogx(NoiseLevel,[N1(1,1)/2446,N3(1,1)/2430,N5(1,1)/2400],'ro-','LineWidth',3);
hold on
%semilogx(NoiseLevel,[N1(2,1),N3(2,1),N5(2,1)]/2400,'go-','LineWidth',2);
semilogx(NoiseLevel,[N1(3,1)/2446,N3(3,1)/2430,N5(3,1)/2400],'ko-','LineWidth',3);
semilogx(NoiseLevel,[N1(1,4)/2446,N3(1,4)/2430,N5(1,4)/2400],'r*--','LineWidth',3);
%semilogx(NoiseLevel,[N1(2,4),N3(2,4),N5(2,4)]/2400,'g*--','LineWidth',2);
semilogx(NoiseLevel,[N1(3,4)/2446,N3(3,4)/2430,N5(3,4)/2400],'k*--','LineWidth',3);
hold off
ylim([0,0.45]);
xlabel('Contamination Level (# C/N background sources)','FontSize',15);
ylabel('Misclassification Rate','FontSize',15);
set(gca,'fontsize',15);
set(gca,'box','off');
set(gca, 'XTick', [1 2 3 4 5 6 7 8 9 10]);
%set(gca,'XColor','white','YColor','white');
%set(gca,'Visible','off')
%legend('Joint Prediction (Training data=2400 observations)','Joint Prediction (Training data=1200 observations)','Joint Prediction (Training data=480 observations)','Separate Prediction (Training data=2400 observations)','Separate Prediction (Training data=1200 observations)','Separate Prediction (Training data=480 observations)');
h_legend=legend('Joint Prediction (~2400 observations)','Joint Prediction (~480 observations)','Separate Prediction (~2400 observations)','Separate Prediction (~480 observations)');
set(h_legend,'FontSize',15);
%print('-dpng','-r300','VaryingNoise')
%print('-dpdf','-r300','ContaData')

%title('Effects of Varying Sizes of Training Data','FontSize',36);