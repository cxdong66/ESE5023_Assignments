# Question 1

## 1.1(5/5)

The data in the txt file was separated by `tab`, R can handle this by:

 `read.csv(file = file_path, header = T, sep = "\t")`

## 1.2(5/5)

In `summarise`, you should use `=` to define the new variable.

## 1.3(10/10)

You should `groupby` first, then `sum` to get the count, otherwise you will lost these points with zero value.

## 1.4(10/10)

For reading convenience, use `return()` statement at the end of a function to explicitly show the value you want to return.

Use `return(list(total_num = xxx, largest = yyy))` to return multiple values.

Notice that the same largest earthquake could happen on more than one date.

# Question 2(10/10)

Notice that the scaling factor of wind speed is 10

# Question 3(10/10)