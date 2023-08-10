% this is the 2nd question of the 1st assignment

a = [1;4.5;9.6];
b = [1.6 8 7.3];

c = [1:1:5]';
d = a.' + a;

e = a(2);
f = a(3) + b(2);

G = [7 2 -3;2 5 -3;1 -1 -6];
z = [-12;-20;-26];

H = inv(G);
x = G\z;

P = [2 5 -3;2 5 -3;1 -1 -6];
% the inverse of P is not defined because the determinent of P is zero

Q = G.*P;
R = G*P;

if Q == R
    fprintf('Q and R are the same');
else
    fprintf('Q and R are not the same');
end

S = eye(4);
t = diag(S);

u = P(:,3);
