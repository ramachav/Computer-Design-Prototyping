org 0x0000

ori $29, $0, 0xFFFC
ori $10, $0, 0x0001
ori $4, $0, 0x0006
ori $5, $0, 0x0001
ori $6, $0, 0x07E2
ori $7, $0, 0x07D0
ori $8, $0, 0x001E
ori $9, $0, 0x016D
ori $11, $0, 0x0000
ori $17, $0, 0x0000
ori $18, $0, 0x1000

subu $5, $5, $10
subu $6, $6, $7

push $5 #(Currentmonth - 1)
push $8 #30
jal multiplication_subroutine
pop $13 #(Currentmonth - 1)*30

push $6 #(Currentyear - 2000)
push $9 #365
jal multiplication_subroutine
pop $15 #(Currentyear - 2000)*365

addu $11, $11, $4
addu $11, $11, $13
addu $11, $11, $15

sw $11, 0($18)
halt

multiplication_subroutine:
pop $20
pop $21

multiplication_loop:
beq $21, $0, end_of_multiplication
addu $17, $17, $20
subu $21, $21, $10
j multiplication_loop

end_of_multiplication:
push $17
jr $31
