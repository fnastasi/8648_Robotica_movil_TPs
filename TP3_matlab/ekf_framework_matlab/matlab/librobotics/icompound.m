%ICOMPOUND Inverse 2D relationship.
%   XJI = ICOMPOUND(XIJ) returns the inverted 2D transform XJI given
%   the relationship XIJ. All X's are 3x1-vectors, all angles within
%   [0..2pi[.
%
%   References:
%      R. Smith, M. Self, P. Cheeseman, "Estimating Uncertain Spatial
%      Relationships in Robotics," in Autonomous Robot Vehicles, I.J. 
%      Cox and G.T. Wilfong, Eds.: Springer-Verlag, 1990, pp. 167-193.
%
%   See also COMPOUND, JINV.

%   v.1.0, 16.12.00, Kai Arras, ASL-EPFL


function vji = icompound(vij);

xij = vij(1); yij = vij(2); phiij = vij(3);

vji(1,1) = -xij*cos(phiij) - yij*sin(phiij);
vji(2,1) =  xij*sin(phiij) - yij*cos(phiij);
phiji    = -phiij;

if phiji < 0, vji(3,1) = phiji + 2*pi;
elseif phiji >= 2*pi, vji(3,1) = phiji - 2*pi;
else vji(3,1) = phiji;
end;
