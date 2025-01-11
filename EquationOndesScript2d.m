% Script pour la solution des différences finies pour l'équation des
% ondes dans le cas instationnaire en 2d

% Initialisation
x1 = 0; x2 = 10; y1 = 0; y2 = 10; t0 = 0; T = 50; c = sqrt(8) / 8;
npts = 101; nptsT = 251;

% Condition initiale et conditions aux bords
%%% À COMPLÉTER: Définissez f1
f1 = @(x, y) sin(pi * x / 10) .* sin(pi * y / 10);
f2 = @(x, y) 0;

h1 = @(t, x) 0;
%%% À COMPLÉTER: Définissez h2, g1 et g2
h2 = @(t, x) 0;
g1 = @(t, y) 0;
g2 = @(t, y) 0;

% Calcul de la solution des différences finies pour l'équation des
% ondes dans le cas instationnaire en 2d avec un chronomètre
tic
%%% À COMPLÉTER: Appelez EquationOndesResolution2d pour définir u
u = EquationOndesResolution2d(c, t0, T, nptsT, x1, x2, y1, y2, npts, f1, f2, g1, g2, h1, h2);
chrono = toc;
fprintf('Chrono=%g\n',chrono)

% Définition des données nécessaires pour les graphiques
dt = (T - t0) / (nptsT - 1);
dx = (x2 - x1) / (npts - 1);
dy = (y2 - y1) / (npts - 1);
x = repmat(x1:dx:x2, npts, 1);
y = repmat((y1:dy:y2)', 1, npts);

% Affichage du graphique pour chaque temps considéré
for i = 1:nptsT
    uPlot = reshape(u(:, i), npts, npts);
    surf(x, y, uPlot);
    zlim([-1 1]);
    xlabel('x');
    ylabel('y');
    title(['Solution at t = ', num2str(t0 + (i - 1) * dt)]);
    pause(0.1);
end
% Musique de victoire!
load handel.mat
soundsc(y,Fs)