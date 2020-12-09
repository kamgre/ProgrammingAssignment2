## This couple of functions is intended to save some computing time in case of 
## repeated calls for an inverse of a given matrix. 

## makeCacheMatrix gets a matrix as an argument and stores it within the 
## structure of a new object. This object is capable of storing the inverse of 
## a given matrix to be retrieved later.
## Intended use is to assign the result to a new objet: 
## special_matrix <- makeCacheMatrix(ordinary_matrix).
## 
## The function assumes that a given matrix IS invertible.

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
  ## The object being returned is actually a list of functions
}


## cacheSolve returns an inverse of a matrix, provided that a given matrix was 
## first stored in a special object created by makeCacheMatrix() before.
## The inverse is being calculated only once and only at the first run. 
## Following calls will retrieve the inverse from a value cached in the object's 
## structure.
## Intended use it to call for cacheSolve(special_matrix).

cacheSolve <- function(x, ...) {
  inv <- x$inverse()
  if(!is.null(inv)) {
    message('cached data')
    return(inv) ## Return a matrix that is the inverse of 'x'
  }
  x$invert() ## Calculates only if cached value in unavailable
  x$inverse()        
}
