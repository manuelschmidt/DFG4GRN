#!/bin/bash
 
#$ -S /bin/bash
#$ -N state_space_test
#$ -cwd
#$ -o state_space_test.out
#$ -e state_space_test.err

SCRIPT_NAME=$1
OUT_FILE=$2
N_MODELS=$3

ls > toto.txt

PAR1=$4
VAL1=$5
PAR2=$6
VAL2=$7
PAR3=$8
VAL3=$9

PATH_DFG=`pwd`
LOG_FILE="$OUT_FILE.log"

echo "Starting $N_MODELS models, script $SCRIPT_NAME"
echo "parameters $PAR1 = $VAL1, $PAR2 = $VAL2, $PAR3 = $VAL3"

/scratch/apps/matlab/bin/matlab -nodisplay -nosplash -logfile $LOG_FILE -r "addpath(genpath('$PATH_DFG')); GRN_Batch_MultiModel_AR1($N_MODELS, '$SCRIPT_NAME', '', '$OUT_FILE', 'n_steps_display', 0, '$PAR1', [$VAL1], '$PAR2', [$VAL2], '$PAR3', [$VAL3])"
