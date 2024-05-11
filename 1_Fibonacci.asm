.data
	fibo:
		.align 2
		.space 60
	espaco: 
		.asciiz " "
.text
	move $t4, $zero # indice do array
	li $t1, 1 # valor a ser colocado no array
	li $t2, 1 # valor a ser colocado no array
	li $t5, 60 # tamanho do array
	
	sw $t1, fibo($t4) # valor colocado na primeira posição
	addi $t4, $t4, 4 # vai para a posição [1] do array
	sw $t2, fibo($t4) # segundo valor do array
	addi $t4, $t4, 4 # vai para a posição [2] do array
	
	fibonacci:
		add $t3, $t1, $t2 # calcula o proximo numero de fibonacci
		sw $t3, fibo($t4) # armazena o valor no array
		move $t1, $t2 # pega o valor e o armazena na celula anterior
		move $t2, $t3  # pega o valor e o armazena na celula anterior
		addi $t4, $t4, 4 # incrementa a posição
		beq $t4, $t5, print # checa se chegou ao final do array
		j fibonacci
		
	print:
		move $t4, $zero
		imprime: # percorre novamente o array e imprime cada numero
			beq $t4, $t5, saida
			lw $a0, fibo($t4)
			li $v0, 1
			syscall
			
			addi $t4, $t4, 4
			
			la $a0, espaco
			li $v0, 4
			syscall
			
			j imprime
		saida:
		li $v0, 10
		syscall