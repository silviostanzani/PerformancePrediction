#!/bin/bash

icpc -g -ltbbmalloc -qopenmp -ipo -restrict -fno-alias -qopt-report=5 -O3 -xhost -o `pwd`/apps/am_call_vp.high `pwd`/src/optionprice/am_call.cpp -qopt-zmm-usage=high

icpc -g -ltbbmalloc -qopenmp -ipo -restrict -fno-alias -qopt-report=5 -O3 -xhost -o `pwd`/apps/am_call_vp.high.plow `pwd`/src/optionprice/am_call.cpp -qopt-zmm-usage=high -fimf-precision=low -fimf-domain-exclusion=31

icpc -g -ltbbmalloc -qopenmp -ipo -restrict -fno-alias -qopt-report=5 -O3 -xhost -o `pwd`/apps/am_call_vp.low `pwd`/src/optionprice/am_call.cpp -qopt-zmm-usage=low

icpc -g -ltbbmalloc -qopenmp -ipo -restrict -fno-alias -qopt-report=5 -O3 -xhost -o `pwd`/apps/am_call_vp.low.plow `pwd`/src/optionprice/am_call.cpp -qopt-zmm-usage=low -fimf-precision=low -fimf-domain-exclusion=31 

#time `pwd`/apps/am_call_vp.high ; time `pwd`/apps/am_call_vp.high.plow ; time `pwd`/apps/am_call_vp.low ; time `pwd`/apps/am_call_vp.low.plow

