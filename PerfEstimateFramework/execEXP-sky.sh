#!/bin/bash

source ~/.bash_profile
rm -rf `pwd`/output/resSKY
rm -rf `pwd`/output/resSKYperf

./execFrame.sh `pwd`/apps/am_call_vp `pwd`/output/resSKY
./execFrame.sh `pwd`/apps/diffusion_ompvect_Large_host `pwd`/output/resSKY
./execFrame.sh `pwd`/apps/nbody-v0s `pwd`/output/resSKY
./execFrame.sh "`pwd`/apps/run-tile -i `pwd`/apps/test.nml" `pwd`/output/resSKY
./execFrame.sh "`pwd`/apps/zmatmul 16480" `pwd`/output/resSKY

#./execFrame.sh `pwd`/apps/t2 `pwd`/output/resSKY
#./execFrame.sh `pwd`/apps/t3 `pwd`/output/resSKY
#./execFrame.sh `pwd`/apps/t4 `pwd`/output/resSKY
#./execFrame.sh `pwd`/apps/t5 `pwd`/output/resSKY
#./execFrame.sh `pwd`/apps/t6 `pwd`/output/resSKY
#./execFrame.sh `pwd`/apps/t7 `pwd`/output/resSKY

