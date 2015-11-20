## load the required libraries
library(flowCore)
library(stringr)

## define markers
pheno.markers <- c('CD20','IgM','CD4','CD33','HLA-DR','CD14','CD7','CD3','CD123')
func.markers <- c('pStat1','pSlp76','pBtk','pPlcg2','pErk','pLat','pS6','pNFkB','pp38','pStat5','pAkt','pSHP2','pZap70','pStat3')

## List & load FCS files into a flowSet
reference.files <- dir('data-raw',pattern='H05.fcs')

refSet <- read.flowSet(reference.files,path="data-raw")
pData(refSet)$Cells <- sapply(pData(refSet)$name,function(x) str_split(x,'_')[[1]][2])

## create a cell level annotation
refAnnots <- data.frame(
  Source = unlist(lapply(sampleNames(refSet),
                         function(x) rep(x,nrow(refSet[[x]])))),
  Cells = unlist(lapply(sampleNames(refSet),
                        function(x) rep(pData(refSet)[x,'Cells'],nrow(refSet[[x]]))))
)

## Extract channel data
refMat <- fsApply(refSet,function(ff) {
    cur.mat <- exprs(ff)
    dimnames(cur.mat)[[2]] <- pData(parameters(ff))$desc
    cur.mat <- cur.mat[,c(pheno.markers,func.markers)]
    return(cur.mat)
  }
)

# transform using arcsinh
refMat <- asinh(refMat/5)

# fix the dimnames
dimnames(refMat)[[2]] <- make.names(dimnames(refMat)[[2]])

refPhenoMat <- refMat[,make.names(pheno.markers)]
refFuncMat <- refMat[,make.names(func.markers)]

devtools::use_data(refAnnots,refMat, refPhenoMat, refFuncMat,overwrite=TRUE)
