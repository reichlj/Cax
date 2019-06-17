function display2MB_lsg(block)
setup(block);
%endfunction

function setup(block)
  %% Register number of input and output ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 2;
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
  block.RegBlockMethod('Outputs',     @MyOutput);  
  %% Variante 1
  block.RegBlockMethod('SetInputPortSamplingMode', @MySetInputPortSamplingMode);
  % Variante 2  SamplingMode = 'Sample' oder 'Frame' oder 'Inherited'
  %block.InputPort(1).SamplingMode = 'Sample';
  %block.OutputPort(1).SamplingMode = 'Sample';
  %block.OutputPort(2).SamplingMode = 'Sample';
  %endfunction

function MyOutput(block)
  block.OutputPort(1).Data = 2*block.InputPort(1).Data;
  block.OutputPort(2).Data = 3*block.InputPort(1).Data;
%endfunction

function MySetInputPortSamplingMode(block, idx, fd)
   block.InputPort(idx).SamplingMode = fd;
   block.OutputPort(1).SamplingMode = fd;
   block.OutputPort(2).SamplingMode = fd;
%endfunction
