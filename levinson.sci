function [a,e,k] = levinson(r,n)
// Levinson-Durbin recurrsion
//
// Calling Sequence
// a = levinson(r,n)
// [a,e] = levinson(r,n)
// [a,e,k] = levinson(r,n)
//
// Parameters
// r: The input autocorrelation sequence. If r is a matrix, each column of r is treated as a separate signal
// n: The order of prediction filter to be estimated for the given autocorrelation sequence. n must be less than length of r
// a: coeffients of AR filter. a(1) = 1
// e: prediction error of AR filter
// k: reflection coefficients for the AR model
//
// Description
// This function solves the Levinson-Durbin recurrsion to obtain the AR filter model of specified order
// The filter e/(a(1) + a(2)z + a(3)z^2 .. a(n)z^n-1) is the output filter
// This is a wrapper function  of the scilab function lev. Re-written in the signal processing toolbox for the sake of completeness
//
// Examples
//
// See also
//
// Authors
// Parthe Pandit
// 

// Function wrapper calling lev(.)
[a,e,k] = lev(r)
a = a(n,:);
e = e(n,:);
k = k(n,:);
endfunction
