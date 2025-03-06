#
#	Name:	Joshua Beauchamp
#	Project:	1
#	Due:	3/1/24
#	Course:	cs-2640-02-sp24
#
#	Description:
#		The program prompts the user for an amount to be paid
#		and an amount tendered. From there, it calculates only the 
#		amount of coins that is left as change after the transaction.
#		It does not return the amount of dollars, only quarters, dimes,
#		nickels, and pennies.


	.data
title:	.asciiz	"Change by J. Beauchamp"
receipt:	.asciiz	"Enter the receipt amount? "
tender:	.asciiz	"Enter the amount tendered? "
quarteramt:	.asciiz	"Quarter: "
dimeamt:	.asciiz	"Dime:    "
nickelamt:	.asciiz	"Nickel:  "
pennyamt:	.asciiz	"Penny:   "


	.text
main:	
	la	$a0, title	# Prints title to screen
	li	$v0, 4
	syscall

	li	$a0, '\n'		# Prints two new line after title
	li	$v0, 11
	syscall
	syscall


	la	$a0, receipt	# Prompts the user to enter receipt amount
	li	$v0, 4
	syscall
	li	$v0, 5		# Reads the users input as the receipt amount
	syscall
	move	$t0, $v0

	la	$a0, tender	# Prompts the user to enter tender amount
	li	$v0, 4
	syscall
	li	$v0, 5		# Reads the users input as the tender amount
	syscall
	sub	$t0, $v0, $t0	# Calculates the change amount

	li	$a0, '\n'
	li	$v0, 11
	syscall

	li	$t1, 100		# Divides out the value of a dollar from change amount
	div	$t0, $t1		
	mfhi	$t0		

	li	$a0, '\n'
	li	$v0, 11
	syscall


	la	$a0, quarteramt	# Outputs users change for the quarters
	li	$v0, 4
	syscall

	li	$t1, 25
	div	$t0, $t1		# Calculates the quarter total
	mflo	$t0
	move	$a0, $t0		# Prints out the amount after division
	li	$v0, 1
	syscall
	mfhi	$t0


	li	$a0, '\n'
	li	$v0, 11
	syscall

	la	$a0, dimeamt	# Outputs users change for the dimes
	li	$v0, 4
	syscall

	
	li	$t1, 10
	div	$t0, $t1		# Calculates the dime total
	mflo	$t0
	move	$a0, $t0		# Prints out the amount after division
	li	$v0, 1
	syscall
	mfhi	$t0

	li	$a0, '\n'
	li	$v0, 11
	syscall

	la	$a0, nickelamt	# Outputs users change for the nickels
	li	$v0, 4
	syscall

	
	li	$t1, 5
	div	$t0, $t1		# Calculates the nickel total
	mflo	$t0
	move	$a0, $t0		# Prints out the amount after division
	li	$v0, 1
	syscall
	mfhi	$t0

	li	$a0, '\n'
	li	$v0, 11
	syscall


	la	$a0, pennyamt	# Outputs users change for the penny
	li	$v0, 4
	syscall
	mfhi	$t0
	move	$a0, $t0
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall
	li	$v0, 10		# Exits program
	syscall
	