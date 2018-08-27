#!/bin/bash

function execProfiling() 
{
  app=$1
  prj=$2
  dur=$3
  output=$4
  threads=$5
  res=$6

  rm -rf $prj
  rm -rf $output

  export OMP_NUM_THREADS=$threads

  advixe-cl -collect survey -module-filter-mode=exclude -mrte-mode=auto -interval=10 -data-limit=500 -stackwalk-mode=offline -stack-stitching -mkl-user-mode -no-profile-python -no-support-multi-isa-binaries -no-spill-analysis -no-static-instruction-mix -auto-finalize -no-benchmark-sync --duration $dur  -project-dir $prj -- $app

  advixe-cl -collect tripcounts -module-filter-mode=exclude -trip-counts -flop -no-stacks -no-callstack-tripcounts -no-flops-and-masks -no-callstack-flops -stack-stitching -no-profile-python -auto-finalize --duration $dur -project-dir $prj -- $app

  advixe-cl -report survey -project-dir $prj -format=xml -report-output $output/"$app"survey.xml

  python parser.py --prj $prj/e000/hs000/ >> $res
}

function execProfilingVtune() 
{
  app=$1
  prj=$2
  dur=$3
  output=$4
  threads=$5
  res=$6

  rm -rf $prj
  rm -rf $output

  export OMP_NUM_THREADS=$threads

  amplxe-cl -collect hpc-performance -r $prj -d $dur -knob enable-stack-collection=true -app-working-dir /home/silvio/PerfEstimateFramework/apps -- $app
  amplxe-cl -report summary -report-knob show-issues=false -r $prj -format=csv > $4
  echo $4 
  echo "$res"vtune 
  cat $4 >> "$res"vtune
  echo "$prj"
  rm -rf $prj
}

resl=$2

#for i in `seq 1 5` ; do
  echo $1 `cat /proc/cpuinfo | awk '/^processor/{print $3}' | tail -n 1` >> $resl

  execProfiling "$1" `pwd`/PRJs/prj 45 `pwd`/output/survey.xml `cat /proc/cpuinfo | awk '/^processor/{print $3}' | tail -n 1` $resl

  perf stat -d timeout -k 5 10 "$1" &>> "$resl"perf

  #execProfilingVtune "$1" `pwd`/PRJs/vtune/hpc001 5 `pwd`/output/csv `cat /proc/cpuinfo | awk '/^processor/{print $3}' | tail -n 1` $resl

#done

#cat `pwd`/output/res
