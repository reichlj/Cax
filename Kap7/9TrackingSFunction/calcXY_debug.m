function calcXY_debug(block)
  setup(block);  
end
function setup(block)
  block.NumDialogPrms  = 3;
  block.NumInputPorts  = 2;
  block.NumOutputPorts = 2;
  % Setup functional port properties to dynamically inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic; 
  for k=1:2
     block.InputPort(k).Dimensions        = 1;
     block.InputPort(k).DirectFeedthrough = false;
     block.OutputPort(k).Dimensions       = 1;
  end  
  
  block.NumContStates = 3;
  block.SampleTimes = [-1 0];    % Set block sample time to inherited
  % Set block simStateCompliance to default (same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';
  block.OutputPort(1).SamplingMode = 'Sample';
  block.OutputPort(2).SamplingMode = 'Sample';
  % Register methods
  block.RegBlockMethod('Derivatives',             @MyDerivatives);
  block.RegBlockMethod('InitializeConditions',    @MyInitializeConditions);  
  block.RegBlockMethod('Outputs',                 @MyOutput);  
  block.RegBlockMethod('SetInputPortSamplingMode', @MySetInputPortSamplingMode);
end
function MyDerivatives(block)
  block.Derivatives.Data(1)=block.InputPort(1).Data*cos(block.ContStates.Data(3));
  block.Derivatives.Data(2)=block.InputPort(1).Data*sin(block.ContStates.Data(3));
  block.Derivatives.Data(3)=block.InputPort(2).Data;
  displayData(block,'MyDerivatives')
end
function MyInitializeConditions(block)
  block.ContStates.Data(1) = block.DialogPrm(1).Data;
  block.ContStates.Data(2) = block.DialogPrm(2).Data;
  block.ContStates.Data(3) = block.DialogPrm(3).Data;
  displayData(block,'InitializeConditions')
end
function MyOutput(block)
  block.OutputPort(1).Data = block.ContStates.Data(1);
  block.OutputPort(2).Data = block.ContStates.Data(2);
  displayData(block,'Output')
end
function MySetInputPortSamplingMode(block,idx,fd)
  block.InputPort(idx).SamplingMode = fd;
end
function displayData(block, name)
    if block.IsMajorTimeStep()
       step = '**Major**';
    else
       step= '  Minor  ';
    end
    fprintf('t=%9.5f %s  %s\n',block.CurrentTime,step,name);
end