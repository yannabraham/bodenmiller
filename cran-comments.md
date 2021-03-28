## New release of Radviz package

This is release 0.1.1 of bodenmiller, where we have made the following changes

 * add `LazyDataCompression: xz` to DESCRIPTION to decrease package size
 
## test environments

* local windows 10, R 4.0.3
* Ubuntu 16.04.6 LTS (on travis-ci), R 4.0.2
* win-builder (release) 
* win-builder (devel)
* R-hub
    * Windows Server 2008 R2 SP1, R-devel, 32/64 bit
    * Ubuntu Linux 20.04.1 LTS, R-release, GCC
    * Fedora Linux, R-devel, clang, gfortran

## R CMD check results

There were no ERRORs or WARNINGs

There was 1 NOTE:

 * checking installed package size ... NOTE
    installed size is 7.2Mb

  This is a data package that will not require any significant update. This has been agreed upon with the CRAN team

## Downstream dependencies

There are no downstream dependencies
