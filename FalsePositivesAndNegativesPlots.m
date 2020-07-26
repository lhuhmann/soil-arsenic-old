clear
close all
clc

load('P_binCombos20.mat');
P_binCombos20 = P_binCombos;
P_binCombos20.KitAverage = mean(P_binCombos20{:,1:12},2);

load('P_binCombos30.mat')
P_binCombos30 = P_binCombos;
P_binCombos30.KitAverage = mean(P_binCombos30{:,1:12},2);

load('P_binCombos40.mat')
P_binCombos40 = P_binCombos;
P_binCombos40.KitAverage = mean(P_binCombos40{:,1:12},2);

P_binCombos = [];

[Accuracy_20, DetermineInt_20] = ProbabilityMethod(P_binCombos20,20);
[Accuracy_30,DetermineInt_30] = ProbabilityMethod(P_binCombos30,30);
[Accuracy_40,DetermineInt_40] = ProbabilityMethod(P_binCombos40,40);

%% False negatives and false positives
figure('pos',[10 10 500 600])
hold on
plot(Accuracy_20.ProbabilityThreshold, Accuracy_20.PctFalseNeg*100,'-b')
plot(Accuracy_20.ProbabilityThreshold, Accuracy_20.PctFalsePos*100,'-r')
plot(Accuracy_20.ProbabilityThreshold, (Accuracy_20.PctFalseOverall)*100,'-k')
xlabel('Probability Threshold')
ylabel('Percent Incorrectly Classified')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 14)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 14)
hold off

figure('pos',[10 10 500 600])
hold on
plot(Accuracy_30.ProbabilityThreshold, Accuracy_30.PctFalseNeg*100,'-b','LineWidth',2)
plot(Accuracy_30.ProbabilityThreshold, Accuracy_30.PctFalsePos*100,'-r','LineWidth',2)
plot(Accuracy_30.ProbabilityThreshold, (Accuracy_30.PctFalseOverall)*100,'-k','LineWidth',2)
xlabel('Probability Threshold')
ylabel('Percent Incorrectly Classified')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
hold off

figure('pos',[10 10 500 600])
hold on
plot(Accuracy_40.ProbabilityThreshold, Accuracy_40.PctFalseNeg*100,'-b')
plot(Accuracy_40.ProbabilityThreshold, Accuracy_40.PctFalsePos*100,'-r')
plot(Accuracy_40.ProbabilityThreshold, (Accuracy_40.PctFalseOverall)*100,'-k')
xlabel('Probability Threshold')
ylabel('Percent Incorrectly Classified')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 14)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 14)
hold off