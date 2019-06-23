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
  block.RegBlockMethod('PostPropagationSetup',     @DoPostPropSetup);
  block.RegBlockMethod('InitializeConditions',     @InitConditions);  
  block.RegBlockMethod('Outputs',                  @Output);  
  block.RegBlockMethod('Update',                   @Update);  
end

function DoPostPropSetup(block)
  ud = block.DialogPrm(1).Data;
  block.NumDworks = length(ud);
  for k=1:block.NumDworks
      block.Dwork(k).Name = num2str(k,'ud%.0f'); 
      block.Dwork(k).Dimensions      = 1;
      block.Dwork(k).DatatypeID      = 0;
      block.Dwork(k).Complexity      = 'Real';
      block.Dwork(k).UsedAsDiscState = true;
  end
end

function InitConditions(block)
  ud = block.DialogPrm(1).Data;
  for k=1:length(ud)
      block.Dwork(k).Data = ud(k);
  end
end

function Output(block)
  block.OutputPort(1).Data = block.Dwork(1).Data;
end

function Update(block)
  for k=1:block.NumDworks-1
      block.Dwork(k).Data = block.Dwork(k+1).Data;
  end
  block.Dwork(block.NumDworks).Data = block.InputPort(1).Data;
end