# Profiling of Peripheral Blood Monocytes using CyTOF

CyTOF enables the profiling of up to 100 parameters at the single cell level. Bodenmiller *et al* published the profiling of **P**eripheral **B**lood **M**ononuclear **C**ells (PBMCs) using 9 phenotypic and 14 functional markers. PBMCS are stimulated with 12 treatments and treated with 8 doses of various inhibitors, then profiled using CyTOF. PBMCs are manually gated using the phenotypic markers, identifying 14 populations for which the activity of different signaling networks can be assessed using the functional markers. More details are available in the [publication](http://www.nature.com/nbt/journal/v30/n9/full/nbt.2317.html).

To assess the efficiency of high-dimensional data analysis and visualization algorithms, the samples corresponding to unstimulated, untreated PBMCs are made available as 4 separate data sets:

 * `refMat` the signal intensity for each of the 23 channels, for the 15792 cells detected in the experiment
 * `refPhenoMat` the signal intensity for the 9 phenotypic channels, for the 15792 cells detected in the experiment
 * `refFuncMat` the signal intensity for the 14 functional channels, for the 15792 cells detected in the experiment
 * `refAnnots` the source file and cell type assignement for the 15792 cells detected in the experiment

Install it from github with:

```{r}
devtools::install_github("yannabraham/bodenmiller")
```
