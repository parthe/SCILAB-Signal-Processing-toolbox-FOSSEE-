function isin = rc2is(k)
// Convert reflection coefficients to inverse sine parameters
// 
// Calling Sequence
// isin = rc2is(K) 
// 
// Parameters
// k: input reflection coefficients. Needs to be an array of real numbers between -1 and 1
// isin: inverse sine parameters corresponding to the reflection coefficients in input
//
// Description
// This function returns the inverse sine parameters corresponding to the input reflection coefficients K.
// output array has isin(i) = 2/pi*asin(k(i))
//
// Example
// k = [0.3090 0.9801 0.0031 0.0082 -0.0082];
// isin = rc2is(k)      //Gives inverse sine parameters
//
// See also 
// is2rc
// rc2poly
// rc2ac
// rc2lar
//
// Authors
// Parthe Pandit
//
// Bibliography
// J.R. Deller, J.G. Proakis, J.H.L. Hansen, "Discrete-Time Processing of Speech Signals", Prentice Hall, Section 7.4.5

// errchk1
if (~isreal(k)),
 error('Input reflection coefficients are not real');
end           

if max(abs(k)) >= 1,
    error('Input reflection coefficients are not normalize. They need to be in the range -1 to 1');
end

isin = (2/pi)*asin(k);

endfunction
