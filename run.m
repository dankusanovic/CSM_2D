%Clean the workspace
clc;
clear; 
close all; 

%Include FEM Libraries
addpath(genpath(pwd));
path(path);

%Prints Welcome Message
fprintf('COMPUTATIONAL SOLID AND STRUCTURAL MECHANICS\n');
fprintf('Universidad Tecnica Federico Santa Maria\n');
fprintf('Departamento de Obras Civiles\n');

%TODO: Specify path to load file
modelpath ='/path/to/file.txt';

%TODO: Parse the file located at modelpath
