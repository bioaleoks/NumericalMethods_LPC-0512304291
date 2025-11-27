function [x, determ] = gaussnaive(A, b)
    n = length(b);
    determ = 1;
    norma = norm(A, inf);

    for k = 1:n-1
        if A(k,k) == 0
            error('Pivot nullo in posizione (%d,%d). Metodo fallito.', k, k);
        elseif abs(A(k,k)) < eps * norma
            fprintf('Pivot molto piccolo (quasi nullo) in posizione (%d,%d)\n', k, k);
        end
        determ = determ * A(k,k);

        for i = k+1:n
            m = A(i,k) / A(k,k);
            A(i,k:n) = A(i,k:n) - m * A(k,k:n);
            b(i) = b(i) - m * b(k);
        end
    end

    if abs(A(n,n)) < eps * norma
        fprintf('Pivot finale molto piccolo in posizione (%d,%d)\n', n, n);
    end
    determ = determ * A(n,n)

    x = zeros(n,1);
    x(n) = b(n) / A(n,n);
    for i = n-1:-1:1
        s = A(i, i+1:n) * x(i+1:n);
        x(i) = (b(i) - s) / A(i,i);
    end
end
