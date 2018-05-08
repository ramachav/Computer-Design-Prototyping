#----------------------------------------------------------
# Vaibhav Ramachandran
# Parallel Algorithm that tests LL/SC functionality
# ramachav@purdue.edu
# Section 3
#----------------------------------------------------------


#----------------------------------------------------------
#REGISTERS
#at $1 at
#v $2-3 function returns
#a $4-7 function args
#t $8-15 temps
#s $16-23 saved temps (callee preserved)
#t $24-25 temps
#k $26-27 kernel
#gp $28 gp (callee preserved)
#sp $29 sp (callee preserved)
#fp $30 fp (callee preserved)
#ra $31 return address
#----------------------------------------------------------


#----------------------------------------------------------
# First Processor
#----------------------------------------------------------
  org 0x0000			#First processor start address
  ori $sp, $zero, 0x3ffc
  ori $t9, $zero, 256		#Setting some random temp register to store 256 (This tells us when to stop the program)
  ori $a2, $zero, lock_value   	#Move lock to arguement register
  jal mainp0
  halt

mainp0:
  ori $t5, $zero, 10		#Setting the seed for the crc generation to 10(A) (Some random number)
  push $ra			#Have to save the return address on the stack, otherwise there will be problems

first_number:
  or $a0, $zero, $t5		#CRC subroutine needs register a0 as the input so setting that to the seed
  jal crc32
  or $t7, $zero, $v0		#Storing the return value of the crc subroutine in some random temp register to be pushed onto the stack

  jal check_stack_full		#Check if anything can actually be stored onto the stack (It isn't full)
  jal lock			#Get the lock (Need it to push the randomly generated value on to the stack)
  jal push_function		#Push the value onto your stack
  jal unlock              	#Release the lock
  or $t5, $zero, $t7		#Setting the temp register that initially had the seed to the return value of the crc subroutine (This becomes the new seed)


generate_crc_number:
  or $a0, $zero, $t5		#CRC subroutine needs register a0 as the input so setting that to the seed
  jal crc32
  or $t7, $zero, $v0		#Storing the return value of the crc subroutine in some random temp register to be pushed onto the stack

  jal check_stack_full		#Check if anything can actually be stored onto the stack (It isn't full)
  jal lock			#Get the lock (Need it to push the randomly generated value on to the stack)
  jal push_function		#Push the value onto your stack
  jal unlock              	#Release the lock
  or $t5, $zero, $t7		#Setting the temp register that initially had the seed to the return value of the crc subroutine (This becomes the new seed)

loop_checker:
  addi $t9, $t9, -1		#Decrement the counter
return_back:
  bne $t9, $zero, generate_crc_number	#Check if you're supposed to be done or not. If not, do the whole thing again till you get to 256

  pop $ra			#Get back the return address that was initially put on the stack (Make sure you get the right one)
  jr $ra
#----------------------------------------------------------


#----------------------------------------------------------
# Second Processor
#----------------------------------------------------------
  org 0x0200			#Second processor start address
  ori $sp, $zero, 0x7ffc
  ori $a2, $zero, lock_value   	#Move lock to argument register
  ori $t9, $zero, 256		#Setting some random temp register to store 256 (This tells us when to stop the program)
  or $s7, $zero, $zero		#Register that will store the sum of all the numbers
  ori $s6, $zero, 0xffff	#Register that will store the minimum of all the numbers
  or $s5, $zero, $zero		#Register that will store the maximum of all the numbers
  jal mainp1
  halt

mainp1: 
  push $ra			#Have to save the return address on the stack, otherwise there will be problems

time_to_pop_from_stack:
  jal check_stack_empty		#Check if the stack actually has anything or not (It isn't empty)
  jal lock			#Get the lock (Need it to pop the randomly generated value from the stack)
  jal pop_function		#Pop the value from your stack
  jal unlock              	#Release the lock
  andi $a1, $v0, 0xffff		#Store the popped value into an argument register to pass into the min/max subroutines (Use only lower 16 bits)

min_max_sum_calculation:
min_part:
  jal min			#Call the min function
  or $s6, $zero, $v0		#Store the return value of the min function as the new minimum of all the numbers
max_part:
  jal max			#Call the max function
  or $s5, $zero, $v0		#Store the return value of the max function as the new maximum of all the numbers
sum_part:
  add $s7, $s7, $a1		#Add the value popped from the stack to the sum register

loop_check:
  addi $t9, $t9, -1		#Decrement the counter
restart_procedure:
  bne $t9, $zero, time_to_pop_from_stack	#Check if you're supposed to be done or not. If not, do the whole thing again till you get to 256

average_calculation:
  srl $s4, $s7, 8		#Store the quotient into a different register than the one that had the total sum	

store_results_in_memory:
  ori   $t2, $zero, average_result	#Load the address into some random temp register
  sw    $s4, 0($t2)			#Store the average in the address
  ori   $t2, $zero, minimum_result	#Load the address into some random temp register
  sw    $s6, 0($t2)			#Store the minimum in the address
  ori   $t4, $zero, maximum_result	#Load the address into some random temp register
  sw    $s5, 0($t4)			#Store the maximum in the address

  pop $ra			#Get back the return address that was initially put on the stack (Make sure you get the right one)
  jr $ra
#----------------------------------------------------------


#----------------------------------------------------------
# Lock/Unlock Subroutine
#----------------------------------------------------------
# pass in an address to lock function in argument register 2
# returns when lock is available
lock:
aquire:
  ll    $t0, 0($a2)         	#Load lock location
  bne   $t0, $zero, aquire     	#Wait on lock to be open
  addiu $t0, $t0, 1
  sc    $t0, 0($a2)
  beq   $t0, $zero, lock       	#If sc failed retry
  jr    $ra

# pass in an address to unlock function in argument register 2
# returns when lock is free
unlock:
  sw    $zero, 0($a2)
  jr    $ra

lock_value:
  cfw 0x0
#----------------------------------------------------------


#----------------------------------------------------------
# Push/Pop Subroutine
# pushes value in $t7 onto the stack
# pops value from current location in the stack into $v0
#----------------------------------------------------------
push_function:
  ori $t0, $zero, common_stack_pointer		#Loads the address where the current stack pointer resides, into a temp register
  lw $t1, 0($t0)				#Loads the address in that address into another temp register
  addi $t1, $t1, -4				#Decrement the stack pointer so that it points to the next available address
  sw $t7, 0($t1)				#Stores the randomly generated crc value into the address that the stack pointer currently points to
  sw $t1, 0($t0)				#Stores the updated current address, that the stack pointer points to, back into common_stack_pointer
  jr $ra

pop_function:
  ori $t0, $zero, common_stack_pointer		#Loads the address where the current stack pointer resides, into a temp register
  lw $t1, 0($t0)				#Loads the address in that address into another temp register
  lw $v0, 0($t1)				#Loads the randomly generated crc value from the address that the stack pointer points to, into the return register 
  addi $t1, $t1, 4				#Increment the stack pointer
  sw $t1, 0($t0)				#Stores the updated current address, that the stack pointer points to, back into common_stack_pointer
  jr $ra
#----------------------------------------------------------


#----------------------------------------------------------
# Check stack full/Check stack empty Subroutine
#----------------------------------------------------------
check_stack_full:
  ori $t3, $zero, common_stack_pointer		#Loads the address where the current stack pointer resides, into a temp register
  ori $t4, $zero, 0x9100			#Loads the address where the stack ends into a temp register (Last address allocated for the stack)
  lw $t6, 0($t3)				#Loads the address in that address into another temp register
  beq $t6, $t4, check_stack_full		#Checks if the two registers match. If they do, means the stack is full. Have to wait till it isn't

  jr $ra

check_stack_empty:
  ori $t3, $zero, common_stack_pointer		#Loads the address where the current stack pointer resides, into a temp register
  ori $t4, $zero, 0x9128			#Loads the address where the stack starts into a temp register (First address allocated for the stack)
  lw $t6, 0($t3)				#Loads the address in that address into another temp register
  beq $t4, $t6, check_stack_empty		#Checks if the two registers match. If they do, means the stack is empty. Have to wait till it isn't

  jr $ra
#----------------------------------------------------------


#----------------------------------------------------------
# CRC Subroutine
#----------------------------------------------------------
# USAGE random0 = crc(seed), random1 = crc(random0)
#       randomN = crc(randomN-1)
#----------------------------------------------------------
# $v0 = crc32($a0)
crc32:
  lui $t1, 0x04C1
  ori $t1, $t1, 0x1DB7
  or $t2, $zero, $zero
  ori $t3, $zero, 32

l1:
  slt $t4, $t2, $t3
  beq $t4, $zero, l2

  srl $t4, $a0, 31
  sll $a0, $a0, 1
  beq $t4, $zero, l3
  xor $a0, $a0, $t1
l3:
  addiu $t2, $t2, 1
  j l1
l2:
  or $v0, $a0, $zero
  jr $ra
#----------------------------------------------------------


#----------------------------------------------------------
# Min/Max Subroutine
#----------------------------------------------------------
# registers
# s5 = a
# a1 = b
# v0 = result

#-max (s5=a,a1=b) returns v0=max(a,b)----------------------
max:
  push  $ra
  push  $s5
  push  $a1
  or    $v0, $zero, $s5
  slt   $t0, $s5, $a1
  beq   $t0, $zero, maxrtn
  or    $v0, $zero, $a1
maxrtn:
  pop   $a1
  pop   $s5
  pop   $ra
  jr    $ra
#----------------------------------------------------------
# registers
# s6 = a
# a1 = b
# v0 = result

#-min (s6=a,a1=b) returns v0=min(a,b)----------------------
min:
  push  $ra
  push  $s6
  push  $a1
  or    $v0, $zero, $s6
  slt   $t0, $a1, $s6
  beq   $t0, $zero, minrtn
  or    $v0, $zero, $a1
minrtn:
  pop   $a1
  pop   $s6
  pop   $ra
  jr    $ra
#----------------------------------------------------------


#----------------------------------------------------------
# Final Results
#----------------------------------------------------------
  org 0x9000
average_result:
  cfw 0x0
minimum_result:
  cfw 0x0
maximum_result:
  cfw 0x0
#----------------------------------------------------------


#----------------------------------------------------------
# Common Stack Start and End points 
# Starts: 0x9128       Ends: 0x9100
#----------------------------------------------------------
  org 0x9130
common_stack_pointer:
  cfw 0x9128
#----------------------------------------------------------
