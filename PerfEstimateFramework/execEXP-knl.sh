#!/bin/bash

source ~/.bash_profile

rm -rf `pwd`/output/resKNL
./execFrame.sh `pwd`/apps/am_call_vp.mic `pwd`/output/resKNL  
./execFrame.sh `pwd`/apps/nbody-v0s.mic `pwd`/output/resKNL 
#./execFrame.sh `pwd`/apps/t2.mic `pwd`/output/resKNL
#./execFrame.sh `pwd`/apps/t3.mic `pwd`/output/resKNL
#./execFrame.sh `pwd`/apps/t4.mic `pwd`/output/resKNL
#./execFrame.sh `pwd`/apps/t5.mic `pwd`/output/resKNL
#./execFrame.sh `pwd`/apps/t6.mic `pwd`/output/resKNL
#./execFrame.sh `pwd`/apps/t7.mic `pwd`/output/resKNL
