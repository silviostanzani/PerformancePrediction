#!/bin/bash

icpc -ltbbmalloc -no-vec -qopenmp -O0 -ipo -restrict -fimf-precision=low -fimf-domain-exclusion=31 -fno-alias -qopt-report=5 -o `pwd`/apps/am_call_vp.novec2 `pwd`/src/optionprice/am_call.cpp

icpc -ltbbmalloc -xCORE-AVX2 -qopenmp -O3 -ipo -restrict -fimf-precision=low -fimf-domain-exclusion=31 -fno-alias -qopt-report=5 -o `pwd`/apps/am_call_vp.avx2 `pwd`/src/optionprice/am_call.cpp

icpc -ltbbmalloc -xCOMMON-AVX512 -qopenmp -O3 -ipo -restrict -fimf-precision=low -fimf-domain-exclusion=31 -fno-alias -qopt-report=5 -o `pwd`/apps/am_call_vp.avx512Common `pwd`/src/optionprice/am_call.cpp

icpc -ltbbmalloc -xhost -qopt-zmm-usage=high -qopenmp -O3 -ipo -restrict -fimf-precision=low -fimf-domain-exclusion=31 -fno-alias -qopt-report=5 -o `pwd`/apps/am_call_vp.high `pwd`/src/optionprice/am_call.cpp
icpc -ltbbmalloc -xhost -qopt-zmm-usage=low -qopenmp -O3 -ipo -restrict -fimf-precision=low -fimf-domain-exclusion=31 -fno-alias -qopt-report=5 -o `pwd`/apps/am_call_vp.low `pwd`/src/optionprice/am_call.cpp
