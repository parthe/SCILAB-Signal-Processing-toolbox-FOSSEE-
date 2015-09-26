function  b = polyscale(a,alpha)
// B = polyscale(A,alpha) scales the roots of a polynomial in the z-plane by alpha.

// Arrays B and A represent the polynomials B(1) + B(2)z + B(3)z^2 + ... + B(n)z^n-1 and A(1) + A(2)z + A(3)z^2 + ... + A(n)z^n-1 respectively.
// If alpha is a real value in the range [0 1], then the roots of A are radially scaled toward the origin in the z-plane. Complex values for alpha allow arbitrary rotational changes to the root locations.
    
// Algorithm: When roots are scaled by alpha, the coefficient a_m is scaled by alpha^(n-m) where n is the order of polynomial. Written by Parthe Pandit
    
    multiplier = zeros(a);
    n = length(a);
    for i = 1:length(multiplier)
        multiplier(i) = alpha^(n - i + 1);
    end
    b = multiplier.*a;
    
    

endfunction
