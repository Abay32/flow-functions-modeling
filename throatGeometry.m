function [throatShapeFactor , throatGeometry] = throatGeometry(squareThroatPercentage ,...
    tiangularThroatPercentage , maxShapeFactorOfTriangularThroats ,...
    minShapeFactorOfTriangularThroats , delta , etha)
%%
% This function detrmines the percentage of each pore geometry (square, 
% triangular and circular geometries) and shape factor for each element.

global n_t
%% Triangular Section
x = rand(n_t,1);

if maxShapeFactorOfTriangularThroats > sqrt(3)/36
    maxShapeFactorOfTriangularThroats = sqrt(3)/36;
end

tiangularThroatPercentage = tiangularThroatPercentage/100;

tri_throat = x > (1 - tiangularThroatPercentage);
throatGeometry = zeros(n_t,1);
throatShapeFactor = zeros(n_t,1);
throatGeometry(tri_throat) = 2; % 2 stands for triangular geometry

throatShapeFactor(tri_throat) = weibull(maxShapeFactorOfTriangularThroats ,...
    minShapeFactorOfTriangularThroats , delta , etha , rand(length(nonzeros(tri_throat)),1)); 

fprintf('%2.2f Percentage of the pores are Triangular.\n' ,size(nonzeros(tri_throat),1)/n_t*100);

%% Square Section
squareThroatPercentage = squareThroatPercentage / 100;
squ_throat = x <= (1 - tiangularThroatPercentage)  & x > (1 - tiangularThroatPercentage - squareThroatPercentage);
throatGeometry(squ_throat) = 3; % 3 stands for sqular geometry
throatShapeFactor(squ_throat) = 0.0625;
fprintf('%2.2f Percentage of the pores are Square.\n' ,size(nonzeros(squ_throat),1)/n_t*100);

%% Circular Section
fprintf('%2.2f Percentage of the pores are Circular.\n' ,...
    (n_t - size(nonzeros(squ_throat),1)-size(nonzeros(tri_throat),1))/n_t*100);
for ii=1:length(throatGeometry)
    if throatGeometry(ii) == 0
        throatGeometry(ii) = 1; % 1 stands for circular geometry
        throatShapeFactor(ii) = 1/(4*pi);
    end
end
fprintf('\n')
