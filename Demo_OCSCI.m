% AN EFFICIENT K-SCA BASED UNERDETERMINED CHANNEL IDENTIFICATION
% ALGORITHM FOR ONLINE APPLICATIONS
% Ehsan Eqlimi and Dr.Bahador Makkiabadi
% Department of Medical Physics & Biomedical Engineering,Tehran University
% of Medical Physiscs (TUMS),Tehran,Iran
% E-mails: Eghlimi@razi.tums.ac.ir, b-makkiabadi@tums.ac.ir
clc
clear
close all
% The number of sensors
m=4; 
% The number of sources
n=7; 
% The number of active sources 
k=m-1; 
% The number of time samples
T=2000; 
% To generate a mixing matrix based on k-SCA assumation (A1)
Th=0.1;Iter=700; 
% Mixing matrix generation 
[A,kr]=FnMixingMarixGen(m,n,Th,Iter);
% Source matrix generation
S=FnSourceGenr(n,m,T,k);
% Mixed data generation
X=A*S;
% The number of recieved data
WS=3;
% Underdetemined blind identification based on OCSCI method (online)
Ahat=FnOnContSel_CI(X,m,n,WS);
% Optimally Ordering
A=(FnNormalizer(abs(A)));
Ahat=(FnNormalizer(abs(Ahat)));
[Ahat,M]=Fnnearest2(Ahat,A);
% Error between the original mixing martxi (A) and estimated mixing
% matrix(Ahat)using BAS distance
A
Ahat
BAS=FnBiasedAnglesSum(Ahat,A);

