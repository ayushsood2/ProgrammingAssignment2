## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to:

##set the value of the matrix

##get the value of the matrix

##set the value of the inverse

##get the value of the inverse

makeCachematrix<- function(x=matrix()){
  m<-NULL
  set<-function (y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setmatrix<-function(solve) m<<-solve
  getmatrix<-function() m
  list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m<-x$getmatrix()
  if(!is.null(m)){
    message("getting cached matrix")
    return(m)
  }
  data<-x$get()
  m<-solve(data,...)
  x$setmatrix(m)
  m
}
