function msfcn_unit_delay(block)
  setup(block);  
%endfunction

function setup(block)
  block.NumDialogPrms  = 1;
  %% Register number of input and output ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 1;
  %% Setup functional port properties to dynamically inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
 
  block.InputPort(1).Dimensions        = 1;
  block.InputPort(1).DirectFeedthrough = false;
  block.OutputPort(1).Dimensions       = 1;
  
  %% Set block sample time to [0.1 0]
  block.SampleTimes = [0.5 0];
%  block.SampleTimes = [-1 0];
  
  %% Set the block simStateCompliance to default (i.e., same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';

  %% Register methods
  block.RegBlockMethod('PostPropagationSetup', @MyPostPropagationSetup);
  block.RegBlockMethod('InitializeConditions', @MyInitializeConditions);  
  block.RegBlockMethod('Outputs',              @MyOutputs);  
  block.RegBlockMethod('Update',               @MyUpdate);  
%endfunction

function MyPostPropagationSetup(block)
  block.NumDworks = 1;      %% Setup Dwork
  block.Dwork(1).Name = 'x0'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = true;
%endfunction
function MyInitializeConditions(block)
  % block.Dwork(1).Data = 0.27;  %% Initialize Dwork
  block.Dwork(1).Data = block.DialogPrm(1).Data;  %% Initialize Dwork
%endfunction
function MyOutputs(block)
  fprintf('Output\n')
  fprintf('  Time       : %6.3f\n',block.CurrentTime)
  fprintf('  Eingang    : %6.3f\n',block.InputPort(1).Data)
  fprintf('  Dwork      : %6.3f\n',block.Dwork(1).Data)
  fprintf('  Ausgang-old: %6.3f\n',block.OutputPort(1).Data)
  block.OutputPort(1).Data = block.Dwork(1).Data;
  fprintf('  Ausgang-new: %6.3f\n',block.OutputPort(1).Data)
%endfunction
function MyUpdate(block)
  fprintf('Update\n')
  fprintf('  Time       : %6.3f\n',block.CurrentTime)
  fprintf('  Eingang    : %6.3f\n',block.InputPort(1).Data)
  fprintf('  Dwork-old  : %6.3f\n',block.Dwork(1).Data)
  block.Dwork(1).Data = block.InputPort(1).Data;
  fprintf('  Dwork-new  : %6.3f\n',block.Dwork(1).Data)
  fprintf('  Ausgang    : %6.3f\n',block.OutputPort(1).Data)
%endfunction