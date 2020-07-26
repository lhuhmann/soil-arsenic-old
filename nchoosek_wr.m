function [choices, ways] = nchoosek_wr(nn, kk, force_set)
%NCHOOSEK_WR like NCHOOSEK but (unordered) choices with replacement
%
% For integer nn:
%
%     num_ways = nchoosek_wr(nn, kk);
%
% returns the number of ways of picking kk items from a set of size nn. kk can
% be a vector and the answer for each setting is returned in a vector.
%
%
% Alternatively nn can be a vector of items:
%
%     [choices, ways] = nchoosek_wr(nn, kk[, force_set=1])
%
% This gives all possible sets of length-kk choices from vector nn. kk must be a
% scalar. The ways output gives the number of ways of ordering each set.
%
% This style of function overloading (copied from Matlab's nchoosek) is
% dangerous. Note what happens if your 'set' is coincidentally of length 1. This
% problem is rife in Matlab code. You can avoid bugs caused by this "feature" by
% setting the optional third force_set argument to be non-zero. This forces the
% first argument, nn, to be interpreted as a set, even if nn is a single
% non-negative integer.
%
% SEE ALSO: NCHOOSEK, NCHOOSEK_OWR

% Iain Murray, February 2009

if ~exist('force_set', 'var')
    force_set = 0;
end

is_nonneg_integer = @(x) isscalar(x) && (x >= 0) && (round(x) == x);

if (~force_set) && is_nonneg_integer(nn)
    % Find the number of unique unordered sets of size kk, chosen with
    % replacement from nn items
    choices = nchoosek(nn + kk - 1, kk); % Note: equal to 1 for kk=0
    if nargout > 1
        error('There is only a second output argument when returning a set of choices.');
    end
elseif isvector(nn)
    if ~is_nonneg_integer(kk)
        error('kk must be a non-negative integer when returning choices from set nn');
    end
    % Find the actual unique unordered sets of size kk, chosen with replacement
    % from the items in nn. Also find the number of ways of ordering each set.
    choices = nchoosek_wr_helper(nn(:)', kk)';
    if nargout > 1
        ways = find_ways(choices);
    end
else
    error('nn must be a non-negative integer or a vector');
end


function choices = nchoosek_wr_helper(nn, kk)

if kk == 0
    % There is one possible set of no items, the empty set
    choices = zeros(0, 1);
elseif kk == 1
    % This special case isn't needed for correctness, but greatly helps speed
    choices = nn;
else
    % Otherwise pick one item and recursively choose all the rest
    num_items = length(nn);
    %num_choices = nchoosek(num_items + kk - 1, kk);
    num_choices = prod(num_items:(num_items + kk - 1)) / prod(1:kk);
    choices = zeros(kk, num_choices);
    last = 0;
    for k1 = 1:num_items
        ck1 = nchoosek_wr_helper(nn(k1:end), kk - 1);
        first = last + 1;
        last = last + size(ck1, 2);
        choices(1, first:last) = nn(k1);
        choices(2:end, first:last) = ck1;
    end
end


function ways = find_ways(cc)

% Find groups of identical choices, by locating "dividers" between the groups
[dividers, dummy, ids] = unique(cc(:, 1:end-1) ~= cc(:, 2:end), 'rows');

% Add in virtual dividers at beginning and end
nn = size(dividers, 1);
dividers = [ones(nn, 1), dividers, ones(nn, 1)];

% Only the pattern of dividers matters for the number of ways of arranging
% So we will find the number of ways for each divider pattern
dividers_ways = zeros(nn, 1);

% For ease of vectorization we will deal with patterns that have the same number
% of dividers together.
num_dividers = sum(dividers, 2);
max_dividers = size(dividers, 2);
for nd = 2:max_dividers
    idx = find(num_dividers == nd);
    % This cryptic line gives the locations of dividers.
    div_loc = reshape(nonzeros(bsxfun(@times, 1:max_dividers, dividers(idx, :))'), nd, length(idx))';
    div_sz = div_loc(:, end:-1:2) - div_loc(:, end-1:-1:1);
    dividers_ways(idx) = factorial(size(cc, 2)) ./ prod(factorial(div_sz), 2);
end

% Write out the final answer
ways = dividers_ways(ids);
