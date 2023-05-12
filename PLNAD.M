% PLNAD Programowanie liniowe metod¹ sympleksu zrewidowanego.
% Postaæ Ÿród³ow¹ zadania tworzy ZRODPL.M.
% KANOPL.M przekszta³ca j¹ do postaci kanonicznej.
% SYMPLE.M wykonuje iteracje sympleksowe.

zrodpl
znak=1;
if zadan=='maks',znak=-1;end
if m==0
   s=.5+.5*znak*sign(c');
   xopt=s.*l+(1-s).*u;
   copt=c*xopt;
else
   kanopl
   zmien=2:N;
   cmin=0;
   baz=N-M+2:N;
   if size(szt,2)>0     

%     Faza pierwsza.
      C=zeros(1,N);
      C(szt)=ones(size(szt));
      [cmin,baz]=symple(C,a(2:M,:),zmien,baz);
   end
   if cmin>1e-8
      fprintf('\nZbiór dopuszczalnych rozwi¹zañ jest pusty.\n')
   else

%     Faza druga.
      zmien(szt-1)=[];
      C=a(1,:);
      [copt,baz,y]=symple(C,a(2:M,:),zmien,baz);

%     Utworzenie rozwi¹zania optymalnego.
      yopt=zeros(N,1);
      yopt(baz)=y(:,1);      
      copt=znak*copt;
      k=1;
      xopt=zeros(n,1);
      for i=1:n
         j=i+k;
         if l(i)>-inf 
            xopt(i)=yopt(j)+l(i);
         elseif l(i)==-inf & u(i)<inf
            xopt(i)=-yopt(j)+u(i);
         elseif l(i)==-inf & u(i)==inf
            k=k+1;
            xopt(i)=yopt(j)-yopt(j+1);
         end
      end
   end
end