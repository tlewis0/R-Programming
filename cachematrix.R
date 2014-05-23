## 
## Cache Matrix function

## function makeCacheMatrix takes a matrix x in the parameter list and creates functions
##  setinverse, getinverse, get, and set which are associated with the matrix as a 
##  list of functions. These can then be called as member functions of the matrix
## makeCacheMatrix
## example:
##  m = makeCacheMatrix(matrix(rnorm(4,0,10), nrow=2, ncol=2))
##  m$get()         # Returns original matrix
##  cacheSolve(m) # Computes, caches, and returns matrix inverse
##  m$getinverse()  # Returns matrix inverse
##  cacheSolve(m) # Returns previously computed matrix inverse
##
##  m$set(matrix(rnorm(4,0,10), nrow=2, ncol=2))  #create new matrix
##  cacheSolve(m) # Computes, caches, and returns new matrix inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
            x <<- y
            inv <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) inv <<- solve
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


##  function cacheSolve takes a matrix and returns the inverse of the matrix.
##  the computed inverse is then cached, so that in future calls to the function
## with this matrix, the inverse does not have to be recomputed. 
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    #if inverse already exists, return it
    if(!is.null(inv)) {
            message("getting cached data")
            return(inv)
    }
    # inverse has not been previously computed, so compute it now using
    #  using the solve function
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv
}













