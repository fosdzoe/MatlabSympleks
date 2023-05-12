% ZRODPL Tworzy Ÿród³ow¹ postaæ zadania programowania liniowego. 
%       
% Zmienna zadan='mini' dla zadania minimalizacji
%              ='maks' dla zadania maksymalizacji.
% Oznaczenia: c - wektor kosztu
%             b - wektor prawych stron
%             A - macierz ograniczeñ wierszowych
%             t - wektor typów ograniczeñ:
%               =-1 dla <=
%               = 0 dla =
%               = 1 dla >=
%             l,u - wektory dolnych i górnych ograniczeñ na zmienne
%             n - iloœæ zmiennych naturalnych
%             m - iloœæ ograniczeñ wierszowych.
% Wartoœæ domyœlna dla elementów wszystkich wektorów i macierzy
% wynosi zero.

clear all
c=[];b=[];t=[];A=[];l=[];u=[];
input('Podaj nazwê skryptu z danymi: ')
nc=length(c);
nl=length(l);
nu=length(u);
[mA,nA]=size(A);
n=max([nc nl nu nA]);
mb=length(b);
mt=length(t);
m=max([mA mb mt]);
if n>nc,c(n)=0;end
if n>nl,l(n)=0;end
if n>nu,u(n)=0;end
if m>0 & (m>mA|n>nA),A(m,n)=0;end
if m>mb,b(m)=0;end
if m>mt,t(m)=0;end
b=reshape(b,m,1);
t=reshape(t,m,1);
l=reshape(l,n,1);
u=reshape(u,n,1);