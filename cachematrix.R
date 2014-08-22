## cachematrix - specialized version of R's matrix abstract data
## type which caches its inverse to avoid overhead of recalculation
## Based on sample code from RD Peng, PhD, Johns Hopkins Bloomberg School
## of Public Health, for the Coursera Course, "R Programming"
##
## Date: Thu Aug 21 20:38:38 PDT 2014
##
## Author: M. Ealem


## Purpose: Factory function for our specialized matrix that
##          sets up getter and setter functions for the abstract
##          data type and initializes the cached inverse
##
## Parameter: x - a matrix (defaults to an empty matrix)
##
## Example: cmatrix <- makeCacheMatrix(some.matrix)
##          cmatrix$getinverse()            

makeCacheMatrix <- function(the.matrix = matrix()) {
    # initialize the inverse
    the.inverse <- NULL

    # sets matrix to new value and reinitializes cached inverse
    set <- function(new.matrix) {
        the.matrix <<- new.matrix
        the.inverse <<- NULL
    }

    get <- function() the.matrix

    setinverse <- function(new.inverse) the.inverse <<- new.inverse

    getinverse <- function() the.inverse

    # return getters and setters as list, so we have a nice ADT interface
    list(set = set,
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Purpose: calculates and returns value of matrix inverse if cached
##          value is available, otherwise just returns cached value

cacheSolve <- function(the.matrix, ...) {
    ## check to see if we've already calculated our inverse...
    inverse <- the.matrix$getinverse()
    if (!is.null(inverse)) {
        ## TODO: figure out some way to conditionally execute
        ##       this message - could be confusing to user in
        ##       larger program
        message("getting cached inverse...")
        return(m)
    }

    ## ... else get the underlying matrix and calculate the inverse 
    data <- the.matrix$get()
    calculated.inverse <- solve(data)
    the.matrix$setinverse(calculated.inverse)
    inverse
}
