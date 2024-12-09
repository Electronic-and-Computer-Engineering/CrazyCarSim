#include "mex.h"
#include "c_files/algo.h"

/*
nlhs
    Number of expected output mxArrays
plhs
    Array of pointers to the expected output mxArrays
nrhs
    Number of input mxArrays
prhs
    Array of pointers to the input mxArrays. Do not modify any prhs values in your MEX-file. Changing the data in these read-only mxArrays can produce undesired side effects.
*/

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    unsigned int front_sensor, left_sensor, right_sensor, ticks, simFrequ;
    int *perc_steer, *perc_throttle;
    
    if(nrhs != 5)
    {
        mexErrMsgIdAndTxt("InputERROR:my_sum", "Four inputs required: front_sensor, left_sensor, right_sensor, ticks, simfrequ");
    }
    
    if(!mxIsDouble(prhs[0]) || mxGetNumberOfElements(prhs[0]) != 1)
    {
        mexErrMsgIdAndTxt("InputERROR:my_sum", "First argument must be number.");
    }
    
    if(!mxIsDouble(prhs[1]) || mxGetNumberOfElements(prhs[1]) != 1)
    {
        mexErrMsgIdAndTxt("InputERROR:my_sum", "Second argument must be number.");
    }
    
    if(!mxIsDouble(prhs[2]) || mxGetNumberOfElements(prhs[2]) != 1)
    {
        mexErrMsgIdAndTxt("InputERROR:my_sum", "Third argument must be number.");
    }
    
    if(!mxIsDouble(prhs[3]) || mxGetNumberOfElements(prhs[3]) != 1)
    {
        mexErrMsgIdAndTxt("InputERROR:my_sum", "Fourth argument must be number.");
    }
    
    if(!mxIsDouble(prhs[4]) || mxGetNumberOfElements(prhs[3]) != 1)
    {
        mexErrMsgIdAndTxt("InputERROR:my_sum", "Fifth argument must be number.");
    }
    
    front_sensor = (unsigned int)mxGetScalar(prhs[0]);
    left_sensor = (unsigned int)mxGetScalar(prhs[1]);
    right_sensor = (unsigned int)mxGetScalar(prhs[2]);
    ticks = (int)mxGetScalar(prhs[3]);
    simFrequ = (unsigned int)mxGetScalar(prhs[4]);

    plhs[0] = mxCreateNumericMatrix(1, 1, mxINT16_CLASS, mxREAL);
    plhs[1] = mxCreateNumericMatrix(1, 1, mxINT16_CLASS, mxREAL);
    
    perc_steer = (int*) mxGetPr(plhs[0]);
    perc_throttle = (int*) mxGetPr(plhs[1]);
    
    cc_algorithm(perc_steer, perc_throttle, front_sensor, left_sensor, right_sensor, ticks, simFrequ);

    
}