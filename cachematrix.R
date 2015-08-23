makeCacheMatrix <- function(xArg = matrix()) { # assign name 'makeCacheMatrix' to function expecting one argument, where argument xArgs is a matrix.
 #set a list of arguments that will be used
  inverseArg <- NULL
  set<-function(bArg){ # uses function 'set' with one argument bArg, where matrix xArg is assiged to bArg
  xArg<<-bArg
}

# get a function with the supplied argument
get<-function() xArg

#passing solve as inversArg
setInverse<-function(solve) inverseArg <<- solve
#getinverse matrix taking inversArg as solve
getInverse<-function() inverseArg
#creating a list of set/get of the reverse matrix
list(set=set, get=get,
   setInverse=setInverse,
   getInverse=getInverse)
}


cacheSolve <- function(xArg=matrix(), ...) {
#passing the xArg with the getmatrix function to the inverseArg
    inverseArg<-xArg$getInverse()
    #catch statement for the null argument of inverseArg 
    #if the inverse matrix has been calculated it will print it
    if(!is.null(inverseArg)){
      message("getting cached data")
      return(inverseArg)
    }
#inversing the matrix and printing it
  inverseArg <- solve(xArg$get())
  xArg$setInverse(inverseArg)
  inverseArg
}
