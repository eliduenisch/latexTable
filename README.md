# latexTable
This MATLAB function converts matrices, cells or tables from MATLAB to LaTeX table code. It is easy to use and very flexible:
- takes MATLAB matrices, cells or tables as input
- gives code for a LaTeX table containing your data as output
- handles numeric and text/string data
- easy including in your code for automation
- easy direct saving as a LaTex document (see example 2 in runExamples.m)

Optional features are:
- table positioning
- column/row labels
- column/row-wise formatting (like setting the number of digits etc.)
- pivoting the table (90 degree rotation making columns rows and vice versa)
- setting the default symbol for NaN values
- LaTeX column alignment
- LaTeX table borders, caption, label
- Use of the booktabs latex package
- output a complete LaTeX document instead of a plain table


![alt tag](https://cloud.githubusercontent.com/assets/12258734/13790805/724c99e0-eaea-11e5-8cb7-fc73122dd84d.png)


The workflow is straightforward. Here is a little example:

1. set up the input struct:
`input.data=[1,3;4,2];`

2. call the function:
`latexTable(input)`

3. copy&paste the generated LaTex code into your favourite LaTex editor

For further details and examples can be found in latexTable.m and runExamples.m or visit the [release page at the MathWorks File Exchange] (http://www.mathworks.com/matlabcentral/fileexchange/44274-latextable).
