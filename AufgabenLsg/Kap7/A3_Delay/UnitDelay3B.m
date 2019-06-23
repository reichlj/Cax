function UnitDelay3B(block)
  setup(block);
end

function setup(block)  
  block.NumDialogPrms  = 3;
  % Register number of input and output ports
  block.NumInputPorts  = 1;   
  block.NumOutputPorts = 1;
  % Setup functional port properties to dynamically inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
  block.InputPort(1).Dimensions        = 1;
  block.InputPort(1).DirectFeedthrough = false;
  block.OutputPort(1).Dimensions       = 1;
  % Set block sample time to inherited
  block.SampleTimes = [-1 0];
  % Set block simStateCompliance to default (same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';
  % Register methods
  block.RegBlockMethod('PostPropagationSetup', @MyPostPropagationSetup);
  block.RegBlockMethod('InitializeConditions', @MyInitializeConditions);  
  block.RegBlockMethod('Outputs',              @MyOutputs);  
  block.RegBlockMethod('Update',               @MyUpdate);  
end

function MyPostPropagationSetup(block)
  block.NumDworks = 1;
  block.Dwork(1).Name = 'ud'; 
  block.Dwork(1).Dimensions      = 3;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = true;
end

function MyInitializeConditions(block)
  block.Dwork(1).Data(1) = block.DialogPrm(1).Data;
  block.Dwork(1).Data(2) = block.DialogPrm(2).Data;
  block.Dwork(1).Data(3) = block.DialogPrm(3).Data;
end

function MyOutputs(block)
  block.OutputPort(1).Data = block.Dwork(1).Data(1);
end

function MyUpdate(block)
  block.Dwork(1).Data(1) = block.Dwork(1).Data(2);
  block.Dwork(1).Data(2) = block.Dwork(1).Data(3);
  block.Dwork(1).Data(3) = block.InputPort(1).Data;
end