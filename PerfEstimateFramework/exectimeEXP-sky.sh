#!/bin/bash

source ~/.bash_profile


time `pwd`/apps/run-tile -i `pwd`/apps/test.nml > e
time `pwd`/apps/run-tile.high -i `pwd`/apps/test.nml > e 

time `pwd`/apps/am_call_vp.low.plow > e
time `pwd`/apps/am_call_vp.high.plow > e

time `pwd`/apps/zmatmullow 10240 > e
time `pwd`/apps/zmatmul 10240 > e

time `pwd`/apps/diffusion_tiled_Large_host > e
time `pwd`/apps/diffusion_tiled_Large_host.high > e

time `pwd`/apps/nbody-v0s.low > e
time `pwd`/apps/nbody-v0s.high > e 



#./execFrame.sh `pwd`/apps/t2 `pwd`/output/resSKY
#./execFrame.sh `pwd`/apps/t3 `pwd`/output/resSKY
#./execFrame.sh `pwd`/apps/t4 `pwd`/output/resSKY
#./execFrame.sh `pwd`/apps/t5 `pwd`/output/resSKY
#./execFrame.sh `pwd`/apps/t6 `pwd`/output/resSKY
#./execFrame.sh `pwd`/apps/t7 `pwd`/output/resSKY

