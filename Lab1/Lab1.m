%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Controls Systems Lab
% Lab 1 : Getting familiar with Matlab
% Colin Roskos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%
%% Part 1
%%%%%%%%%%%%%

a = 5;
b = 10;
x = 0:.2:5;

y = exp(-a)*sin(x)+b*sqrt(x);

plot(y, x, "b.-")


%%%%%%%%%%%%%
%% Part 2
%%%%%%%%%%%%%

A = [1 2 3 ; 4 5 6 ; 7 8 9];
At = inv(A)


%%%%%%%%%%%%%
%% Part 3
%%%%%%%%%%%%%


o = fun(10)
r = roots([1, 30, 200])


function f = fun(s)
    f = s^2 + 30*s + 200;
end
