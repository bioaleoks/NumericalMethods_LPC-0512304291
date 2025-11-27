function [x,Niter,stimaerrore, ier]=jacobiassoluto(A,b,x0,toll,maxIter)

n=length(b);
Niter=0;
stimaerrore=1;
x=x0;

temp=[0, x0']; 
while (Niter<maxIter)&&(stimaerrore>toll)

    x(1)=(b(1)-A(1,2:n)*x0(2:n))/A(1,1);
    for i=2:n-1
        x(i)=(b(i)-A(i,1:i-1)*x0(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i);
    end
    x(n)=(b(n)-A(n,1:n-1)*x0(1:n-1))/A(n,n);

  stimaerrore=norm(x-x0,inf);    %stima errore assoluto
  %  stimaerrore=norm(x-x0, inf)/norm(x, inf); 

    Niter=Niter+1;
    x0=x;
    temp=[temp; Niter x'];

end

if stimaerrore>toll
    ier=-1
    disp('Accuratezza non ottenuta in Nmax iterazioni');
else
    ier=0
end
%% tabella
T = table(temp);
disp(T)
%% se non viene stampata la tabella, stampare solo temp:
%%temp

xrif=A\b;
errorereale = norm(x - xrif, inf);

fprintf('Errore stimato: %f', stimaerrore);
fprintf('Errore reale: %f', errorereale);
