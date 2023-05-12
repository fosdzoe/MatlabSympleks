% KANOPL Przekszta³ca postaæ Ÿród³ow¹ zadania programowania
%        liniowego na postaæ kanoniczn¹: 

%           Min! a(1,2:N)*x
%                a(2:M,2:N)*x=a(2:M,1),  x>=0.

% szt - wektor zawieraj¹cy numery zmiennych sztucznych.

a=[0 znak*c;b A];
t=[-2;t];
k=1;
for i=1:n
   j=i+k;
   [M,N]=size(a);
   if l(i)>-inf & l(i)~=0
      a(:,1)=a(:,1)-a(:,j)*l(i);
   elseif l(i)>-inf & u(i)<inf
      a(M+1,1)=u(i)-l(i);
      a(M+1,j)=1;
      t(M+1)=-1;
   elseif l(i)==-inf & u(i)<inf
      a(:,1)=a(:,1)-a(:,j)*u(i);
      a(:,j)=-a(:,j);
   elseif l(i)==-inf & u(i)==inf
      k=k+1;
      a=[a(:,1:j) -a(:,j) a(:,j+1:N)];
   end
end
[M,N]=size(a);
pom=eye(M);
for i=2:M
   if a(i,1)<0|(t(i)==1&a(i,1)==0)
      a(i,:)=-a(i,:);
      t(i)=-t(i);
   end   
   if t(i)==1   
      a=[a -pom(:,i)];
   end
end   
a=[a pom(:,2:M)];
[M,N]=size(a);
szt=N-M+find(t'>=0);

   