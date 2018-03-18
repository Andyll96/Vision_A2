%part 1.1
%x goes from 1 to 5 10 times
x = [1:5]';
x = repmat(x,100,1);
%y goes from 1 to 50
y = [1:500]';
alpha=2;
beta=5;
gamma=3;
z = alpha*x + beta*y + gamma;
z = z + randn(size(z));


%part 1.2
A = [x y ones(size(x))];
var_estimate = inv(A'*A)*A'*z;

%part 1.3
fprintf('The absoloute error for alpha, beta and gamma are:\n');
fprintf('%d\n', var_estimate-[alpha beta gamma]')
