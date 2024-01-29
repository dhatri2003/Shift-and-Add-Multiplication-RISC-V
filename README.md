# Multiplication with Shift and Add

## Overview:
This project explores multiplication using the shift-and-add technique, a method comparable to traditional pencil-and-paper multiplication. In this procedure, the multiplier (Y) is added to the multiplicand (X) Y times.

## Methodology:
The multiplication process involves taking the multiplier's digits one at a time, working from right to left. For each digit, the multiplicand is multiplied by the digit, and the intermediate product is positioned to the left of the previous results.

## Flow Chart:
A detailed flow chart illustrating the multiplication process is available in the accompanying PDF file.

## Implementation:
```python
# Sample code 
def multiply_with_shift_and_add(X, Y):
    result = 0
    while Y > 0:
        if Y % 2 == 1:
            result += X
        X <<= 1  # Left shift by 1 (multiply by 2)
        Y >>= 1  # Right shift by 1 (divide by 2)
    return result

