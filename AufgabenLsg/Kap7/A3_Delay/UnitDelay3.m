function UnitDelay3(block)
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
  block.NumDworks = 3;
  block.Dwork(1).Name = 'ud1'; 
  block.Dwork(2).Name = 'ud2'; 
  block.Dwork(3).Name = 'ud3'; 
  for k=1:3
      block.Dwork(k).Dimensions      = 1;
      block.Dwork(k).DatatypeID      = 0;
      block.Dwork(k).Complexity      = 'Real';
      block.Dwork(k).UsedAsDiscState = true;
  end
end

function MyInitializeConditions(block)
  block.Dwork(1).Data = block.DialogPrm(1).Data;
  block.Dwork(2).Data = block.DialogPrm(2).Data;
  block.Dwork(3).Data = block.DialogPrm(3).Data;
end

function MyOutputs(block)
  block.OutputPort(1).Data = block.Dwork(1).Data;
end

function MyUpdate(block)
  block.Dwork(1).Data = block.Dwork(2).Data;
  block.Dwork(2).Data = block.Dwork(3).Data;
  block.Dwork(3).Data = block.InputPort(1).Data;
end