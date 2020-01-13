### JHU Data Csience C2W3 - Programming Assignment 2
# Write an R function is able to cache potentially time-consuming computations.
# Use the <<- operator to assign a value to an object in an environment that is 
# different from the current environment.




## Write a short comment describing this function
# This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function
# This function computes the inverse of the special "matrix" returned by 
#   makeCacheMatrix above. If the inverse has already been calculated (and the matrix  
#   has notchanged), then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
