
avector = makeVector(c(1,2,3,4))
avector$get()         # Returns original vector
cachemean(avector)   # Computes, caches, and returns    vector inverse
avector$getmean()  # Returns vector inverse
cachemean(avector) 

amatrix = makeMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
amatrix$get()         # Returns original matrix
cacheinverse(amatrix) # Computes, caches, and returns matrix inverse
amatrix$getinverse()  # Returns matrix inverse
cacheinverse(amatrix) # Returns cached matrix inverse using previously computed matrix inverse

amatrix$set(matrix(c(0,5,99,66), nrow=2, ncol=2)) # Modify existing matrix
cacheinverse(amatrix)   # Computes, caches, and returns new matrix inverse
amatrix$get()         # Returns matrix
amatrix$getinverse()  # Returns matrix inverse

testing the clearing of the cache and the correctness of the inverse matrix:
Usage:
1. Pass a matrix and cache it by passing it to the makeCacheMatrix function
     > myCachedMatrix <- makeCacheMatrix(matrix(c(0, -5, -4, 0), nrow=2, ncol=2, byrow=TRUE))
2. Verify that the matrix X is available in the myCachedMatrix environment but not in the global environment:
     > myCachedMatrix$getMatrix()         => you will see a the matrix passed in 1.
     > X                                  => you will get Error object 'X' not found, or something else
3. Verify that the inverse of X is not yet calculated
     > myCachedMatrix$getInverseMatrix()  => you will get NULL
4.  Calculate and get its inverse with the cacheSolve function
     >  cacheSolve(myCachedMatrix)        => you will get the inverse matrix of X
5. Verify the content of the cache
     > myCachedMatrix$getInverseMatrix()  => you will get the very same inverse matrix of X
6. Verify that the matrix product of X and its inverse returns the identity matrix
     > myCachedMatrix$getMatrix() %*% myCachedMatrix$getInverseMatrix()
7. Invoke again cacheSolve to verify Inverse matrix is coming from the cache and it is not calculated
     > cacheSolve(myCachedMatrix)         => you will get the very same inverse matrix of X
8. Set a new matrix and verify the cache for the inverse matrix has been cleared.
     > myCachedMatrix$setMatrix(matrix(c(0, -3, -2, 0), nrow=2, ncol=2, byrow=TRUE))
     > myCachedMatrix$getMatrix()         => you will get the new matrix
     > myCachedMatrix$getInverseMatrix()  => you will get NULL
     > cacheSolve(myCachedMatrix)         => you will get another inverse matrix, because the matrix has changed

x <- 2000
m <- matrix(runif(x^2),x)

4 days ago 
Here is an example where the inverse was not previously in the cache

 p = matrix(11:14,2,2  )  
> pp<-makeCacheMatrix(p)
> cacheSolve(pp)
     [,1] [,2]
[1,]   -7  6.5
[2,]    6 -5.5


#Here i store the data in the cache first

s<-matrix(21:24,2 , 2)
> ss<-makeCacheMatrix(s)
> ss$setinverse(solve(s)) #here i am storing the inverse in the cache
> ss$getinverse() # here i am just getting it to see if the inverse is there for sure
     [,1]  [,2]
[1,]  -12  11.5
[2,]   11 -10.5
> cacheSolve(ss) # here i find the inverse but the data is already in the cache
getting cached data
     [,1]  [,2]
[1,]  -12  11.5
[2,]   11 -10.5

> install.packages("magic")
> library(magic)
  Loading required package: abind
> A<-magic(5) 

B<-makeCacheMatrix(A)
> names(B)
B$getinv() 
cacheSolve(B)
cacheSolve(B)
B$getinv()
B$setmat(A)
> B$getinv()


A simple test case with system.time()

> testData <- matrix(stats::rnorm(90000), nrow=300, ncol=300)
> test <- makeCacheMatrix(testData)
> system.time(t1 <- cacheSolve(test)) ## first call; w/o cache
    user  system elapsed 
    0.027   0.001   0.027 
> system.time(t2 <- cacheSolve(test)) ## second call; with cache
getting cached data
    user  system elapsed 
    0.001   0.000   0.000 


Moore-Penrose Generalized Inverse of A.
ginv(A) requires loading the MASS package. 

c=rbind(c(1, -1/4), c(-1/4, 1)) 
solve(c) %*% c 
solve(t(matX) %*% matX)
matX<-matrix(c(rep(1, 8),2,3,4,0,6,4,3,7,-2,-4,3,5,7,8,9,11,4), nrow=5, ncol=5);
matX
matXi <- solve(matX)
zapsmall(matXi %*% matX)













