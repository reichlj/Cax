function UnitDelay2(block)
  setup(block);
end

function setup(block)  
  block.NumDialogPrms  = 2;
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
  block.NumDworks = 2;
  block.Dwork(1).Name = 'ud1'; 
  block.Dwork(2).Name = 'ud2'; 
  for k=1:2
      block.Dwork(k).Dimensions      = 1;
      block.Dwork(k).DatatypeID      = 0;
      block.Dwork(k).Complexity      = 'Real';
      block.Dwork(k).UsedAsDiscState = true;
  end
end

function InitConditions(block)
  block.Dwork(1).Data = block.DialogPrm(1).Data;
  block.Dwork(2).Data = block.DialogPrm(2).Data;
end

function Output(block)
  block.OutputPort(1).Data = block.Dwork(1).Data;
end

function Update(block)
  block.Dwork(1).Data = block.Dwork(2).Data;
  block.Dwork(2).Data = block.InputPort(1).Data;
end