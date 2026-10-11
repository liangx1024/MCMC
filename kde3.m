function [estimator,xx,yy] = kde3(x,y,h,p)

n=length(x);
phi=@(s,t) exp(-0.5.*(s.^2+t.^2))./(2.*pi);
estimator=@(s,t) 0;

for i=1:n
    estimator=@(s,t) estimator(s,t)+phi((s-x(i))./h,(t-y(i))./h);
end
estimator=@(s,t) estimator(s,t)./(n.*h.^2);
disp('estimating done...');

xx=-2:0.1:2;yy=-2:0.1:2;
[xx,yy]=meshgrid(xx,yy);

zz=p(xx,yy);
ww=estimator(xx,yy);

plot3(xx,yy,zz);
hold on
plot3(xx,yy,ww);
disp('plotting done...');

end

