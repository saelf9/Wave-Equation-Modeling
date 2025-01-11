function [F] = EquationOndesVecteur2d(c, dt, dx, dy, m, u)
% But:
% Calculer la matrice des différences finies pour l'équation des ondes
% dans le cas instationnaire en 2d
% 
% Entrées:
% c est la vitesse de l'onde
% dt est le pas de temps
% dx est le pas en x
% dy est le pas en y
% m est la taille de la tuile en forme de carré
% u est la solution discrète pour l'équation des ondes dans le cas
% instationnaire en 2d
% 
% Sortie:
% F est le vecteur des différences finies pour l'équation des ondes
% dans le cas instationnaire en 2d

% Définition des constantes pertinentes

    r1 = c^2 * dt^2 / dy^2;
    r2 = c^2 * dt^2 / dx^2;
% Définition de données utiles
    m2 = m^2; 

% Définition du vecteur F
    F = zeros(m2, 1);

%%% À COMPLÉTER: 
    F(1:m) = r1 * u(1:m);                % Top boundary
    F(end-m+1:end) = r1 * u(end-m+1:end); % Bottom boundary
    F(1:m:end) = r2 * u(1:m:end);         % Left boundary
    F(m:m:end) = r2 * u(m:m:end);         % Right boundary
    
    F = sparse(F);

end
