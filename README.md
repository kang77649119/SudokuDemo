# SudokuDemo
九宫格的实现原理

#重点是计算出元素的X轴和Y轴坐标
通过观察可以发现，同一行的元素Y轴相同，同一列的元素X轴相同
那么根据行和列就可以准备的计算出元素的坐标

#行和列如何计算？
通过元素下标(从0开始)与每行元素个数可以找出规律
X轴：下标与个数取模
Y轴：下标与个数取余
