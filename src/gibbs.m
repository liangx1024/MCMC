function [a,b,x,y] = gibbs(f,p,n,x1,y1,sigma1,sigma2)
%f: proportinal to the target distribution p
%n: number of samples
%normal distribution as proposal, with standard deviation sigma
%x1: initial sample

x(1)=x1;y(1)=y1;
a=0;b=0;

for t=2:n
    xx=normrnd(x(t-1),sigma1);
    alpha=f(xx,y(t-1))./f(x(t-1),y(t-1));
    u=rand;
    if alpha>u
        x(t)=xx;a=a+(t>n./2);
    else
        x(t)=x(t-1);
    end
    
    yy=normrnd(y(t-1),sigma2);
    beta=f(x(t),yy)./f(x(t),y(t-1));
    u=rand;
    if beta>u
        y(t)=yy;b=b+(t>n./2);
    else
        y(t)=y(t-1);
    end
end


a=2.*a./n;
b=2.*b./n;

x=x(n./2+1:n);y=y(n./2+1:n);
disp('sampling done...');

showme3(p,x,y);

x=x(length(x)-1000:length(x));
y=y(length(y)-1000:length(y));
figure;
plot(x,y);

end