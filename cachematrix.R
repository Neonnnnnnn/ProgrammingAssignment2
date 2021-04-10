## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly.
## Below is a pair of functions that cache the inverse of a matrix.

## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        invs <- NULL
        set <- fundtion(y) {
                x <<- y
                invs <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) invs <<- inverse
        getInverse <- function() invs
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)

}


## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invs <- x$getInverse()
        if (!is.null(invs)) {
                message("getting cached data")
                return(invs)
        }
        mat <- x$get()
        invs <- solve(mat, ...)
        x$setInverse(invs)
        invs
}
