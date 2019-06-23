function myMal2M(block)
  setup(block);
%endfunction

function setup(block)
  %% Register number of input and output ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 1;
  %% Setup functional port properties to dynamically inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
  
  %block.InputPort(1).DirectFeedthrough = true;
  myInputPort = block.InputPort(1);
  % myInputPort ist vom Typ Simulink.BlockPreCompInputPortData
  myInputPort.DirectFeedthrough = true;   

  %% Set block sample time to inherited
  block.SampleTimes = [-1 0];
  %% Set the block simStateCompliance to default (built-in block)
  block.SimStateCompliance = 'DefaultSimState';
  %% Run accelerator on TLC
  block.SetAccelRunOnTLC(true);
  %% Register methods
  block.RegBlockMethod('Outputs',@MyOutput);  
%endfunction

function MyOutput(block)
  myTime = block.CurrentTime   % Ausgabe des Wertes in Diagnostic Viewer
  %block.OutputPort(1).Data = 2*block.InputPort(1).Data;
  myOutPort = block.OutputPort(1);
  myInPort = block.InputPort(1);
  inData = myInPort.Data       % Ausgabe des Wertes in Diagnostic Viewer
  myOutPort.Data = 2*inData; 
  if myTime >= 5 
     myOutPort.Data = 2*myOutPort.Data;
  end
  outData = myOutPort.Data    % Ausgabe des Wertes in Diagnostic Viewer
%endfunction