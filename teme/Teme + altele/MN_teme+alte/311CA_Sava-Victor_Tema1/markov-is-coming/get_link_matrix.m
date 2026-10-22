function [Link] = get_link_matrix (Labyrinth)
  Adj = get_adjacency_matrix(Labyrinth);
  % divide each row by the sum of the elements of the row
  Link = sparse(bsxfun(@rdivide, Adj, sum(Adj, 2))); % check README for source
end

