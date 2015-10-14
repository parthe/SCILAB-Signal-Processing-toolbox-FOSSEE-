function  b = polyscale(a,alpha)
// Scaling roots of a polynomial
//
// Calling sequence
// b = polyscale(a,alpha)
//
// Parameters
// a: input polynomial in the complex plane a(1) + a(2)z + a(3)z^2 .. a(N)z^N-1
// alpha: scaling factor for obtaining new polynomial. Complex values for alpha allow rotational changes to the zero locations
// b: output polynomial in the complex plane b(1) + b(2)z + b(3)z^2 .. b(N)z^N-1 whose roots are scaled versions of roots of a
//
// Description
// This function scales the roots of a polynomial a(1) + a(2)z + a(3)z^2 .. a(N)z^N-1 by alpha.
// Algorithm: When roots are scaled by alpha, the coefficient a_m is scaled by alpha^(n-m) where n is the order of polynomial
//
// Examples
// 
// See also
// polystab
//
// Author
// Parthe Pandit

//errcheck1
if(type(a)>1 | min(size(a))>1)
	error('Input polynomial must be an array')    
end
    multiplier = zeros(a);
    n = length(a);
    for i = 1:length(multiplier)
        multiplier(i) = alpha^(n - i + 1);
    end
    b = multiplier.*a;

endfunction
