clc
close all
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Data Processing                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = xlsread('breast-cancer-wisconsin.xlsx'); % read excel data to a matrix
A(:,1) = []; % delete ID column 

C = A(:,10); % copy tag classes to another matrix
A(:,10) = []; % delete last column with classes' tags

C(C==2)=0; % convert benign class tag to 0
C(C==4)=1; % convert malignant class tag to 1

% normalize data to [0,1]
normA = A - min(A(:));
normA = normA ./ max(normA(:));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            10-Fold Cross Validation with K-Nearest Neighbor             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

indices = crossvalind('Kfold',C,10); % create indices for the 10-fold cross validation
cp = classperf(C); % initialize object to check the performance of the classifier

k=10; % number of nearest neighbors

% repeat classification for each fold 
for i = 1:10
    test = (indices == i); 
    train = ~test;
    model = fitcknn(normA(train,:),C(train,:),'NumNeighbors',k); %k nearest neighbors
    class = predict(model,normA(test,:));
    classperf(cp,class,test);
end

fprintf('10-Fold Cross Validation with %d-Nearest Neighbors\n', k);
fprintf('Accuracy: %f\n', 1 - cp.ErrorRate);
fprintf('Sensitivity: %f\n', cp.Sensitivity);
fprintf('Specificity: %f\n\n', cp.Specificity);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            10-Fold Cross Validation with Naive Nayes                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

indices = crossvalind('Kfold',C,10); %create indices for the 10-fold cross validation
cp = classperf(C); %initialize object to check the performance of the classifier

% repeat classification for each fold
for i = 1:10
    test = (indices == i); 
    train = ~test;
    model = fitcnb(normA(train,:),C(train,:));  %Gaussian distribution
%   model = fitcnb(normA(train,:),C(train,:),'DistributionNames','kernel'); %Kernel smoothing density estimate
    class = predict(model,normA(test,:));
    classperf(cp,class,test);
end
fprintf('10-Fold Cross Validation with Naive Bayes\n')
fprintf('Accuracy: %f\n', 1 - cp.ErrorRate);
fprintf('Sensitivity: %f\n', cp.Sensitivity);
fprintf('Specificity: %f\n\n', cp.Specificity);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         10-Fold Cross Validation with Support Vector Machines           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

indices = crossvalind('Kfold',C,10); %create indices for the 10-fold cross-validation
cp = classperf(C); %initialize object to check the performance of the classifier

% repeat classification for each fold
for i = 1:10
    test = (indices == i); 
    train = ~test;
    model = fitcsvm(normA(train,:),C(train,:)); %Linear kernel function
%   model = fitcsvm(normA(train,:),C(train,:),'KernelFunction','gaussian'); %Gaussian kernel function
    class = predict(model,normA(test,:));
    classperf(cp,class,test);
end

fprintf('K-Fold Cross Validation (k=10) with Support Vector Machines\n')
fprintf('Accuracy: %f\n', 1 - cp.ErrorRate);
fprintf('Sensitivity: %f\n', cp.Sensitivity);
fprintf('Specificity: %f\n\n', cp.Specificity);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             10-Fold Cross Validation with Decision Tree                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

indices = crossvalind('Kfold',C,10); %create indices for the 10-fold cross validation
cp = classperf(C); %initialize object to check the performance of the classifier

% repeat classification for each fold
for i = 1:10
    test = (indices == i); 
    train = ~test;
    model = fitctree(normA(train,:),C(train,:)); %Exact search
%   model = fitctree(normA(train,:),C(train,:),'AlgorithmForCategorical','PCA'); %PCA search
    class = predict(model,normA(test,:));
    classperf(cp,class,test);
end

fprintf('10-Fold Cross Validation with Decision Trees\n')
fprintf('Accuracy: %f\n', 1 - cp.ErrorRate);
fprintf('Sensitivity: %f\n', cp.Sensitivity);
fprintf('Specificity: %f\n\n', cp.Specificity);
