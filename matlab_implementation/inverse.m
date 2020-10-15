%inverse function
function X = inv1(A)
    [m ,n] = size(A);
    X = [0 0;0 0];
   
    dA = A(1,1)*A(2,2) - A(1,2)*A(2,1);
   
    X(1,1) = A(2,2);
    X(2,2) = A(1,1);
    X(1,2) = -A(1,2);
    X(2,1) = -A(2,1);
   
    X = X/dA;
end