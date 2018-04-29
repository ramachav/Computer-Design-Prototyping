#----------------------------------------------------------
# Vaibhav Ramachandran
# Dual Core Freebie Program
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
  ori $zero, $zero, 0xDEAD	#Random Instruction that shouldn't do anything
  halt


#----------------------------------------------------------
# Second Processor
#----------------------------------------------------------
  org 0x0200			#Second processor start address
  ori $zero, $zero, 0xBEEF	#Random Instruction that shouldn't do anything
  halt
