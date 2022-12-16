	.data
prompt: .asciiz "Enter a 16-bit number: "
prompt1: .asciiz "\nEnter another 16-bit number: "
results: .asciiz "\nThe product is :"
	.text
.globl main

main:

	li $v0, 4		#prompt user to enter a number
	la $a0, prompt
	syscall
	
	li $v0, 5		#Gets number from user 
	syscall
	move $t0, $v0
	
	li $v0, 4		#prompt user to enter a number
	la $a0, prompt1
	syscall
	
	li $v0, 5		#Gets number from user
	syscall
	move $t1, $v0
	
	move $t3, $t1		#stores $t1 into $t3
	
     loop:
        beq $t3, 0, exit         #uses $t3 and if statement for loop
     	addi $t3,$t3,-1		 #loop thats adds $t3 sub 1
     	add  $t2,$t2, $t0	 # add $t2 and $t0
     	j loop
     	
     	
     	
     	
     	
     exit:
        li $v0, 4		#prints out results 
	la $a0, results
	syscall
     	
     	li $v0, 1
	move $a0, $t2
	syscall
     	
	
	
	
	li $v0, 10		#ends program
	syscall