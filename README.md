## Project Description
This repository contains the MATLAB implementation for the numerical solution of the 2D wave equation as part of the "MAT-2910 Analyse numérique pour l'ingénieur" course (Autumn 2024). The project focuses on applying finite difference methods to approximate the solution to the wave equation. It also investigates the behavior of the solution under boundary conditions and the stability criteria (CFL condition).

### Problem:
The project aims to solve the wave equation given by:
$$ u_{tt} = c^2(u_{xx} + u_{yy}) $$
with specified initial and boundary conditions, and numerical methods to approximate the solution.

The solution is computed using finite difference methods, specifically focusing on:
- 2D grid discretization
- Time-stepping to approximate the solution at each timestep
- Ensuring stability via the CFL condition

### Contents:
1. **MATLAB Scripts and Functions:**
   - `EquationOndesMatrice2d.m`: Matrix-based approach for the wave equation.
   - `EquationOndesVecteur2d.m`: Vector-based approach for the wave equation.
   - `EquationOndesResolution2d.m`: Resolution of the wave equation using the finite difference method.
   - `EquationOndesScript2d.m`: Main script to run the numerical simulation and plot results.

2. **Project Report (Word or LaTeX format):**
   - The report includes explanations on the methods used, the finite difference approximation, the stability analysis (CFL condition), and a discussion on the results.

3. **Additional Files:**
   - `README.md`: This file, providing an overview of the project.
   - Compressed folder (`equipeXYZ.zip`), containing all scripts and the report for submission.

## Setup Instructions

### Requirements:
- MATLAB (recommended version R2020b or later)
- MATLAB functions for solving linear systems (e.g., `diag()`, `linsolve()`)
- A basic understanding of numerical methods and finite difference schemes.

### Running the Code:
To run the simulation and generate the results, follow these steps:
1. Download the repository or unzip the provided `equipeXYZ.zip` file.
2. Open MATLAB and navigate to the folder containing the MATLAB files.
3. Run the main script:
   ```matlab
   EquationOndesScript2d.m
The script will execute the wave equation simulation and generate a figure for the results.
Report:
The detailed explanation of the methods, the condition of stability (CFL), and other mathematical derivations are available in the project report. The report must be read in conjunction with the MATLAB scripts for full understanding.

Key Questions Addressed in the Proje
