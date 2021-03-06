#This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) i <<- inverse
  getInverse <- function() i
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


# This function computes the inverse of the special 
#"matrix" returned by makeCacheMatrix above. 
#If the inverse has already been calculated (and the matrix has not changed),
#then cacheSolve should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
  i <- x$geInverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)#if data is a square invertible matrix, then solve(X) returns its inverse.
  x$setInverse(i)
  i
}
