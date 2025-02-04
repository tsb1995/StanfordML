function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% Code to find better C and sigma


sampleVec = [.01 .03 .1 .3 1 3 10 30];
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
predictions = svmPredict(model,Xval);
error = mean(double(predictions ~= yval));
for i = 1:8
  for j = 1:8
    tempC = sampleVec(i);
    tempSigma = sampleVec(j);
    tempModel= svmTrain(X, y, tempC, @(x1, x2) gaussianKernel(x1, x2, tempSigma));
    tempPredictions = svmPredict(tempModel,Xval);
    tempError = mean(double(tempPredictions ~= yval));
    if tempError < error
      error = tempError;
      C = tempC;
      sigma = tempSigma;
    endif
  endfor
endfor

C
sigma



% =========================================================================

end
