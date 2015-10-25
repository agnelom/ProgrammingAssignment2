## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## this function creates a matrix that is used by the cacheSolve and and provides a mechanism 
## to cache the inverse of the matrix and provide related function set and get data

makeCacheMatrix <- function(x = matrix()) {
  mInv <- NULL
  set <- function(y) {
      x <<- y
      mInv <<- NULL
  }
  get <- function() x
  setInv <- function(inv) mInv <<- inv
  getInv <- function() mInv
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  nInv <- x$getInv()
  if(!is.null(nInv)) {
    print("Getting inverse from Cache")
    return(nInv)
  }
  data <- x$get()
  if (nrow(data)==ncol(data)){
    nInv <- solve(data)
  }
  else {
    print("Only Square matrix supported")
  }
  x$setInv(nInv)
  nInv
}
