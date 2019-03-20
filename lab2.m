A = [0 1; -50 -3];
B = [0;0];

M = [-2 0; 0 -3]; % obserwator
L = [1; 2]; % obserwator
C = [1 0];

wozek = ss(A,B,C,0);
t = 0:0.1:10;
u = 0 * t;
x0 = [15; 0];

lsim(wozek,u,t,x0)
syms t1 t2 t3 t4 real
T=[t1 t2;t3 t4];

a=solve(M*T-T*A+L*C)
%q=[x1;x2;x3;x4]
a1 = ss([A,zeros(2);L*C,M],[0;0;0;0],[1,0,0,0;0,0,1,0],0)
q0=[15;0;0;0]
lsim(a1,u,t,q0)
T=[a.t1,a.t2;a.t3,a.t4]
T=double(T)
Cnowe=[1,0,0,0;0,1,0,0;zeros(2),inv(T);-T,eye(2)]
a2 = ss([A,zeros(2);L*C,M],[0;0;0;0],Cnowe,0)
lsim(a2,u,t,q0)