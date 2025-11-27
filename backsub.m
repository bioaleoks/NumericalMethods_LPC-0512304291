function x = backsub(A, b)
[n,m]=size(A);
if n~=m
error( ' La matrice A deve essere quadrata ');   
end
if n~= length(b)
    error( ' La dimesione del vettore b non è compatibile con la matrice A ');
end
x=zeros(n,1);
for i=n:-1:1
    if A(i,i)==0
error('La matrice è singolare: elemento diagonale nullo in posizione (%d, %d).', i, i);
    end
    s=0;
    for j=i+1:n
        s=s+A(i,j)*x(j);
    end
    x(i)=(b(i)-s)/A(i,i);
end
end