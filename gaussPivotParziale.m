function [x, deter, pivot] = gaussPivotParziale(A, b)
    n = length(b);
    deter = 1;
    norma = norm(A, inf);
    pivot = 1:n; 


    for k = 1:n-1
        [maxVal, r] = max(abs(A(k:n, k)));
        r = r + k - 1;

        if maxVal == 0
            error('Matrice singolare: colonna %d annullata.', k);
        end

        if abs(A(k,k)) < eps * norma
            fprintf('Pivot molto piccolo (quasi nullo) in posizione (%d,%d)\n', k, k);
        end

       
        if r ~= k
            A([k r], :) = A([r k], :);
            b([k r]) = b([r k]);
            pivot([k r]) = pivot([r k]);
            deter = -deter; 
        end

        deter = deter * A(k,k);

        for i = k+1:n
            m = A(i,k) / A(k,k);
            A(i,k+1:n) = A(i,k+1:n) - m * A(k,k+1:n);
            b(i) = b(i) - m * b(k);
            A(i,k) = 0;
        end
    end

    if abs(A(n,n)) < eps * norma
        fprintf('Ultimo pivot molto piccolo in posizione (%d,%d)\n', n, n);
    end
    deter = deter * A(n,n)
    pivot
    x = zeros(n,1);
    x(n) = b(n) / A(n,n);
    for i = n-1:-1:1
        x(i) = (b(i) - A(i,i+1:n) * x(i+1:n)) / A(i,i);
    end
end

