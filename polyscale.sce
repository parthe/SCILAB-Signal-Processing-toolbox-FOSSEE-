function  b = polyscale(a,alpha)
// b = polyscale(a,alpha) scales the roots of a polynomial in the z-plane, where a is a vector containing the polynomial coefficients and alpha is the scaling factor.

// If alpha is a real value in the range [0 1], then the roots of a are radially scaled toward the origin in the z-plane. Complex values for alpha allow arbitrary changes to the root locations.
    
// Algorithm: When roots are scaled by alpha, the coefficient a_m is scaled by alpha^(n-m) where n is the order of polynomial
    
    multiplier = zeros(a);
    n = length(a);
    for i = 1:length(multiplier)
        multiplier(i) = alpha^(n - i + 1);
    end
    b = multiplier.*a;
    
    

endfunction
