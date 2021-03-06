### JHU Data Csience C2W3 - Programming Assignment 2
# Write an R function that is able to cache potentially time-consuming computations.
# Use the <<- operator to assign a value to an object in an environment that is 
# different from the current environment.

## Write a short comment describing this function
# This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## Write a short comment describing this function
# This function computes the inverse of the special "matrix" returned by 
#   makeCacheMatrix above. If the inverse has already been calculated (and the matrix  
#   has notchanged), then cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        if (!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat, ...)
        x$setInverse(inv)
        inv
}

# Test the Functions
## Create matrix
# > MyMat <- makeCacheMatrix(matrix(9:12, 2, 2))
# > MyMat$get()
#       [,1] [,2]
# [1,]    9   11
# [2,]   10   12
## Run without cache
# > cacheSolve(MyMat)
#       [,1] [,2]
# [1,]   -6  5.5
# [2,]    5 -4.5
## Second run - get from cache
# > cacheSolve(MyMat)
# Getting cached inverse matrix
#       [,1] [,2]
# [1,]   -6  5.5
# [2,]    5 -4.5
