function [Sa, Sb, Sc, t0_, t1_, t2_] = calc (ma, theta, triag)

fc = 19950;
Tc = 1/fc;
ma_ = sqrt(3)/2 * ma;

if theta >= 0 && theta <= pi/3, theta_ = theta; flag = 1;
elseif theta > pi/3 && theta <= 2*pi/3, theta_ = 2*pi/3 - theta; flag = 2;
elseif theta > 2*pi/3 && theta <= pi, theta_ = - 2*pi/3 + theta; flag = 3;
elseif theta > pi && theta <= 4*pi/3, theta_ = 4*pi/3 - theta; flag = 4;
elseif theta > 4*pi/3 && theta <= 5*pi/3, theta_ = - 4*pi/3 + theta; flag = 5;
elseif theta > 5*pi/3 && theta <= 2*pi, theta_ = 6*pi/3 - theta; flag = 6;
else, flag = 0; theta_ = 0;
end

T1 = ma_ * (cos(theta_) - 1/sqrt(3)*sin(theta_));
T2 = ma_ * 2/sqrt(3) * sin(theta_);
t1 = T1*Tc; t2 = T2*Tc; t0 = Tc - t1 - t2;
t0_ = t0/4; t1_ = t1/2 + t0/4; t2_ = t2/2 + t1/2 + t0/4;

if triag >= t0_, Sa_ = 1;
else, Sa_ = 0; 
end
if triag >= t1_, Sb_ = 1;
else, Sb_ = 0;
end
if triag >= t2_, Sc_ = 1;
else, Sc_ = 0; 
end

if flag == 1, Sa = Sa_; Sb = Sb_; Sc = Sc_;
elseif flag == 2, Sa = Sb_; Sb = Sa_; Sc = Sc_;
elseif flag == 3, Sa = Sc_; Sb = Sa_; Sc = Sb_;
elseif flag == 4, Sa = Sc_; Sb = Sb_; Sc = Sa_;
elseif flag == 5, Sa = Sb_; Sb = Sc_; Sc = Sa_;
elseif flag == 6, Sa = Sa_; Sb = Sc_; Sc = Sb_;
else, Sa = 1; Sb = 1; Sc = 1; 
end

Sa = logical(Sa); Sb = logical(Sb); Sc = logical(Sc); 