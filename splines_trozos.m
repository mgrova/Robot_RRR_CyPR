% Se definira el vector tiempo el t_inicio de cada tramo. Los parametros
% A,B,C y D seran los vectores de a,b,c y d
function fun = splines_trozos(t,q2,t_init,t_tramo,A,B,C,D,T)
f1=A(1)*( t-t_tramo(1) ).^3 + B(1)*(t-t_tramo(1)).^2 + C(1)*( t-t_tramo(1)) + D(1);
f2=A(2)*( t-t_tramo(2) ).^3 + B(2)*(t-t_tramo(2)).^2 + C(2)*( t-t_tramo(2)) + D(2);
f3=A(3)*( t-t_tramo(3) ).^3 + B(3)*(t-t_tramo(3)).^2 + C(3)*( t-t_tramo(3)) + D(3);
f4=A(4)*( t-t_tramo(4) ).^3 + B(4)*(t-t_tramo(4)).^2 + C(4)*( t-t_tramo(4)) + D(4);
f5=A(5)*( t-t_tramo(5) ).^3 + B(5)*(t-t_tramo(5)).^2 + C(5)*( t-t_tramo(5)) + D(5);
f6=A(6)*( t-t_tramo(6) ).^3 + B(6)*(t-t_tramo(6)).^2 + C(6)*( t-t_tramo(6)) + D(6);

fun=@(t) q2(1) .*(t<t_init) + ...
    f1 .*((t>=t_init)&(t<=(t_init+T))) + ...
    f2 .*((t>=t_init+T)&(t<=(t_init+(2*T)))) + ...
    f3 .*((t>=t_init+(2*T))&(t<=(t_init+(3*T)))) + ...
    f4 .*((t>=t_init+(3*T))&(t<=(t_init+(4*T)))) + ...
    f5 .*((t>=t_init+(4*T))&(t<=(t_init+(5*T)))) + ...
    f6 .*((t>=t_init+(5*T))&(t<=(t_init+(6*T)))) + ...
    q2(end) .*(t>t_init+(6*T)); 
end