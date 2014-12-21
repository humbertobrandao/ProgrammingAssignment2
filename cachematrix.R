makeCacheMatrix <- function( myMatrix = matrix() ) {
	
	Minv <- NULL;
		set<-function(Y){
			myMatrix <<- Y;
			Minv <<-NULL;
		}
	
	get<-function(){
		myMatrix;
	}
	
	setMatInv <- function( MatInverse ){
		Minv <<- MatInverse;
	}
	
	getMatInv <- function(){
		Minv;
	}
	
	mypseudoMatrix <<- list( get=get, setMatInv=setMatInv, getMatInv=getMatInv ){
		mypseudoMatrix;
	}
	
}

cacheSolve <- function( get_setMatInv_getMatInv_of_myMatrix = mypseudoMatrix, ... ) {
	Minv <- get_setMatInv_getMatInv_of_myMatrix$getMatInv();
	
	if(!is.null(Minv)){
		message("getting cached matrix inverse");
		return(Minv);
	}
	
	DataMatrix <- get_setMatInv_getMatInv_of_myMatrix$get();
	Minv <- solve(DataMatrix,...);
	get_setMatInv_getMatInv_of_myMatrix$setMatInv(Minv);
	Minv;
}
