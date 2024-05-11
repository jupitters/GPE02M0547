.data
	numero: .asciiz "Digite um número: "
	
.text
	li $v0, 4
	la $a0, numero
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $a1, 1
	li $s0, 1
	jal fatorial
	
	fatorial:
	bgt $a1, $t0, sair
	mul $s0, $a1, $s0
	add $a1, $a1, 1
	j fatorial
	jr $ra
	
	sair:
	li $v0, 1
	move $a0, $s0
	syscall
	