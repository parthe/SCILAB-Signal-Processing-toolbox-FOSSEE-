function [k,varargout] = schurrc(r)
// Compute reflection coefficients from autocorrelation sequence using Schur algorithm
//
// Calling Sequence
// k = schurrc(r)
// [k,e] = scurrc(r)
//
// Parameters
// r: Autocorrelation sequence. Could be a vector or matrix
// k: reflection coefficients. I-th column of k correspond to reflection coefficients of I-th column of r
// e: Prediction error. I-th element of e represents error for I-th column of r
//
// Description
// The function uses the schur algorithm to obtain the reflection coefficients
//
// Examples
//
// See also
// levinson
//
// Author
// Parthe Pandit
//
// Bibliography
// J. Proakis and D. Manolakis, "Digital Signal Processing: Principles, Algorithms, and Applications".

// errcheck-1
if(type(R) > 1), then
	error('Input R is not a matrix')
if (min(size(R)) == 1), R = R(:); end 

// if R is a row vector
[m,n] = size(R);
if (m == 1)
	R = R(:)
end

// Compute reflection coefficients for each column of the input matrix
for j = 1:n
	X = conj(R(:,j).');

	// Schur's iterative algorithm on a row vector of autocorrelation values
	U = [0 X(2:m); X(1:m)];

    for i = 2:m
        U(2,:) = [0 U(2,1:m-1)];	     
	   k(m-1,j) = -U(1,i)/U(2,i); 
	   U = [1 k(m-1,j); conj(k(m-1,j)) 1]*U;
    end
   
	e(c) = U(2,end);
end
e = e';
varargout = list(e);
   
endfunction
