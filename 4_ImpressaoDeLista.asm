.data
numb: .asciiz "Digite o primeiro valor: "
numc: .asciiz "Digite o segundo valor: "
resultado: .asciiz "Resultado: "
espaco: .asciiz " "

.text 
# imprimir o numb para o primeiro valor
li $v0 , 4 
la $a0 , numb
syscall

# ler o primeiro valor
li $v0 , 5
syscall
move $t0 , $v0

# imprimir o numc para o segundo valor
li $v0 , 4
la $a0 , numc 
syscall

# ler o segundo valor
li $v0 , 5
syscall
move $t1 , $v0

# verificar se o primeiro valor é menor que o segundo
beq $t0 , $t1 , checa_igual
blt $t0, $t1, menor
bgt $t0, $t1, maior 

checa_igual:
# imprimir o valor se forem iguais
li $v0 , 4
la $a0 , resultado
syscall

li $v0, 1
move $a0 , $t0
syscall

j fim

menor:
# imprimir valores do primeiro ao segundo
li $v0 , 4
la $a0 , resultado
syscall

loop_menor:
li $v0 , 1
move $a0, $t0
syscall

li $v0, 4
la $a0, espaco
syscall

beq $t0, $t1, fim
addi $t0, $t0, 1
j loop_menor

maior:
# imprimir valores do segundo ao primeiro
li $v0 , 4
la $a0 , resultado
syscall

loop_maior:
li $v0, 1
move $a0, $t0
syscall

li $v0, 4
la $a0, espaco
syscall

beq $t0, $t1, fim
subi $t0, $t0, 1
j loop_maior

fim:
li $v0, 10
syscall