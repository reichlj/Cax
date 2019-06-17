function malStepM(block)
setup(block);
%endfunction

function setup(block)
  %% Register number of input and output ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 1;
  %% Setup functional port properties to dynamically inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
  block.InputPort(1).DirectFeedthrough = true;
  %% Set block sample time to inherited
  block.SampleTimes = [-1 0];
  %% Set the block simStateCompliance to default (built-in block)
  block.SimStateCompliance = 'DefaultSimState';
  %% Run accelerator on TLC
  block.SetAccelRunOnTLC(true);
  %% Register methods
  block.RegBlockMethod('Outputs', @MyOutput);  
%endfunction

function MyOutput(block)
  if block.CurrentTime < 5 
     factor = 2;
  else
     factor = 4;
  end
  block.OutputPort(1).Data = factor*block.InputPort(1).Data;
%endfunction