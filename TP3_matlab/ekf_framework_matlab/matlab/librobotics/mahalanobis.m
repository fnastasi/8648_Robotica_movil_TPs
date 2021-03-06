%MAHALANOBIS Calculate the Mahalanobis distance.
%   D = MAHALANOBIS(V,S) returns the chi square distributed Mahalanobis
%   distance given the innovation vector X and the innovation covariance
%   matrix S.

% v.1.0, Nov.2003, Kai Arras, CAS-KTH


function d = mahalanobis(v,S);

d = v'*inv(S)*v;