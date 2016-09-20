% This script runs two simple examples of latexTable.m
clc; clear input;

%% Example 1: a very simple example
% Clear the selected options from previous example
clear input;
fprintf('\n\nExample 1: a very simple example\n\n');

input.data = [1,2;3,4]; 
latex = latexTable(input);


%% Example 2: generate a table and save as a LaTex file
% Clear the selected options from previous example
clear input;
fprintf('\n\nExample 2: generate a LaTex file from your data\n\n');

% some data
input.data = [1,2;3,4]; 

% we want a complete LaTex document
input.makeCompleteLatexDocument = 1;

% generate LaTex code
latex = latexTable(input);

% save LaTex code as file
fid=fopen('MyLatex.tex','w');
[nrows,ncols] = size(latex);
for row = 1:nrows
    fprintf(fid,'%s\n',latex{row,:});
end
fclose(fid);
fprintf('\n... your LaTex code has been saved as ''MyLatex.tex'' in your working directory\n');


%% Example 3: using an numerical array as data input
clear input;
fprintf('\n\nExample 3: using an array as data input\n\n');

% numeric values you want to tabulate:
% this field has to be an array or a MATLAB table
% in this example we use an array
input.data = [1.12345 NaN 3.12345; ...
    4.12345 5.12345 6.12345; ...
    7.12345 8.12345 9.12345; ...
    10.12345 11.12345 12.12345];

% Optional fields:

% Set column labels (use empty string for no label):
input.tableColLabels = {'col1','col2','col3'};
% Set row labels (use empty string for no label):
input.tableRowLabels = {'row1','row2','','row4'};

% Switch transposing/pivoting your table:
input.transposeTable = 0;

% Determine whether input.dataFormat is applied column or row based:
input.dataFormatMode = 'column'; % use 'column' or 'row'. if not set 'colum' is used

% Formatting-string to set the precision of the table values:
% For using different formats in different rows use a cell array like
% {myFormatString1,numberOfValues1,myFormatString2,numberOfValues2, ... }
% where myFormatString_ are formatting-strings and numberOfValues_ are the
% number of table columns or rows that the preceding formatting-string applies.
% Please make sure the sum of numberOfValues_ matches the number of columns or
% rows in input.tableData!
%
input.dataFormat = {'%.3f',2,'%.1f',1}; % three digits precision for first two columns, one digit for the last

% Define how NaN values in input.tableData should be printed in the LaTex table:
input.dataNanString = '-';

% Column alignment in Latex table ('l'=left-justified, 'c'=centered,'r'=right-justified):
input.tableColumnAlignment = 'c';

% Switch table borders on/off (borders are enabled by default):
input.tableBorders = 1;

% Uses booktabs basic formating rules ('1' = using booktabs, '0' = not using booktabs). 
% Note that this option requires the booktabs package being available in your LaTex. 
% Also, setting the booktabs option to '1' overwrites input.tableBorders if it exists.
% input.booktabs = 0;


% LaTex table caption:
input.tableCaption = 'MyTableCaption';

% LaTex table label:
input.tableLabel = 'MyTableLabel';

% Switch to generate a complete LaTex document or just a table:
input.makeCompleteLatexDocument = 1;

% call latexTable:
latex = latexTable(input);


%% Example 4: using a MATLAB table as data input
% Clear the selected options from previous example
clear input;
fprintf('\n\nExample 4: using MATLAB table datatype as data input\n\n');
% Please note: since the table datatype was introduced in MATLAB version r2013b,
% you cannot use this feature in older versions of MATLAB!
% Check MATLAB version:
DateNumberThisVersion = datenum(version('-date'),'mmmm dd, yyyy');
if DateNumberThisVersion < 735459 % MATLAB r2013b release day was datenumber 735459
    fprintf('\n\nCannot run example 4: This MATLAB version does not support datatype ''table''!\n');
    return;
end

% Set up a MATLAB table (similar to example used in MATLAB docs):
% Please note that the resulting LaTex table is row-based, not
% column-based. So the LaTex table is a 'transposed' copy of the MATLAB table.
LastName = {'Smith';'Johnson';'Williams';'Jones';'Brown'};
Age = [38;43;38;40;49];
Height = [71;69;64;67;64];
Weight = [176;163;131;133;119];
T = table(Age,Height,Weight,'RowNames',LastName);

% Now use this table as input in our input struct:
input.data = T;

% Set the row format of the data values (in this example we want to use
% integers only):
input.dataFormat = {'%i'};

% Column alignment ('l'=left-justified, 'c'=centered,'r'=right-justified):
input.tableColumnAlignment = 'c';

% Switch table borders on/off:
input.tableBorders = 1;

% Switch to generate a complete LaTex document or just a table:
input.makeCompleteLatexDocument = 1;

% Now call the function to generate LaTex code:
latex = latexTable(input);


%% Example 5: using string data that includes LaTex code in a MATLAB table
% Clear the selected options from previous example
clear input;
fprintf('\n\nExample 5: using string data that includes LaTex code in a MATLAB table\n\n');
% Please note: Make sure to enclose your LaTex code parts in $-environments!
% e.g if you want to have a '\pm' for plotting a plus-minus symbol your code
% should be '$\pm$'

% Set up data and store it in a MATLAB table
rowNames = {'row1'; 'row2'};
var1={'5.4 $\pm$ .01'; '6.4 $\pm$ .01'};
var2={'50.4 $\pm$ .02'; '60.4 $\pm$ .02'};
T = table(var1, var2,  'RowNames', rowNames);

% Now use this table as input in our input struct:
input.data = T;

% Switch transposing/pivoting your table if needed:
input.transposeTable = 0;

% Switch to generate a complete LaTex document or just a table:
input.makeCompleteLatexDocument = 1;

% Now call the function to generate LaTex code:
latex = latexTable(input);
