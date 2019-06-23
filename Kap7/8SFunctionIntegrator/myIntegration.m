function myIntegration(block)
  setup(block);
end
function setup(block)  
  block.NumDialogPrms  = 1;
  % Register number of input and output ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 1;
  % Setup functional port properties to dynamically inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
 
  block.InputPort(1).Dimensions        = 1;
  block.InputPort(1).DirectFeedthrough = false;
  block.OutputPort(1).Dimensions       = 1;
  block.NumContStates = 1;
  block.SampleTimes = [-1 0]; % Set block sample time to inherited
  
  % Set block simStateCompliance to default (same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';
  % Register methods
  block.RegBlockMethod('InitializeConditions', @MyInitializeConditions);  
  block.RegBlockMethod('Derivatives',          @MyDerivatives);
  block.RegBlockMethod('Outputs',              @MyOutput);  
end
function MyInitializeConditions(block)
  block.ContStates.Data = block.DialogPrm(1).Data;
  printData(block,'InitializeConditions')
end
function MyOutput(block)
  block.OutputPort(1).Data = block.ContStates.Data;
  printData(block,'Output')
end
function MyDerivatives(block)
   block.Derivatives.Data = block.InputPort(1).Data;
   my = block.Derivatives;
   printData(block,'Derivatives')
end
function printData(block, name)
  if block.IsMajorTimeStep()
     step = '**Major**';
  else
     step= '  Minor  ';
  end
  fprintf('t=%9.5f %s  %s\n',block.CurrentTime,step,name);
end