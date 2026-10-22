function similarity = cosine_similarity(A, B)
  similarity = dot(A, B) / (norm(A, 2) * norm(B, 2));
end

