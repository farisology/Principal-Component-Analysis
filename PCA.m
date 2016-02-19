function PCA()

% To generate eigenfaces by using ORLTrain.mat
% Input Parameter: none

%load in face training images
%load myArray.mat

load testData.mat
dTrainPCA = double(data);
%-------------------------------------------------
% PCA Training
%-------------------------------------------------

B = dTrainPCA;

num_faces = size(B,2);

% Average face
avgfaceT = ((sum(B') / num_faces))';

% Subtract average face from each individual face
for row = 1:num_faces
   B(:, row) = B(:, row) - avgfaceT;
end

% Covariance Matrix
st = B*B';

% Eigenvalue Decomposition
[Vt, Dt]=eig(st);

% Resort the eigenvalues and eigenvectors (EigenFaces) in descending order
[junk, index] = sort(-diag(Dt));
eigenfacesT = Vt(:, index);

d = diag(Dt);
eigenvaluesT = d(index);


%----------------------------------------------------

   
save([pwd,'\gray test\ORLtest.mat'],'eigenfacesT','eigenvaluesT','avgfaceT')