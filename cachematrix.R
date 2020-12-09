## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  get <- function() x
  inverse <- function() inv
  invert <- function() {
    inv <<- solve(x)
  }
  
  list(get = get,
       inverse = inverse,
       invert = invert)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inv <- x$inverse()
  if(!is.null(inv)) {
    message('cached data')
    return(inv) ## Return a matrix that is the inverse of 'x'
  }
  x$invert()
  x$inverse()        
}
