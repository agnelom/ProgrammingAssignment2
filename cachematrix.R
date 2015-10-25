## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  mInv <- NULL
  set <- function(y) {
    x <<- y
    mInv <<- NULL
  }
  get <- function() x
  setInv <- function(inv) mInv <<- inv
  getInv <- function() mInv
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  nInv <- x$getInv()
  if(!is.null(nInv)) {
    message("getting Inverse from Cached")
    return(nInv)
  }
  data <- x$get()
  nInv <- solve(data)
  x$setInv(nInv)
  nInv
}
