%CONCATMAP: Map a function over a list and concatenate using horzcat.
%
%   out = concatMap(f, list) maps a function f over a list and concatenates
%   the results. The function must take in one variable and return a list
%   (the list can be one element).
%
%   Examples
%   --------
%   list = [1, 2, 3];
%   concatmap(@(y) (y+3), list)
%
%   ans =
%
%        4     5     6
%
%   concatmap(@(k) ({k; k^2}), [1:5])
%
%   ans =
%
%       [1]    [2]    [3]    [ 4]    [ 5]
%       [1]    [4]    [9]    [16]    [25]

function out = concatmap(f, list)
  import functools.list.foldr

  switch length(list)
    case 0, out = [];
    case 1, out = f(list);
    otherwise
      % Follows Haskell convention: concatmap f =  foldr ((++) . f) []
      out = foldr(@(x, acc) horzcat(f(x), acc), [], list);
  end

end
