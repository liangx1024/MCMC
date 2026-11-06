function[]=showme3(p,x,y)
%Input samples after abandoning process. 
figure;
K=10;R=2;
h=zeros(2.*R.*K,2.*R.*K);
s=-R:(1./K):R;t=-R:(1./K):R;
[ss,tt]=meshgrid(s,t);
N=length(x);
for k=1:N
        temp1=K.*(x(k)+R)+1;
        i=floor(temp1);
        temp2=K.*(y(k)+R)+1;
        j=floor(temp2);
        %[x(k),y(k),j]
        if (i>=1) & (i<=2.*R.*K) & (j>=1) & (j<=2.*R.*K)
            h(i,j)=h(i,j)+1;
        end
end
h=h/N; h=h.*(K.^2);
disp('plotting...');
zz=p(ss,tt);
surf(ss,tt,zz)
hold on

for i=1:(2.*R.*K)
    for j=1:(2.*R.*K)
        scatter3(s(i),t(j),h(i,j),20,0,'.');
        hold on
    end
end

disp('plotting done...');
end