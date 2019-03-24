function options = odeset(varargin)

% Print out possible values of properties.
if (nargin == 0) && (nargout == 0)
  fprintf('          AbsTol: [ positive scalar or vector {1e-6} ]\n');
  fprintf('          RelTol: [ positive scalar {1e-3} ]\n');
  fprintf('     NormControl: [ on | {off} ]\n');
  fprintf('     NonNegative: [ vector of integers ]\n'); 
  fprintf('       OutputFcn: [ function_handle ]\n');
  fprintf('       OutputSel: [ vector of integers ]\n');
  fprintf('          Refine: [ positive integer ]\n');  
  fprintf('           Stats: [ on | {off} ]\n');
  fprintf('     InitialStep: [ positive scalar ]\n');
  fprintf('         MaxStep: [ positive scalar ]\n');
  fprintf('             BDF: [ on | {off} ]\n');
  fprintf('        MaxOrder: [ 1 | 2 | 3 | 4 | {5} ]\n');
  fprintf('        Jacobian: [ matrix | function_handle ]\n');
  fprintf('        JPattern: [ sparse matrix ]\n');
  fprintf('      Vectorized: [ on | {off} ]\n');
  fprintf('            Mass: [ matrix | function_handle ]\n');
  fprintf('MStateDependence: [ none | {weak} | strong ]\n');
  fprintf('       MvPattern: [ sparse matrix ]\n');
  fprintf('    MassSingular: [ yes | no | {maybe} ]\n');
  fprintf('    InitialSlope: [ vector ]\n');
  fprintf('          Events: [ function_handle ]\n');
  fprintf('\n');
  return;
end

Names = [
    'AbsTol          '
    'BDF             '
    'Events          '
    'InitialStep     '
    'Jacobian        '
    'JConstant       '             % backward compatibility
    'JPattern        '
    'Mass            '
    'MassSingular    '
    'MaxOrder        '
    'MaxStep         '
    'NonNegative     ' 
    'NormControl     '
    'OutputFcn       '
    'OutputSel       '
    'Refine          '
    'RelTol          '
    'Stats           '
    'Vectorized      '
    'MStateDependence'
    'MvPattern       '
    'InitialSlope    '    
    ];
m = size(Names,1);
names = lower(Names);

% Combine all leading options structures o1, o2, ... in odeset(o1,o2,...).
options = [];
for j = 1:m
  options.(deblank(Names(j,:))) = [];
end
i = 1;
while i <= nargin
  arg = varargin{i};
  if ischar(arg) || (isstring(arg) && isscalar(arg)) % arg is an option name
    break;
  end
  if ~isempty(arg)                      % [] is a valid options argument
    if ~isa(arg,'struct')
      error(message('MATLAB:odeset:NoPropNameOrStruct', i));
    end
    for j = 1:m
      if any(strcmp(fieldnames(arg),deblank(Names(j,:))))
        val = arg.(deblank(Names(j,:)));
      else
        val = [];
      end
      if ~isempty(val)
        options.(deblank(Names(j,:))) = val;
      end
    end
  end
  i = i + 1;
end
% Convert string arguments and options.
for ii = 1:nargin
    if isstring(varargin{ii}) && isscalar(varargin{ii})
        varargin{ii} = char(varargin{ii});
    end
end

% A finite state machine to parse name-value pairs.
if rem(nargin-i+1,2) ~= 0
  error(message('MATLAB:odeset:ArgNameValueMismatch'));
end
expectval = 0;                          % start expecting a name, not a value
while i <= nargin
  arg = varargin{i};
    
  if ~expectval
    if ~ischar(arg)
      error(message('MATLAB:odeset:NoPropName', i));
    end
    
    lowArg = lower(arg);
    j = strmatch(lowArg,names);
    if isempty(j)                       % if no matches
      error(message('MATLAB:odeset:InvalidPropName', arg));
    elseif length(j) > 1                % if more than one match
      % Check for any exact matches (in case any names are subsets of others)
      k = strmatch(lowArg,names,'exact');
      if length(k) == 1
        j = k;
      else
            matches = deblank(Names(j(1),:));
        for k = j(2:length(j))'
                matches = [matches ', ' deblank(Names(k,:))]; %#ok<AGROW>
        end
            error(message('MATLAB:odeset:AmbiguousPropName',arg,matches));
      end
    end
    expectval = 1;                      % we expect a value next
    
  else
    options.(deblank(Names(j,:))) = arg;
    expectval = 0;
      
  end
  i = i + 1;
end

if expectval
  error(message('MATLAB:odeset:NoValueForProp', arg));
end
