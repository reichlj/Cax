function options = noteset(varargin)

% Print out possible values of properties.
if (nargin == 0) && (nargout == 0)
  fprintf('          name: [ Name ]\n');
  fprintf('      semester: [ Aktuelles Semester ]\n');
  fprintf('    informatik: [ Note in Informatik ]\n');
  fprintf('           tm1: [ Technische Mechanik 1 ]\n'); 
  fprintf('           tm2: [ Technische Mechanik 2 ]\n'); 
  fprintf('           tm3: [ Technische Mechanik 3 ]\n'); 
  fprintf('\n');
  return;
end

Names = [
    'name      '
    'semester  '
    'informatik'
    'tm1       '
    'tm2       '
    'tm3       '
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
      error('NoPropNameOrStruct %d', i);
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
  error('ArgNameValueMismatch');
end
expectval = 0;                          % start expecting a name, not a value
while i <= nargin
  arg = varargin{i};
  if ~expectval
    if ~ischar(arg)
      error('NoPropName %d', i);
    end
    lowArg = lower(arg);
    j = strmatch(lowArg,names);
    if isempty(j)                       % if no matches
      error('InvalidPropName %s', arg);
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
        error('AmbiguousPropName %s: %s',arg,matches);
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
  error('NoValueForProp %s', arg);
end