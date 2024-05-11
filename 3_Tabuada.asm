.data
prompt: .asciiz "Digite um número para a tabuada: "
espaco: .asciiz " "

.text
    li $t4, 1           # Inicializa o multiplicador como 1
    li $t5, 10		# Final do multiplicador como 10

    li $v0, 4           # Usuário digitar um numero
    la $a0, prompt      
    syscall

    # Recebe o número do usuário
    li $v0, 5           # Syscall para ler inteiro
    syscall
    
    move $t1, $v0    # Move o número para $t1
    move $a0, $t1    # Move o número para $a0
    
    inicio:
    move $a0, $t1    # Move o número para $a0
    jal multiplica
    bgt $t4, $t5, saida
    
    li $v0, 4           # Syscall para imprimir um espaco
    la $a0, espaco
    syscall
    j inicio
    
    
multiplica:
    # Calcula e imprime o valor da tabuada
    mul $a0, $a0, $t4   # Calcula o valor da tabuada (número * multiplicador)
    li $v0, 1           # Syscall para imprimir inteiro
    syscall

    # Incrementa o multiplicador
    addi $t4, $t4, 1
    
    jr $ra 

    saida:
    li $v0, 10          # Syscall para terminar o programa
    syscall
