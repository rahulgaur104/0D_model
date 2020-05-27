# 0D_model
0-D(No spatial variation) model for a low temperature hydrogen plasma heated using Electron Cyclotron Resonance.  
This model is based on the paper by Samuel and Corr, the link to which is given below 
  
* [Low-pressure hydrogen plasmas explored using a global model, Plasma Sources Science and Technology, 2015](https://iopscience.iop.org/article/10.1088/0963-0252/25/1/015014/meta)  

There are many more papers that I had to use to create this code. I will update the list later.

## Steps to run the code  

* Clone the master branch onto your system  
* run ./0D_model/bin/initialize_single.m for a single processor  
* run ./0D_model/bin/initialize.m for multiple processors using MATLAB's parfor command

## Some information about the type of files  
* Ra_b.mat: where a and b are numbers denoting the index of the reaction(Read to the paper for more info). These files contains a table of the reaction constants with electron temperature for all the reactions between reaction number a and b.   
* Ra_b.m are the .m files which produce the corresponding .mat data files. These are only using during the precomputation stage. The code will run even if you remove all these files.  
* data*.mat contain the output of the code. The most recent output is contained in data7.mat.  
* initialize_single.m or initialize.m, depending on one's need to use multiple processors, initializes the variables before sending them to ./0D_model/src/mein_solve.m. After the simulation has converged the data can be stored into one of the data*.mat files.  
* ./0D_model/src/mein_solve.m contains 21 non-linear, first-order ODE's which are solved self consistently using ode15s solver until a steady state is reached
* ./0D_model/tests/data_visual.m is for visualizing the output from the ode solver 
* ./0D_model/tests/dominant_reactions.m is to visualize the rate constants or the rate of density change to find the dominant reactions.  
* ./0D_model/tests/press_var.m: One of the problems with model is that the steady-state-ideal-gas pressure is not equal to the vaccum chamber pressure. press_ver is find the scaling of the final pressure with the chamber pressure.  
