function d_in = read_image(filename)
% Check the number of input arguments.
if nargin < 1
   me = MException('MATLAB:notEnoughInputs','Not enough input arguments.');
   throw(me);
end
try
   fid = fopen(filename,'r');
   d_in = fread(fid);
catch ME1
  % Yes. Try modifying the filename extension.
  [filepath,name,ext] = fileparts(filename)
  switch ext
     case '.jpg' % Change jpg to jpeg
        filename = strrep(filename,'.jpg','.jpeg');
     case '.jpeg' % Change jpeg to jpg
        filename = strrep(filename,'.jpeg','.jpg');
     otherwise
        fprintf('File %s not found\n',filename);
        rethrow(ME1);
  end
  % Try again, with modified filenames.
  try
     fid = fopen(filename,'r');
     d_in = fread(fid);
  catch ME2
     fprintf('Unable to access file %s\n',filename);
     rethrow(ME2)
  end
end
end