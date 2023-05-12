function [cmin,baz,y]=symple(C,A,zmien,baz)

% SYMPLE Ci¹g iteracji sympleksu zrewidowanego bez wzorów
%        rekurencyjnych.

while 1
   B=A(:,baz);
   p=C(baz)/B;
   d=C-p*A;
   [dmin,i]=min(d(zmien));   
   j=zmien(i);
   y=B\A(:,[1 j]);   
   if dmin>-1e-13,break,end
   dod=find(y(:,2)>0);
   if dod==[]
      fprintf('\nRozwi¹zanie optymalne jest nieograniczone.\n')
      break
   end
   [pom,i]=min(y(dod,1)./y(dod,2));
   r=dod(i);
   baz(r)=j;
end
cmin=-d(1);   