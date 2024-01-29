#Shift-and-Add Multiplication
.data
multiplier: .word -7
multiplicand: .word 5
result: .word 0

.text
la a0, multiplier # Load address of multiplier into a0
lw a1, 0(a0) # Load value of multiplier into a1
la a2, multiplicand # Load address of multiplicand into a2
lw a3, 0(a2) # Load value of multiplicand into a3
li t0, 0 # Initialize t0 to 0 (accumulator)
li t1, 32 # Number of bits in a 32-bit architecture

# Check the sign of the multiplier
bltz a1, handle_negative1
j shift_and_add_loop
# Check the sign of the multiplier
bltz a3, handle_negative2
j shift_and_add_loop

handle_negative1:
neg a1, a1 # Negate multiplier if it is negative
handle_negative2:
neg a3, a3 # Negate multiplicand if it is negative

shift_and_add_loop:
beqz t1, end_shift_and_add # If t1 is zero, exit the loop
andi t2, a1, 1 # Get the least significant bit of a1
beqz t2, skip_add # If t2 is 0, skip addition
add t0, t0, a3 # Subtract multiplicand from the accumulator for negative result

skip_add:
srai a1, a1, 1 # Arithmetic right shift multiplier (divide by 2)
slli a3, a3, 1 # Left shift multiplicand (multiply by 2)
addi t1, t1, -1 # Decrement count
j shift_and_add_loop

end_shift_and_add:
la a4, result # Load address of result into a4
sw t0, 0(a4) # Store result in memory
# The result is now in memory at the address stored in a4
