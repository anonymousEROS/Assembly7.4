	.data
prompt: .asciiz "Enter a 16-bit dividend: "
prompt1: .asciiz "\nEnter a 16-bit divisor: "
quotient: .asciiz "\nThe quotient is: "
remain:  .asciiz "\nThe remainder is: "
	.text
.globl main

main:

	li $v0, 4		#prompts message
	la $a0, prompt
	syscall
	
	li $v0,5		#gets number from user 
	syscall 
	move $t0, $v0
	
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0,5
	syscall 
	move $t1, $v0
	
    loop:
    	blt $t0, $t1, exit	#bracnch less than $t0 - $t1
    	sub $t0, $t0,$t1	#sub $t0-$t1 and sets to $t0
    	addi $t2, $t2,1         # adds sets to $t2
    	
    	j loop
    	
    exit:
    	li $v0, 4		#prints out the remianing info 
	la $a0, quotient
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, remain
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	
	
	
	
	
	
	li $v0, 10
	syscall
