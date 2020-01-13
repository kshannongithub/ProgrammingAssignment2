### JHU Data Csience C2W3 - Programming Assignment 2
## kshannongithub
# Write an R function is able to cache potentially time-consuming computations.
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
my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
my_matrix$get()
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4

## Test did not work
# my_matrix$getInverse()
# Error: attempt to apply non-function
# cacheSolve(my_matrix)
# Error in cacheSolve(my_matrix) : attempt to apply non-function
