from xml.dom import minidom
import argparse

parser = argparse.ArgumentParser()	
parser.add_argument('--prj', help='Path for Advisor Project')
args = parser.parse_args()
prjdir=args.prj

dom = minidom.parse(prjdir+'/metrics.advisum')
tag=['ElapsedTime','ElapsedTimeMKL','PausedTime','WasPausing','CPUThreads','ISAUsed','CompilerMajorVersion','VectorizedLoopsCount','FullyUnrolledCount','TotalCPUTime','TotalCPUTimeMKL','TimeInVectorizedLoops','TimeInVectorizedLoopsMKL','TimeInScalarLoops','TimeInScalarLoopsMKL','TimeOutsideOfAnyLoop','TimeOutsideOfAnyLoopMKL','VectorizationGain','ProgramGain','VectorizedLoopsGain','ProgramSpeedUp','EfficiencyConfidence','ProgramEfficiency','VectorizedLoopsEfficiency','ReferenceEfficiency','ReferenceProgramEfficiency','TotalGFLOPcount','TotalGFLOPcountMKL','TotalGFLOPS','TotalGFLOPSMKL','TotalGFLOPSInVectorizedLoops','TotalGFLOPSInVectorizedLoopsMKL', 'TotalAI','FLOPSfeatureOn']

for elem in tag:
	node=dom.getElementsByTagName(elem)[0]
	print (elem + ' ' + node.firstChild.data)

