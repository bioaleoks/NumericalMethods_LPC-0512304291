function [x,Niter,stimaerrore, ier]=gaussseidelrelativo(A,b,x0,toll,maxIter)

n=length(b);
Niter=0;
stimaerrore=1;
x=x0;
temp=[0; x0];

while (Niter<maxIter)&&(stimaerrore>toll)

    x(1)=(b(1)-A(1,2:n)*x0(2:n))/A(1,1);
    for i=2:n-1
        x(i)=(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x(i+1:n))/A(i,i);
    end
    x(n)=(b(n)-A(n,1:n-1)*x(1:n-1))/A(n,n);

   stimaerrore=norm(x-x0,inf);   

    Niter=Niter+1;
    x0=x;
    temp=[temp; Niter; x];

end

if stimaerrore>toll
    ier=-1;
    disp('Accuratezza non ottenuta in Nmax iterazioni');
else
    ier=0;
    disp('Convergenza.')
end
temp

xrif=A\b;
err_ass = norm(xrif - x, inf);
errorereale = err_ass / norm(xrif, inf);

fprintf('Errore stimato: %f \n', stimaerrore);
fprintf('Errore reale: %f \n', errorereale);
