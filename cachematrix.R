## Put comments here that give an overall description of what your
## functions do
## This file has tow functions which demonstrate the use of lexiscal scoping
## The function makeCacheMatrix create as special matrix and allows for its 
## inverse to be stored into cache using the lexical scoping techniques


## Write a short comment describing this function
## this function creates a matrix that is used by the cacheSolve function and provides a mechanism 
## to cache the inverse of the matrix and provide related methods to set and get data

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


## The cacheSolve function takes as input what is output by makeCacheMatrix
## this function is responsible for calculating the inverse of the special matrix create by makeCacheMatrix
## It only calculates the invers if it does not already fine the inverse in cache. If it calculates the invers then
## in also puts the value into the cache using the setInv function in makeCacheMatrix.

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
