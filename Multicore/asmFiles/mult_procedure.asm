org 0x0000

ori $29, $0, 0xFFFC
ori $22, $0, 0xFFF8 #To check the stack pointer against to tell if the procedure is finished or not
ori $23, $0, 0x1000 #Random memory location to store the result

#Three operands to be multiplied in this case. Can be more if needed
ori $4, $0, 0x0004
ori $5, $0, 0x0005
ori $6, $0, 0x0006
ori $8, $0, 0x0001 #1 will be needed to subtract from the second operand during multiplication
ori $9, $0, 0x0000 #random register initialized to zero to store the final value

#push all the operands on to the stack at the start

push $4
push $5
push $6

multiplication_procedure:

beq $29, $22, procedure_finished
jal multiplication_subroutine
j multiplication_procedure

procedure_finished:
pop $9
sw $9, 0($23)
halt

multiplication_subroutine:
pop $4
pop $5
ori $9, $0, 0x0000

multiplication_loop:
beq $5, $0, end_of_multiplication
addu $9, $9, $4
subu $5, $5, $8
j multiplication_loop

end_of_multiplication:
push $9
jr $31   #returns back to the point before the start of the subroutine
