library(globalSeq)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
        pfix = prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
}

run <- function() {}

output <- function(outputfile) {

# simulate high-dimensional data
#n <- 30; q <- 10; p <- 100
n <- as.integer(parameters["n", 2])
q <- as.integer(parameters["q", 2])
p <- as.integer(parameters["p", 2])
Y <- matrix(rnbinom(q*n,mu=10,
size=1/0.25),nrow=q,ncol=n)
X <- matrix(rnorm(p*n),nrow=p,ncol=n)
Yloc <- seq(0,1,length.out=q)
Xloc <- seq(0,1,length.out=p)
window <- 1
# hypothesis testing
nnn <- cursus(Y,Yloc,X,Xloc,window)
write.csv(nnn, outputfile)
}
