clear
close all
clc
tic

load('C:\Users\Britt\Dropbox (MIT)\Faridpur\Manuscripts\SoilKitPaper\Figures\DatasetForPaper.mat')

cutoff = 20;
%% find P(bin) = probability of getting a particular bin
P_bins = table;
P_bins.bin = unique(AllSeasons.As_Kit);
for n = 1:height(P_bins)
    P_bins.probBin(n) = sum(AllSeasons.As_Kit == P_bins.bin(n))/height(AllSeasons);
end

%% find P(bin | As > cutoff)
for n = 1:height(P_bins) 
    bin = P_bins.bin(n);
    P_bins.probBinGivenAsGreaterThanCutoff(n) = sum(AllSeasons.As_Kit == bin & ...
        AllSeasons.As_XRF > cutoff)/sum(AllSeasons.As_XRF > cutoff);
end

%% find P(bin | As <= cutoff)
for n = 1:height(P_bins) 
    bin = P_bins.bin(n);
    P_bins.probBinGivenAsLessThanCutoff(n) = sum(AllSeasons.As_Kit == bin & ...
        AllSeasons.As_XRF <= cutoff)/sum(AllSeasons.As_XRF <= cutoff);
end

%% find P(As > cutoff | bin)
for n = 1:height(P_bins) 
    bin = P_bins.bin(n);
    P_bins.probAsGreaterThanCutoffGivenBin(n) = sum(AllSeasons.As_Kit == bin & ...
        AllSeasons.As_XRF > cutoff)/sum(AllSeasons.As_Kit == bin);
end

%% find P(As > cutoff)
probAsGreaterThanCutoff = sum(AllSeasons.As_XRF > cutoff)/height(AllSeasons);

%% find P(As <= cutoff)
probAsLessThanCutoff = sum(AllSeasons.As_XRF <= cutoff)/height(AllSeasons);

%% find P(bin1, bin2 | As > cutoff)
% P(bin1, bin2 | arsenic is > cutoff) = P(bin1 | arsenic is > cutoff) * P(bin2 | arsenic is > cutoff)
% we only have to do this for all the combinations, because the probability
% is the same for any permutation of that combination
Bin = nchoosek_wr(P_bins.bin,12);
P_binCombos = array2table(Bin);
for n = 1:height(P_binCombos)
    P_binCombos.probBinsGivenAsGreaterThanCutoff(n) = P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin1(n))*...
        P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin2(n))*...
        P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin3(n))*...
        P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin4(n))*...
        P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin5(n))*...
        P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin6(n))*...
        P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin7(n))*...
        P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin8(n))*...
        P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin9(n))*...
        P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin10(n))*...
        P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin11(n))*...
        P_bins.probBinGivenAsGreaterThanCutoff(P_bins.bin == P_binCombos.Bin12(n));
end

for n = 1:height(P_binCombos)
    P_binCombos.probBinsGivenAsLessThanCutoff(n) = P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin1(n))*...
        P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin2(n))*...
        P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin3(n))*...
        P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin4(n))*...
        P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin5(n))*...
        P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin6(n))*...
        P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin7(n))*...
        P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin8(n))*...
        P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin9(n))*...
        P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin10(n))*...
        P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin11(n))*...
        P_bins.probBinGivenAsLessThanCutoff(P_bins.bin == P_binCombos.Bin12(n));
end

%% find P(bin1, bin2,...bin12)
% P(bin1, bin2, bin3, ..., bin12) = P(bin1, ..., bin12 | arsenic > cutoff) * P(arsenic > cutoff) + P(bin1, ..., bin12 | arsenic <= cutoff) * P(arsenic <= cutoff)
P_binCombos.probBinsOverall = P_binCombos.probBinsGivenAsGreaterThanCutoff*probAsGreaterThanCutoff +...
    P_binCombos.probBinsGivenAsLessThanCutoff*probAsLessThanCutoff;

%% find P(arsenic > cutoff | bin1, bin2, ... bin12)
% P(arsenic > cutoff | bin1, bin2, ... bin12) = P(bin1, ..., bin12 | arsenic > cutoff) * P(arsenic > cutoff) / P(bin1, ..., bin12)
P_binCombos.probAsGreaterThanCutoffAndBins = (P_binCombos.probBinsGivenAsGreaterThanCutoff*...
    probAsGreaterThanCutoff);

P_binCombos.probAsGreaterThanCutoffGivenBins = P_binCombos.probAsGreaterThanCutoffAndBins./...
    P_binCombos.probBinsOverall;

toc

%save('P_binCombos30.mat','P_binCombos')

%writetable(P_binCombos)







