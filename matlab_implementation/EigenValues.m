%eigenvalue function
function eigv = EigenValues(A)
eigv = [0,0;-2,0];
temp2 = power(power(A(1)-A(4),2)+(4*A(3)*A(2)),0.5);
v1 = ((A(1)+A(4)) + temp2)/2;
v2 = ((A(1)+A(4)) - temp2)/2;
eigv = [v1,0;0,v2];
end