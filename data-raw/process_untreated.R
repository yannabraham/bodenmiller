## load the required libraries
library(flowCore)
library(stringr)

## define markers
pheno.markers <- c('CD20','IgM','CD4','CD33','HLA-DR','CD14','CD7','CD3','CD123')
func.markers <- c('pStat1','pSlp76','pBtk','pPlcg2','pErk','pLat','pS6','pNFkB','pp38','pStat5','pAkt','pSHP2','pZap70','pStat3')

## List & load FCS files into a flowSet
untreated.files <- dir('data-raw',pattern='fcs')

# remove the reference files
untreated.files <- untreated.files[!str_detect(untreated.files,'H05')]

untreatedSet <- read.flowSet(untreated.files,path="data-raw")
pData(untreatedSet)$Cells <- sapply(pData(untreatedSet)$name,function(x) str_split(x,'_')[[1]][2])

## create a cell level annotation
untreatedAnnots <- data.frame(
  Source = unlist(lapply(sampleNames(untreatedSet),
                         function(x) rep(x,nrow(untreatedSet[[x]])))),
  Treatment = unlist(lapply(sampleNames(untreatedSet),
                     function(x) {
                        well <- str_split(str_split(x,'\\.')[[1]][1],'_')[[1]][3]
                        if(well=='H01') {
                          return(rep('vanadate',nrow(untreatedSet[[x]])))
                        } else if(well=='H08') {
                          return(rep('BCR/FcR-XL',nrow(untreatedSet[[x]])))
                        } else if(well=='H12') {
                          return(rep('PMA/Ionomycin',nrow(untreatedSet[[x]])))
                        } else {
                          return(rep('NA',nrow(untreatedSet[[x]])))
                        }
                      }
                     )),
  Cells = unlist(lapply(sampleNames(untreatedSet),
                        function(x) rep(pData(untreatedSet)[x,'Cells'],nrow(untreatedSet[[x]]))))
)

## Extract channel data
untreatedMat <- fsApply(untreatedSet,function(ff) {
    cur.mat <- exprs(ff)
    # fix the dimnames
    dimnames(cur.mat)[[2]] <- make.names(pData(parameters(ff))$desc)
    cur.mat <- cur.mat[,c(pheno.markers,func.markers)]
    return(cur.mat)
  }
)

# transform using arcsinh
untreatedMat <- asinh(untreatedMat/5)

untreatedPhenoMat <- untreatedMat[,make.names(pheno.markers)]
untreatedFuncMat <- untreatedMat[,make.names(func.markers)]

devtools::use_data(untreatedAnnots,untreatedMat, untreatedPhenoMat, untreatedFuncMat,overwrite=TRUE)
