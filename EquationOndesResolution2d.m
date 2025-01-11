function [u] = EquationOndesResolution2d(c,t0,T,nptsT,x1,x2,y1,y2,...
    npts,f1,f2,g1,g2,h1,h2)

% But:
% Calculer la solution des différences finies pour l'équation des ondes
% dans le cas instationnaire en 2d
% 
% Entrées:
% c est la vitesse de l'onde
% [t0,T] est l'intervalle en temps
% nptsT est le nombre de calculs en temps
% [x1,x2] est l'intervalle en x
% [y1,y2] est l'intervalle en y
% npts est le nombre de calculs en chaque composante spatiale
% f1=f1(x,y) est la condition initiale sur u
% f2=f2(x,y) est la condition initiale sur u_t
% g1=g1(t,y) et g2=g2(t,y) sont les conditions aux bords en x
% h1=h1(t,x) et h2=h2(t,x) sont les conditions aux bords en y
% 
% Sortie:
% u est la solution des différences finies pour l'équation des ondes
% dans le cas instationnaire en 2d

% Définition de données utiles

    dt = (T - t0) / (nptsT - 1);
    dx = (x2 - x1) / (npts - 1);
    dy = (y2 - y1) / (npts - 1);

    npts2 = npts^2; 

% Allocation de la mémoire pour u
    u = zeros(npts2, nptsT);

% Définition de la condition initiale
    x = repmat(x1:dx:x2, npts, 1);
    y = repmat((y1:dy:y2)', 1, npts);
    u(:, 1) = reshape(f1(x, y)', [], 1);
    u(:, 2) = reshape(f1(x, y)', [], 1) + dt * reshape(f2(x, y)', [], 1);

% Définition de la matrice et du vecteur pour le schéma des différences
% finies
%%% À COMPLÉTER: Appelez EquationOndesMatrice2d pour définir A
%%% À COMPLÉTER: Appelez EquationOndesVecteur2d pour définir F comme une
%%%              fonction de u
    A = EquationOndesMatrice2d(c, dt, dx, dy, npts);

% Définition des conditions aux bords
    iConnu = [1:npts, ... % Top
              npts2-npts+1:npts2, ... % Bottom
              1:npts:npts2, ... % Left
              npts:npts:npts2]; % Right
    iInconnu = setdiff(1:npts2, iConnu);

    
    for i = 2:nptsT-1
 %%% À COMPLÉTER: Définissez u(iInconnu,i+1). Attention: F est évalué
    %%% pour tous les u au temps considéré là où le calcul des
    %%% inconnues de u n'est effectué que aux inconnues
    %%%  iInconnu 
        F = EquationOndesVecteur2d(c, dt, dx, dy, npts, u(:, i));

        u(iInconnu, i+1) = A(iInconnu, iInconnu) * u(iInconnu, i) + F(iInconnu) - u(iInconnu, i-1);
    end
end
