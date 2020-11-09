%DRAWARROW Draw an arrow.
%   DRAWARROW(XS,XE,FILLED,HSIZE,COLOR) draws an arrow from XS to
%   XE. The first two elements of XS,XE are interpreted as the
%   x- and y-positions. FILLED enabled and disabled head filling,
%   HSIZE scales the size of the head in [m], and COLOR is a
%   [r g b]-vector or a color string such as 'r' or 'g'.
%
%   H = DRAWARROW(...) return a column vector of handles to the
%   graphic objects of the arrow drawing.
%
%   See also DRAWREFERENCE, PLOT.

% v.1.1, 09.11.02, Kai Arras, ASL-EPFL


function h = drawarrow(x1,x2,filled,hsize,color)

% Constants
HEADANGLE = pi/9;   % default arrow head opening angle

% Compute all 3 points: head center, left and right
xs = x1(1); ys = x1(2); xe = x2(1); ye = x2(2);
phi = atan2(ye-ys,xe-xs);
xhl = xe+hsize*cos(phi+pi-HEADANGLE);
yhl = ye+hsize*sin(phi+pi-HEADANGLE);
xhr = xe+hsize*cos(phi+pi+HEADANGLE);
yhr = ye+hsize*sin(phi+pi+HEADANGLE);

% Plot arrow head using the fill command
if (filled == 1)
  xarrow = [xs xe xhl xhr xe xs];
  yarrow = [ys ye yhl yhr ye ys];
  h = fill(xarrow,yarrow,color);
  set(h,'EdgeColor',color);
else
  xarrow1 = [xs xe xhl];
  yarrow1 = [ys ye yhl];
  xarrow2 = [xhr xe];
  yarrow2 = [yhr ye];
  h = plot(xarrow1,yarrow1,'Color',color,xarrow2,yarrow2,'Color',color);
end;
