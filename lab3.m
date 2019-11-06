A = [-1 0 0; -1 -2 -101; 1 1 0];
B = [0 1; 1 -1; 0 0];
C = [1 0 101];
D = [0 0];
x0 = [1; 0; -1];
syms t
syms s
syms theta
u = [t; -2 * t];

% 1(a)
Fi_t = ilaplace(inv(s*eye(3) - A));
pretty(Fi_t);
% 1(b)
xl_t = Fi_t * x0;
pretty(xl_t);
% 1(c)
yl_t = ilaplace(C * inv(s * eye(3) - A) * x0);
pretty(yl_t)
% 1(d)
T_s = C * inv(s * eye(3) - A) * B;
pretty(T_s)
% 1(e)
yf_t = ilaplace(T_s * laplace(u))
pretty(yf_t)