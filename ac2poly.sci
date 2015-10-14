function [a,varargout] = ac2poly(r)
// Convert autocorrelation sequence to polynomial of prediction filter
//
// Calling Sequence
// a = ac2poly(r)
// [a,e] = ac2poly(r)
// 
// Parameters
// r: Autocorrelation sequence to be represented with an FIR linear prediction filter
// a: Output polynomial representing the linear prediction filter e/(a(1) + a(2)z + a(3)z^2 .. a(N)z^N-1)
// e: Output scaling for the lienar prediction filter
//
// Description
// Function ac2poly() finds the best fit polynomial for FIR linear prediction filter a, corresponding to the autocorrelation sequence r. a is the same length as r, and is normalized with the first element. So a(1) = 1.
//
// Exanmples
// // Convert the following signal into an equivalent AR model
// // r = [1 0.001 0.23 0.5]
// 
// r = [1 0.001 0.23 0.5];
// [a,e] = ac2poly(r);
//
// See also
// ac2rc
// poly2ac
// rc2poly
// rc2ac
// ac2rc
//
// Author:
// Parthe Pandit
// 
// Bibliography
// Kay, Steven M. Modern Spectral Estimation. Englewood Cliffs, NJ: Prentice-Hall, 1988.

//errcheck1
if (type(r) > 1 | size(,1) | size(,2) > 1), then
	error('Input autocorrelation sequence needs to be an array not matrix')
end

[a,e] = levinson(R);
varargout = list(e);

endfunction