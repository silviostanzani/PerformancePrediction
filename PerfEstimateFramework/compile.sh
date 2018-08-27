#!/bin/bash

icpc -O3 -fopenmp -fp-model fast=2 -xHost -o `pwd`/apps/nbody-v0s `pwd`/src/nbody/nbody-v0.cc

icpc -ltbbmalloc -xHost -qopenmp -O3 -ipo -restrict -fimf-precision=low -fimf-domain-exclusion=31 -fno-alias -qopt-report=5  -DCOMPILER_VERSION=\""icpc-18.0.2"\" -o `pwd`/apps/am_call_vp `pwd`/src/optionprice/am_call.cpp

icc -qopenmp -O3 -std=c99 -DNX=512 -xHost `pwd`/src/diffusion/diffusion_ompvect.c "-o" `pwd`/apps/diffusion_ompvect_Large_host

icc -xhost -O3 -fp-model fast=2 -qopenmp -lrt `pwd`/src/zmatmul/zmatmul.c `pwd`/src/zmatmul/zorder2d.c `pwd`/src/zmatmul/timer.c -o `pwd`/apps/zmatmul

icpc -o `pwd`/apps/run-tile `pwd`/src/hydro/run-tile.cpp `pwd`/src/hydro/pcl-hydro-core.cpp `pwd`/src/hydro/pcl-hydro-vcore.cpp `pwd`/src/hydro/pcl-hydro-util.cpp `pwd`/src/hydro/pcl-hydro-params.cpp `pwd`/src/hydro/vtkfile.cpp `pwd`/src/hydro/timeseries.cpp -DGIT_VERSION=\"855bf29.dirty\" -DCOMPILER_VERSION=\""icpc-20180210"\" -DDOUBLE -Wall -wd167 -ggdb -qopenmp -O3 -ipo -restrict -xhost

#-qopt-zmm-usage=high

#icc -O3 -xMIC-AVX512 `pwd`/src/t2.c -o `pwd`/apps/t2.mic -fopenmp
#icc -O3 -xMIC-AVX512 `pwd`/src/t3.c -o `pwd`/apps/t3.mic -fopenmp
#icc -O3 -xMIC-AVX512 `pwd`/src/t4.c -o `pwd`/apps/t4.mic -fopenmp
#icc -O3 -xMIC-AVX512 `pwd`/src/t5.c -o `pwd`/apps/t5.mic -fopenmp
#icc -O3 -xMIC-AVX512 `pwd`/src/t6.c -o `pwd`/apps/t6.mic -fopenmp
#icc -O3 -xMIC-AVX512 `pwd`/src/t7.c -o `pwd`/apps/t7.mic -fopenmp

#icpc -O3 -fopenmp -fp-model fast=2 -xCore-AVX512 -o `pwd`/apps/nbody-v0s `pwd`/src/nbody/nbody-v0.cc

#icpc -ltbbmalloc -xCore-AVX512 -qopenmp -O3 -ipo -restrict -fimf-precision=low -fimf-domain-exclusion=31 -fno-alias -qopt-report=5  -DCOMPILER_VERSION=\""icpc-18.0.2"\" -o `pwd`/apps/am_call_vp `pwd`/src/optionprice/am_call.cpp

#icc -O3 -xCore-AVX512 `pwd`/src/t2.c -o `pwd`/apps/t2 -fopenmp
#icc -O3 -xCore-AVX512 `pwd`/src/t3.c -o `pwd`/apps/t3 -fopenmp
#icc -O3 -xCore-AVX512 `pwd`/src/t4.c -o `pwd`/apps/t4 -fopenmp
#icc -O3 -xCore-AVX512 `pwd`/src/t5.c -o `pwd`/apps/t5 -fopenmp
#icc -O3 -xCore-AVX512 `pwd`/src/t6.c -o `pwd`/apps/t6 -fopenmp
#icc -O3 -xCore-AVX512 `pwd`/src/t7.c -o `pwd`/apps/t7 -fopenmp
