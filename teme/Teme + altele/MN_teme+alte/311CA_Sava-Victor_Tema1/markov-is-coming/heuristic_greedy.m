function [path] = heuristic_greedy (start_position, probabilities, Adj)
  path(1) = start_position;
  visited = sparse(1, length(probabilities));
  visited(start_position) = 1;

  while isempty(path) == 0
    pos = path(end);

    if (pos == length(probabilities) - 1)
      break;
    endif

    % find index of neighbours of pos
    neighbor_idx = (Adj(pos, :) == 1);
    unvisited = not(visited);

    % find index of unvisited neighbours
    unvisited_neighbors = find(neighbor_idx == unvisited & neighbor_idx == 1);

    if (isempty(unvisited_neighbors) == 1)
      path(end) = [];
      continue;
    endif

    % find unvisited neighbour with highest probability
    [~, idx_max] = max(probabilities(unvisited_neighbors));
    neigh = unvisited_neighbors(idx_max);

    visited(neigh) = 1;
    path(end + 1) = neigh;
  endwhile
end

