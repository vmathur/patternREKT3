function [ error ] = conf_error( mat )
total = sum(mat(:));
diagonal = sum(diag(mat));
error = (total-diagonal)/total;
end

