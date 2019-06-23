function a4fallschirmM_lsg(block)
  setup(block);  
%endfunction

function setup(block)
  block.NumDialogPrms  = 4;  
  %% Register number of input and output ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 1;
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
  block.RegBlockMethod('Outputs', @Output);  
  block.RegBlockMethod('PostPropagationSetup', @DoPostPropSetup);
  block.RegBlockMethod('InitializeConditions', @InitConditions); 
%endfunction

function DoPostPropSetup(block)
  block.NumDworks = 5;
  block.Dwork(1).Name = 'AS'; 
  block.Dwork(2).Name = 'AFS'; 
  block.Dwork(3).Name = 'h1'; 
  block.Dwork(4).Name = 'DT'; 
  block.Dwork(5).Name = 't0';
  for k=1:block.NumDworks
    block.Dwork(k).Dimensions      = 1;
    block.Dwork(k).DatatypeID      = 0;
    block.Dwork(k).Complexity      = 'Real';
    block.Dwork(k).UsedAsDiscState = false;
  end
  block.Dwork(5).UsedAsDiscState = true;
%endfunction
    
function InitConditions(block)
  for k=1:block.NumDworks-1
     block.Dwork(k).Data = block.DialogPrm(k).Data;
  end
  block.Dwork(5).Data = 0;
%endfunction
  
function Output(block)
  AS = block.Dwork(1).Data;
  h1 = block.Dwork(3).Data;
  if block.InputPort(1).Data >= h1
     block.Dwork(5).Data = block.CurrentTime;
     block.OutputPort(1).Data = AS;
  else  
     AFS = block.Dwork(2).Data;
     DT  = block.Dwork(4).Data;
     t1  = block.Dwork(5).Data;
     if block.CurrentTime - t1 <= DT
        block.OutputPort(1).Data = AS+(AFS-AS)*(block.CurrentTime -t1)/DT;
     else
        block.OutputPort(1).Data = AFS; 
     end
  end
  if block.IsMajorTimeStep()
      isMajor = '** Major **';
  else
      isMajor = '   Minor';
  end
  fprintf('t=%7.3f h=%7.2f A=%4.1f %s\n',block.CurrentTime,... 
          block.InputPort(1).Data,block.OutputPort(1).Data,isMajor);
%endfunction