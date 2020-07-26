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

%% Average kit As vs true soil As
figure('pos',[10 100 1000 500])
hold on
%scatter(P_binCombos20.KitAverage,P_binCombos20.probAsGreaterThanCutoffGivenBins,20,'b','filled')
%scatter(DetermineInt_20.mean_As_XRF,DetermineInt_20.mean_As_Kit,20,'k','filled')
scatter(DetermineInt_20.mean_As_XRF(DetermineInt_20.mean_As_XRF>=20&DetermineInt_20.mean_As_Kit>=0.0877,:),...
    DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_XRF>=20&DetermineInt_20.mean_As_Kit>=0.0877,:),20,[112 173 71]./255,'filled')
scatter(DetermineInt_20.mean_As_XRF(DetermineInt_20.mean_As_XRF<20&DetermineInt_20.mean_As_Kit<0.0877,:),...
    DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_XRF<20&DetermineInt_20.mean_As_Kit<0.0877,:),20,[112 173 71]./255,'filled')
scatter(DetermineInt_20.mean_As_XRF(DetermineInt_20.mean_As_XRF>=20&DetermineInt_20.mean_As_Kit<0.0877,:),...
    DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_XRF>=20&DetermineInt_20.mean_As_Kit<0.0877,:),20,[227 91 73]./255,'filled')
scatter(DetermineInt_20.mean_As_XRF(DetermineInt_20.mean_As_XRF<20&DetermineInt_20.mean_As_Kit>=0.0877,:),...
    DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_XRF<20&DetermineInt_20.mean_As_Kit>=0.0877,:),20,[227 91 73]./255,'filled')
plot([20 20], [0 .4],'--k','LineWidth',2)
plot([0 80],[0.0877 0.0877],'--k','LineWidth',2)
xlabel('Average XRF As (mg/kg)')
ylabel('Average Kit As As (mg/L)')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 18)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 18)
hold off

figure('pos',[10 100 1000 500])
hold on
%scatter(P_binCombos30.KitAverage,P_binCombos30.probAsGreaterThanCutoffGivenBins,20,'b','filled')
%scatter(DetermineInt_30.mean_As_XRF,DetermineInt_30.mean_As_Kit,20,'k','filled')
scatter(DetermineInt_30.mean_As_XRF(DetermineInt_30.mean_As_XRF>=30&DetermineInt_30.mean_As_Kit>=0.1291,:),...
    DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_XRF>=30&DetermineInt_30.mean_As_Kit>=0.1291,:),30,[112 173 71]./255,'filled')
scatter(DetermineInt_30.mean_As_XRF(DetermineInt_30.mean_As_XRF<30&DetermineInt_30.mean_As_Kit<0.1291,:),...
    DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_XRF<30&DetermineInt_30.mean_As_Kit<0.1291,:),30,[112 173 71]./255,'filled')
scatter(DetermineInt_30.mean_As_XRF(DetermineInt_30.mean_As_XRF>=30&DetermineInt_30.mean_As_Kit<0.1291,:),...
    DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_XRF>=30&DetermineInt_30.mean_As_Kit<0.1291,:),30,[227 91 73]./255,'filled')
scatter(DetermineInt_30.mean_As_XRF(DetermineInt_30.mean_As_XRF<30&DetermineInt_30.mean_As_Kit>=0.1291,:),...
    DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_XRF<30&DetermineInt_30.mean_As_Kit>=0.1291,:),30,[227 91 73]./255,'filled')
plot([30 30], [0 .4],'--k','LineWidth',2)
plot([0 80],[0.1291 0.1291],'--k','LineWidth',2)
xlabel('Average XRF As (mg/kg)')
ylabel('Average Kit As As (mg/L)')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 18)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 18)
hold off

figure('pos',[10 100 1000 500])
hold on
%scatter(P_binCombos40.KitAverage,P_binCombos40.probAsGreaterThanCutoffGivenBins,20,'b','filled')
%scatter(DetermineInt_40.mean_As_XRF,DetermineInt_40.mean_As_Kit,20,'k','filled')
scatter(DetermineInt_40.mean_As_XRF(DetermineInt_40.mean_As_XRF>=40&DetermineInt_40.mean_As_Kit>=0.1291,:),...
    DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_XRF>=40&DetermineInt_40.mean_As_Kit>=0.1291,:),40,[112 173 71]./255,'filled')
scatter(DetermineInt_40.mean_As_XRF(DetermineInt_40.mean_As_XRF<40&DetermineInt_40.mean_As_Kit<0.1705,:),...
    DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_XRF<40&DetermineInt_40.mean_As_Kit<0.1705,:),40,[112 173 71]./255,'filled')
scatter(DetermineInt_40.mean_As_XRF(DetermineInt_40.mean_As_XRF>=40&DetermineInt_40.mean_As_Kit<0.1705,:),...
    DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_XRF>=40&DetermineInt_40.mean_As_Kit<0.1705,:),40,[227 91 73]./255,'filled')
scatter(DetermineInt_40.mean_As_XRF(DetermineInt_40.mean_As_XRF<40&DetermineInt_40.mean_As_Kit>=0.1705,:),...
    DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_XRF<40&DetermineInt_40.mean_As_Kit>=0.1705,:),40,[227 91 73]./255,'filled')
plot([40 40], [0 .4],'--k','LineWidth',2)
plot([0 80],[0.1705 0.1705],'--k','LineWidth',2)
xlabel('Average XRF As (mg/kg)')
ylabel('Average Kit As As (mg/L)')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 18)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 18)
hold off
%% Probabilities vs true soil As
figure('pos',[10 100 1000 500])
hold on
%scatter(P_binCombos20.KitAverage,P_binCombos20.probAsGreaterThanCutoffGivenBins,20,'b','filled')
scatter(DetermineInt_20.mean_As_XRF,DetermineInt_20.probAsGreaterThanCutoff,20,'k','filled')
scatter(DetermineInt_20.mean_As_XRF(DetermineInt_20.mean_As_XRF>=20&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),...
    DetermineInt_20.probAsGreaterThanCutoff(DetermineInt_20.mean_As_XRF>=20&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),20,[112 173 71]./255,'filled')
scatter(DetermineInt_20.mean_As_XRF(DetermineInt_20.mean_As_XRF<20&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),...
    DetermineInt_20.probAsGreaterThanCutoff(DetermineInt_20.mean_As_XRF<20&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),20,[112 173 71]./255,'filled')
scatter(DetermineInt_20.mean_As_XRF(DetermineInt_20.mean_As_XRF<20&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),...
    DetermineInt_20.probAsGreaterThanCutoff(DetermineInt_20.mean_As_XRF<20&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),20,[227 91 73]./255,'filled')
scatter(DetermineInt_20.mean_As_XRF(DetermineInt_20.mean_As_XRF>=20&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),...
    DetermineInt_20.probAsGreaterThanCutoff(DetermineInt_20.mean_As_XRF>=20&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),20,[227 91 73]./255,'filled')
plot([20 20], [0 1],'--k','LineWidth',2)
plot([0 80],[0.19 0.19],'--k','LineWidth',2)
xlabel('Average XRF As (mg/kg)')
ylabel('Probability >20 mg/kg soil As')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 18)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 18)
hold off

figure('pos',[10 100 1000 500])
hold on
%scatter(P_binCombos30.KitAverage,P_binCombos30.probAsGreaterThanCutoffGivenBins,20,'b','filled')
%scatter(DetermineInt_30.mean_As_XRF,DetermineInt_30.probAsGreaterThanCutoff,20,'k','filled')
scatter(DetermineInt_30.mean_As_XRF(DetermineInt_30.mean_As_XRF>=30&DetermineInt_30.probAsGreaterThanCutoff>=0.15,:),...
    DetermineInt_30.probAsGreaterThanCutoff(DetermineInt_30.mean_As_XRF>=30&DetermineInt_30.probAsGreaterThanCutoff>=0.15,:),30,[112 173 71]./255,'filled')
scatter(DetermineInt_30.mean_As_XRF(DetermineInt_30.mean_As_XRF<30&DetermineInt_30.probAsGreaterThanCutoff<0.15,:),...
    DetermineInt_30.probAsGreaterThanCutoff(DetermineInt_30.mean_As_XRF<30&DetermineInt_30.probAsGreaterThanCutoff<0.15,:),30,[112 173 71]./255,'filled')
scatter(DetermineInt_30.mean_As_XRF(DetermineInt_30.mean_As_XRF<30&DetermineInt_30.probAsGreaterThanCutoff>=0.15,:),...
    DetermineInt_30.probAsGreaterThanCutoff(DetermineInt_30.mean_As_XRF<30&DetermineInt_30.probAsGreaterThanCutoff>=0.15,:),30,[227 91 73]./255,'filled')
scatter(DetermineInt_30.mean_As_XRF(DetermineInt_30.mean_As_XRF>=30&DetermineInt_30.probAsGreaterThanCutoff<0.15,:),...
    DetermineInt_30.probAsGreaterThanCutoff(DetermineInt_30.mean_As_XRF>=30&DetermineInt_30.probAsGreaterThanCutoff<0.15,:),30,[227 91 73]./255,'filled')
plot([30 30], [0 1],'--k','LineWidth',2)
plot([0 80],[0.15 0.15],'--k','LineWidth',2)
xlabel('Average XRF As (mg/kg)')
ylabel('Probability >30 mg/kg soil As')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 18)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 18)
hold off

figure('pos',[10 100 1000 500])
hold on
%scatter(P_binCombos40.KitAverage,P_binCombos40.probAsGreaterThanCutoffGivenBins,20,'b','filled')
%scatter(DetermineInt_40.mean_As_XRF,DetermineInt_40.probAsGreaterThanCutoff,20,'k','filled')
scatter(DetermineInt_40.mean_As_XRF(DetermineInt_40.mean_As_XRF>=40&DetermineInt_40.probAsGreaterThanCutoff>=0.82,:),...
    DetermineInt_40.probAsGreaterThanCutoff(DetermineInt_40.mean_As_XRF>=40&DetermineInt_40.probAsGreaterThanCutoff>=0.82,:),40,[112 173 71]./255,'filled')
scatter(DetermineInt_40.mean_As_XRF(DetermineInt_40.mean_As_XRF<40&DetermineInt_40.probAsGreaterThanCutoff<0.82,:),...
    DetermineInt_40.probAsGreaterThanCutoff(DetermineInt_40.mean_As_XRF<40&DetermineInt_40.probAsGreaterThanCutoff<0.82,:),40,[112 173 71]./255,'filled')
scatter(DetermineInt_40.mean_As_XRF(DetermineInt_40.mean_As_XRF<40&DetermineInt_40.probAsGreaterThanCutoff>=0.82,:),...
    DetermineInt_40.probAsGreaterThanCutoff(DetermineInt_40.mean_As_XRF<40&DetermineInt_40.probAsGreaterThanCutoff>=0.82,:),40,[227 91 73]./255,'filled')
scatter(DetermineInt_40.mean_As_XRF(DetermineInt_40.mean_As_XRF>=40&DetermineInt_40.probAsGreaterThanCutoff<0.82,:),...
    DetermineInt_40.probAsGreaterThanCutoff(DetermineInt_40.mean_As_XRF>=40&DetermineInt_40.probAsGreaterThanCutoff<0.82,:),40,[227 91 73]./255,'filled')
plot([40 40], [0 1],'--k','LineWidth',2)
plot([0 80],[0.82 0.82],'--k','LineWidth',2)
xlabel('Average XRF As (mg/kg)')
ylabel('Probability >40 mg/kg soil As')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 18)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 18)
hold off
%% Probabilities vs average kit As
figure('pos',[10 100 1000 500])
hold on
%scatter(P_binCombos20.KitAverage,P_binCombos20.probAsGreaterThanCutoffGivenBins,20,'b','filled')
%scatter(DetermineInt_20.mean_As_Kit,DetermineInt_20.probAsGreaterThanCutoff,20,'k','filled')
scatter(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit>=.0877&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),...
    DetermineInt_20.probAsGreaterThanCutoff(DetermineInt_20.mean_As_Kit>=.0877&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),20,[112 173 71]./255,'filled')
scatter(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit<.0877&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),...
    DetermineInt_20.probAsGreaterThanCutoff(DetermineInt_20.mean_As_Kit<.0877&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),20,[112 173 71]./255,'filled')
scatter(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit>=.0877&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),...
    DetermineInt_20.probAsGreaterThanCutoff(DetermineInt_20.mean_As_Kit>=.0877&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),20,[227 91 73]./255,'filled')
scatter(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit<.0877&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),...
    DetermineInt_20.probAsGreaterThanCutoff(DetermineInt_20.mean_As_Kit<.0877&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),20,[227 91 73]./255,'filled')
plot([0.0877 0.0877], [0 1],'--k','LineWidth',2)
plot([0 .4],[0.19 0.19],'--k','LineWidth',2)
xlabel('Average Kit As (mg/L)')
ylabel('Probability >20 mg/kg soil As')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 18)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 18)
hold off
BothAgreeIntervene = size(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit>=.0877&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),1);
BothAgreeDontIntervene = size(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit<.0877&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),1);
DisagreeTop = size(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit>=.0877&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),1);
DisagreeBottom = size(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit<.0877&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),1);

BayesRecommendsFor = BothAgreeIntervene + DisagreeBottom;
BayesRecommendsAgainst = BothAgreeDontIntervene + DisagreeTop;

BothAgreeIntervene = size(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit>=.0877&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),1)/BayesRecommendsFor;
BothAgreeDontIntervene = size(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit<.0877&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),1)/BayesRecommendsAgainst;
DisagreeTop = size(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit>=.0877&DetermineInt_20.probAsGreaterThanCutoff<0.19,:),1)/BayesRecommendsAgainst;
DisagreeBottom = size(DetermineInt_20.mean_As_Kit(DetermineInt_20.mean_As_Kit<.0877&DetermineInt_20.probAsGreaterThanCutoff>=0.19,:),1)/BayesRecommendsFor;

figure('pos',[10 100 1000 500])
hold on
%scatter(P_binCombos30.KitAverage,P_binCombos30.probAsGreaterThanCutoffGivenBins,20,'b','filled')
%scatter(DetermineInt_30.mean_As_Kit,DetermineInt_30.probAsGreaterThanCutoff,20,'k','filled')
scatter(DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_Kit>=.1291&DetermineInt_30.probAsGreaterThanCutoff>=0.15,:),...
    DetermineInt_30.probAsGreaterThanCutoff(DetermineInt_30.mean_As_Kit>=.1291&DetermineInt_30.probAsGreaterThanCutoff>=0.15,:),30,[112 173 71]./255,'filled')
scatter(DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_Kit<.1291&DetermineInt_30.probAsGreaterThanCutoff<0.15,:),...
    DetermineInt_30.probAsGreaterThanCutoff(DetermineInt_30.mean_As_Kit<.1291&DetermineInt_30.probAsGreaterThanCutoff<0.15,:),30,[112 173 71]./255,'filled')
scatter(DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_Kit>=.1291&DetermineInt_30.probAsGreaterThanCutoff<0.15,:),...
    DetermineInt_30.probAsGreaterThanCutoff(DetermineInt_30.mean_As_Kit>=.1291&DetermineInt_30.probAsGreaterThanCutoff<0.15,:),30,[227 91 73]./255,'filled')
scatter(DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_Kit<.1291&DetermineInt_30.probAsGreaterThanCutoff>=0.15,:),...
    DetermineInt_30.probAsGreaterThanCutoff(DetermineInt_30.mean_As_Kit<.1291&DetermineInt_30.probAsGreaterThanCutoff>=0.15,:),30,[227 91 73]./255,'filled')
plot([0.1291 0.1291], [0 1],'--k','LineWidth',2)
plot([0 .4],[0.15 0.15],'--k','LineWidth',2)
xlabel('Average Kit As (mg/L)')
ylabel('Probability >30 mg/kg soil As')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 18)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 18)
hold off
BothAgreeIntervene = size(DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_Kit>=.1291&DetermineInt_30.probAsGreaterThanCutoff>=0.15,:),1);
BothAgreeDontIntervene = size(DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_Kit<.1291&DetermineInt_30.probAsGreaterThanCutoff<0.15,:),1);
DisagreeTop = size(DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_Kit>=.1291&DetermineInt_30.probAsGreaterThanCutoff<0.15,:),1);
DisagreeBottom = size(DetermineInt_30.mean_As_Kit(DetermineInt_30.mean_As_Kit<.1291&DetermineInt_30.probAsGreaterThanCutoff>=0.15,:),1);

BayesRecommendsFor = BothAgreeIntervene + DisagreeBottom;
BayesRecommendsAgainst = BothAgreeDontIntervene + DisagreeTop;

BothAgreeIntervene = BothAgreeIntervene/BayesRecommendsFor;
BothAgreeDontIntervene = BothAgreeDontIntervene/BayesRecommendsAgainst;
DisagreeTop = DisagreeTop/BayesRecommendsAgainst;
DisagreeBottom = DisagreeBottom/BayesRecommendsFor;

figure('pos',[10 100 1000 500])
hold on
%scatter(P_binCombos40.KitAverage,P_binCombos40.probAsGreaterThanCutoffGivenBins,20,'b','filled')
%scatter(DetermineInt_40.mean_As_Kit,DetermineInt_40.probAsGreaterThanCutoff,20,'k','filled')
scatter(DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_Kit>=.1705&DetermineInt_40.probAsGreaterThanCutoff>=0.82,:),...
    DetermineInt_40.probAsGreaterThanCutoff(DetermineInt_40.mean_As_Kit>=.1705&DetermineInt_40.probAsGreaterThanCutoff>=0.82,:),40,[112 173 71]./255,'filled')
scatter(DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_Kit<.1705&DetermineInt_40.probAsGreaterThanCutoff<0.82,:),...
    DetermineInt_40.probAsGreaterThanCutoff(DetermineInt_40.mean_As_Kit<.1705&DetermineInt_40.probAsGreaterThanCutoff<0.82,:),40,[112 173 71]./255,'filled')
scatter(DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_Kit>=.1705&DetermineInt_40.probAsGreaterThanCutoff<0.82,:),...
    DetermineInt_40.probAsGreaterThanCutoff(DetermineInt_40.mean_As_Kit>=.1705&DetermineInt_40.probAsGreaterThanCutoff<0.82,:),40,[227 91 73]./255,'filled')
scatter(DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_Kit<.1705&DetermineInt_40.probAsGreaterThanCutoff>=0.82,:),...
    DetermineInt_40.probAsGreaterThanCutoff(DetermineInt_40.mean_As_Kit<.1705&DetermineInt_40.probAsGreaterThanCutoff>=0.82,:),40,[227 91 73]./255,'filled')
plot([0.1705 0.1705], [0 1],'--k','LineWidth',2)
plot([0 .4],[0.82 0.82],'--k','LineWidth',2)
xlabel('Average Kit As (mg/L)')
ylabel('Probability >40 mg/kg soil As')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 18)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 18)
hold off
BothAgreeIntervene = size(DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_Kit>=.1705&DetermineInt_40.probAsGreaterThanCutoff>=0.82,:),1);
BothAgreeDontIntervene = size(DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_Kit<.1705&DetermineInt_40.probAsGreaterThanCutoff<0.82,:),1);
DisagreeTop = size(DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_Kit>=.1705&DetermineInt_40.probAsGreaterThanCutoff<0.82,:),1);
DisagreeBottom = size(DetermineInt_40.mean_As_Kit(DetermineInt_40.mean_As_Kit<.1705&DetermineInt_40.probAsGreaterThanCutoff>=0.82,:),1);

BayesRecommendsFor = BothAgreeIntervene + DisagreeBottom;
BayesRecommendsAgainst = BothAgreeDontIntervene + DisagreeTop;

BothAgreeIntervene = BothAgreeIntervene/BayesRecommendsFor;
BothAgreeDontIntervene = BothAgreeDontIntervene/BayesRecommendsAgainst;
DisagreeTop = DisagreeTop/BayesRecommendsAgainst;
DisagreeBottom = DisagreeBottom/BayesRecommendsFor;