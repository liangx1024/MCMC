function [] = kde(x,p,h)

n=length(x);
phi=@(s) exp(-0.5.*(s.^2))./sqrt(2.*pi);
estimator=@(s) 0;
for i=1:n
    estimator=@(s) estimator(s)+phi((s-x(i))./h);
end


estimator=@(s) estimator(s)./(n.*h);
disp('estimating done...');

figure;
t=-5:0.1:5;
z=estimator(t);
y=p(t);
plot(t,z);
hold on
plot(t,y);
disp('plotting done...');

end

