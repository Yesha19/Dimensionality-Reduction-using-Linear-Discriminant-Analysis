%eigenvector function
function x = EigenVec(A)
x = [0;0];
if A(1,1) ~= 0
    A(2,:) = A(2,:) - A(1,:)*(A(2,1)/A(1,1));
    if A(2,2) < 0.001
        x(1) = -A(1,2)/A(1,1);
        x(2) = 1;
    else
        x(1) = 0;
        x(2) = 0;
    end
else
    if A(1,2) == 0 && A(2,1) == 0
        if A(2,2) ~= 0
            x(1) = 1;
            x(2) = 0;
        else
            x(1) = 1;
            x(2) = 1;
        end
       
    elseif A(1,2) == 0
        if A(2,2) ~= 0
            x(1) = -A(2,2)/A(2,1);
            x(2) = 1;
        else
            x(1) = 0;
            x(2) = 1;
        end
       
    elseif A(2,1) == 0
        x(1) = 1;
        x(2) = 0;
    end
end
temp1 = x(1);
temp2 = x(2);
x(1) = temp1 / (sqrt(temp1*temp1 + temp2*temp2));
x(2) = temp2 / (sqrt(temp1*temp1 + temp2*temp2));
end
