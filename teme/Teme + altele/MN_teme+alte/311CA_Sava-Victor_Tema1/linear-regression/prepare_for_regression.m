function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [m, n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n + 1);

  for i = 1 : m
    diff = 0; % variable used for normalizing index when 'semi-furnished'
              % or 'unfurnished' or 'furnished' is encountered

    for j = 1 : n
      if (strcmp(InitialMatrix{i, j}, "no"))
        FeatureMatrix(i, j + diff) = 0;
      elseif (strcmp(InitialMatrix{i, j}, "yes"))
        FeatureMatrix(i, j + diff) = 1;
      elseif (strcmp(InitialMatrix{i, j}, "semi-furnished"))
        FeatureMatrix(i, j + diff) = 1;
        FeatureMatrix(i, j + diff + 1) = 0;
        j += 1;
        diff = 1;
      elseif (strcmp(InitialMatrix{i, j}, "unfurnished"))
        FeatureMatrix(i, j + diff) = 0;
        FeatureMatrix(i, j + diff + 1) = 1;
        j += 1;
        diff = 1;
      elseif (strcmp(InitialMatrix{i, j}, "furnished"))
        FeatureMatrix(i, j + diff) = 0;
        FeatureMatrix(i, j + diff + 1) = 0;
        j += 1;
        diff = 1;
      else
        FeatureMatrix(i, j + diff) = str2num(InitialMatrix{i, j});
      endif
    endfor
  endfor
end
