function [X,varargout]= corrmtx(x,m,varargin)

// Function created by Parthe Pandit as part of Signal Processing toolbox created by FOSSEE
// Data matrix for autocorrelation matrix estimation
// X = corrmtx(x,m)
// X = corrmtx(x,m,'method')
// [X,R] = corrmtx(...)
//
//X = corrmtx(x,m) returns an (n + m)-by-(m + 1) rectangular Toeplitz matrix X, such that X'X is a (biased) estimate of the autocorrelation matrix for the length-n d    ata vector x. m must be a positive integer strictly smaller than the length of the input x.
// X  = corrmtx(x,m,'method') computes the matrix X according to the method specified by the string 'method':
//'autocorrelation': (default) X is the (n + m)-by-(m + 1) rectangular Toeplitz matrix that generates an autocorrelation estimate for the leng    th-n data vector x, derived using prewindowed and postwindowed data, based on an mth-order prediction error model.
// 'prewindowed': X is the n-by-(m + 1) rectangular Toeplitz matrix that generates an autocorrelation estimate for the length-n data vector x,     derived using prewindowed data, based on an mth-order prediction error model.
// 'postwindowed': X is the n-by-(m + 1) rectangular Toeplitz matrix that generates an autocorrelation estimate for the length-n data vector x    , derived using postwindowed data, based on an mth-order prediction error model.
// 'covariance': X is the (n – m)-by-(m + 1) rectangular Toeplitz matrix that generates an autocorrelation estimate for the length-n data vect    or x, derived using nonwindowed data, based on an mth-order prediction error model.
// 'modified': X is the 2(n – m)-by-(m + 1) modified rectangular Toeplitz matrix that generates an autocorrelation estimate for the length-n d    ata vector x, derived using forward and backward prediction error estimates, based on an mth-order prediction error model.
// [X,R] = corrmtx(...) also returns the (m + 1)-by-(m + 1) autocorrelation matrix estimate R, calculated as X'*X.
    
    if(~isvector(x)) then
        error("Input x must be a length n vector")
        return
    elseif (~isscalar(m)) then
        error("Input m must be scalar")
        return
    end
    
    if (length(varargin) > 1) then
        error('Too many input arguments. Third argument must be method for correlation matrix computation')
        return
    elseif (length(varargin) < 1)
        method = 'autocorrelation';
    elseif (length(varargin) == 1 & type(varargin(1))~=10)
        disp(type(varargin));
        error("Input method needs to be string")
        return
    else
        method = varargin(1);
    end
    n = length(x);
    x = matrix(x,1,n);
    x_padded = [zeros(1,m),x,zeros(1,m)];
    X = zeros( (n + m),(m + 1) );
    for i = 1:size(X,1)
        X(i,:) = x_padded(m+i:-1:i);
    end
    
    select method
    case "autocorrelation" then
        X = X;
    case 'prewindowed' then
        X = X(1:n,:);
    case 'postwindowed' then
        X = X(m+1:$,:);
    case 'covariance' then
        X = X(m+1:n,:);
    case 'modified' then
        X = [X(m+1:n,:)  ; conj(mtlb_fliplr(X(m+1:n,:)))];
    else X = X;
end

    
    varargout = list(X'*X);
    
    
endfunction
