# Profiling of Peripheral Blood Monocytes using CyTOF

CyTOF enables the profiling of up to 100 parameters at the single cell level. Bodenmiller *et al* published the profiling of **P**eripheral **B**lood **M**ononuclear **C**ells (PBMCs) using 9 phenotypic and 14 functional markers. PBMCS are stimulated with 12 treatments and treated with 8 doses of various inhibitors, then profiled using CyTOF. PBMCs are manually gated using the phenotypic markers, identifying 14 populations for which the activity of different signaling networks can be assessed using the functional markers. More details are available in [Bodenmiller *et al* Nat Biotech 2012](https://www.nature.com/articles/nbt.2317/).

To assess the efficiency of high-dimensional data analysis and visualization algorithms, the samples corresponding to untreated PBMCs, either unstimulated or after stimulation with BCR/FcR-XL, PMA/Ionomycin
or vanadate are made available as 2 datasets:

 * `refMat` the signal intensity for each of the 23 channels, for 15792 untreated cells
 * `untreatedMat` the signal intensity for each of the 23 channels, for 36144 cells after stimulation with BCR/FcR-XL, PMA/Ionomycin
or vanadate

For each dataset there are 3 additional matrix:

 * `refPhenotMat` and `untreatedPhenoMat` the signal intensity for the 9 phenotypic channels
 * `refFuncMat` and `untreatedFuncMat` the signal intensity for the 14 functional channels
 * `refAnnots` and `untreatedAnnots` the source file, cell type assignement and stimulation (where appropriate)

Install it from github with:

```{r}
devtools::install_github("yannabraham/bodenmiller")
```

## Travis Build Status

[![Travis-CI Build Status](https://travis-ci.org/yannabraham/bodenmiller.svg?branch=master)](https://travis-ci.org/yannabraham/bodenmiller)
