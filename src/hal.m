function [a,x,y] = hal(f,p,n,x1,y1,tau)

%Be sure to input functions f and p of variables s and t. 

x(1)=x1;y(1)=y1;a=0;
syms s;syms t; 
df1=diff(f,s); df2=diff(f,t);
df1=matlabFunction(df1); df2=matlabFunction(df2);
mu=zeros(2,2);sigma=eye(2);
for t=2:n
    x0=x(t-1);y0=y(t-1);
    v=mvnrnd(mu,sigma);
    dx=v(1); dy=v(2);
    %Multiplying coefficient 'eta' to tune disturbance. 
    xx=x0+tau.*df1(x0,y0)./f(x0,y0)+sqrt(2.*tau).*dx;
    yy=y0+tau.*df2(x0,y0)./f(x0,y0)+sqrt(2.*tau).*dy;
    A=(x0-xx-tau.*df1(xx,yy)./f(xx,yy)).^2+(y0-yy-tau.*df2(xx,yy)./f(xx,yy)).^2;
    B=2.*tau.*(dx.^2+dy.^2);
    alpha=(f(xx,yy)./f(x0,y0)).*exp(0.25./tau.*(B-A));
    
    u=rand;
    if alpha>u
        x(t)=xx;y(t)=yy;a=a+(t>n./2);
    else
        x(t)=x0;y(t)=y0;
    end
    
end

a=2.*a./n;
x=x(n./2+1:n);
y=y(n./2+1:n);
disp('sampling done...');

showme3(p,x,y);

figure;
x=x(length(x)-500:length(x));
y=y(length(y)-500:length(y));
plot(x,y);

end

