A = [-1 0 0; -1 -2 -101; 1  1 0];
B = [0 1; 1 -1; 0 0];
C = [1 0 101];
D = [0 0];
u = [1; -2];
h = 0.1;
syms s;
syms theta;
Ad = ilaplace(inv(s*eye(3) - A), h);
Atheta = ilaplace(inv(s*eye(3) - A), theta);
Bd = int(Atheta*B,theta,0,h);
Ad = double(Ad)
Bd = double(Bd)
Cd = C;
Dd = D;
[num1, dem1] = ss2tf(A, B, C, D, 1);
H11s = tf(num1, dem1)
H11z = c2d(H11s, h)
[num2, dem2] = ss2tf(A, B ,C ,D, 2);
H12s = tf(num2, dem2)
H12z = c2d(H12s, h)
[num1z, dem1z] = tfdata(H11z, 'v');
[num2z, dem2z] = tfdata(H12z, 'v');
Tz = [H11z, H12z];
Ts = [H11s, H12s];
yf = Tz * u
