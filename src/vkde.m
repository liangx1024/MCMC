function [] = vkde(x,p,g,c)

n=length(x); h=zeros(1,101);
phi=@(s) exp(-0.5.*(s.^2))./sqrt(2.*pi);
estimator=@(s) 0;
for i=1:n
    temp=(x(i)+5).*10+1; k=floor(temp);
    if (k>=1)&(k<=101)
        h(k)=h(k)+1;
    end
    
end
h=h.*10./n;

for i=1:n
    temp=(x(i)+5).*10+1; k=floor(temp);
    if (k>=1)&(k<=101)
        m=c./(h(k).*n);
    else
        m=g;
    end    
    estimator=@(s) estimator(s)+phi((s-x(i))./m)./m;
end

estimator=@(s) estimator(s)./n;
disp('estimating done...');

%figure;
t=-5:0.1:5;
z=estimator(t);
y=p(t);
plot(t,z);
hold on
%plot(t,y);
disp('plotting done...');

end

