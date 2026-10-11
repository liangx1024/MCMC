function [a,x] = mh(f,p,n,x1,sigma)
%f: proportinal to the target distribution p
%n: number of samples
%normal distribution as proposal, with standard deviation sigma
%x1: initial sample

x(1)=x1;
a=0;I=0;

for t=2:n
    xx=normrnd(x(t-1),sigma);
    %xx=exprnd(lambda);
    %c=rand;
    %if c>0.5
    %    xx=-xx;
    %end
    %xx=x(t-1)+xx;
    alpha=f(xx)./f(x(t-1));
    u=rand;
    if alpha>u
        x(t)=xx;a=a+(t>n./2);
    else
        x(t)=x(t-1);
    end
    %I=I+(x(t).^2).*(t>n./2);
end

a=2.*a./n;
%I=2.*I./n;
%e=I-1;

x=x(n./2+1:n);
disp('sampling done...');

%scatter(a,e,8);
%hold on
showme(p,x);

end

