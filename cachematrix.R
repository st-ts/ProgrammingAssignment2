## The functions below cache an inverse matrix of
## a given matrix X. If no inverse matrix exists,
## it is computed and cached.

## A function that creates an object with smth??

makeCacheMatrix <- function(x = matrix()) {
        ## this function takes a matrix (assumed
        ## to be invertible) and returns a list of 
        ## fuctions to set and get matrix, and to
        ## set and get the inverse
        inv_mat <- NULL
        set <- function(y) {
                x <<- y
                inv_mat <<- NULL
                }
        get <- function() x
        set_inv <- function(inv) inv_mat <<- inv
        get_inv <- function() inv_mat 
        list(set = set, get = get, set_inv = set_inv
             get_inv = get_inv)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv_mat <- x$get_inv
        if (!is.null(inv_mat)) {
                message("here's the cached inverse")
                return(inv_mat)
                }
        mat <- x$get()
        inv_mat <- solve(mat, ...)
        x$set_inv(inv_mat)
        inv_mat
}
