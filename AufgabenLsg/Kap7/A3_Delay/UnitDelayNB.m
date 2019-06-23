function UnitDelayN(block)
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
  % Set block sample time to inherited
  block.SampleTimes = [-1 0];
  % Set block simStateCompliance to default (same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';
  % Register methods
  block.RegBlockMethod('PostPropagationSetup', @DoPostPropSetup);
  block.RegBlockMethod('InitializeConditions', @InitConditions);  
  block.RegBlockMethod('Outputs',              @MyOutputs);  
  block.RegBlockMethod('Update',               @MyUpdate);  
end

function DoPostPropSetup(block)
  ud = block.DialogPrm(1).Data;
  block.NumDworks = 1;
  block.Dwork(1).Name = 'ud'; 
  block.Dwork(1).Dimensions      = length(ud);
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = true;
end

function InitConditions(block)
  ud = block.DialogPrm(1).Data;
  for k=1:length(ud)
      block.Dwork(1).Data(k) = ud(k);
  end
end

function MyOutputs(block)
  block.OutputPort(1).Data = block.Dwork(1).Data(1);
end

function MyUpdate(block)
  n = block.Dwork(1).Dimensions;
  for k=1:n-1
      block.Dwork(1).Data(k) = block.Dwork(1).Data(k+1);
  end
  block.Dwork(1).Data(n) = block.InputPort(1).Data;
end