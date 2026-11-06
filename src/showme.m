function [] = showme(p,x)
K=200;
t=-5:1./K:5;
h=zeros(1,10.*K+1);
N=length(x);
for k=1:N
     temp=(x(k)+5).*K+1;
     i=floor(temp);
     if (i>=1)&(i<=10.*K+1)
         h(i)=h(i)+1;
     else
     end
end

y=p(t);
h=K.*h./N;
%figure;
scatter(t,h,8,'.');
hold on
plot(t,y);

disp('plotting done...');

end

