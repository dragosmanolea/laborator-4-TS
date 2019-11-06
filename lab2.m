A = [-1 0 0; -1 -2 -101; 1 1 0];
B = [0 1; 1 -1; 0 0];
C = [1 0 101];
D = [0 0];

u_t = [1; -2];

syms s;
syms teta;
h = 0.1;

A_d = ilaplace(inv(s * eye(3) - A), h);
B_d = int(ilaplace(inv(s * eye(3) - A), teta) * B, teta, 0, h);

A_d1 = double(A_d);
B_d1 = double(B_d);

[num1s, den1s] = ss2tf(A, B, C, D, 1);
H_1s = tf(num1s, den1s);
H_1z = c2d(H_1s, h);
[num1z, den1z] = tfdata(H_1z, 'v');

[num2s, den2s] = ss2tf(A, B, C, D, 2);
H_2s = tf(num2s, den2s);
H_2z = c2d(H_2s, h);
[num2z, den2z] = tfdata(H_2z, 'v');

T_z = [H_1z H_2z]