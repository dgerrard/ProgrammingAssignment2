## The functions below create a special "matrix" object that 
## can cache its inverse.  

## creates a special object of type "matrix" that can cache its
## inverse.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- null
    }
    get <- function () x
    setrix <- function (trix) m
    getrix <- function() m
    list(set = set, get = get, setrix = setrix, getrix = getrix)
}


## This function computes the This function computes the 
## inverse of the special "matrix" returned by makeCacheMatrix
## above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cachesolve should 
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(solve(m))
  }
  data <- x$get()
  m <- solve(data)
  x$setrix(m)
  m    
}