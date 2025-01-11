function [A] = EquationOndesMatrice2d(c,dt,dx,dy,m)

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
% 
% Sortie:
% A est la matrice des différences finies pour l'équation des ondes
% dans le cas instationnaire en 2d

% Définition des constantes pertinentes

    r1 = c^2 * dt^2 / dy^2;
    r2 = c^2 * dt^2 / dx^2;
    d = -2 * (r1 + r2) + 2;
% Définition de données utiles
    m2 = m^2; 
    m1 = m2 - m;

% Définition des diagonales non nulles de la matrice A
    D = diag(d * ones(m2, 1));
    
% Off-diagonals
    r2vec = r2 * ones(m2 - 1, 1);
    r2vec(m:m:end) = 0; 
    R2haut = diag(r2vec, 1);
%%% À COMPLÉTER: Définissez R2bas, la diagonale en dessous de la principale
    R2bas = diag(r2vec, -1);

    r1vec = r1 * ones(m1, 1);
%%% À COMPLÉTER: Définissez R1haut, la diagonale m fois au dessus de la
%%%              principale
    R1haut = diag(r1vec, m);
    R1bas = diag(r1vec, -m);

% Définition de la matrice A
%%% À COMPLÉTER: Définissez la matrice A
    A = D + R2haut + R2bas + R1haut + R1bas;
    A = sparse(A); 
end
