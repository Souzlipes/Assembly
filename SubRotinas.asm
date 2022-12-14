.data
 prompt: .asciiz "Qual seu nome? "
 saudacao: .asciiz "Ola, "
 nome: .space 25
 idade: .asciiz "Qual sua matricula? "
 quebra: .asciiz "\n"
 
.text
PrintString: addi $v0, $zero, 4 
 syscall
 jr $ra

.text
 LerString: 
 li $v0, 8 #Impimimos a pergunta e usamos o codigo 8 para setar o nome
 la $a0, nome
 la $a1, 25
 syscall
 jr $ra
 
.text
 ImprimeSaudacao: #i
 li $v0, 4 #codigo 4 para impressão da saudação
 la $a0, saudacao
 syscall
 jr $ra
 
 .text
 EscreveString: #Impimimos o nome
 li $v0, 4 #codigo 4 para impressão do nome
 la $a0, nome
 syscall
 jr $ra

.text
 LerInt: 
 li $v0,5 # leitura da matricula
 syscall
 jr $ra

.text
 EscreveInt: 
 move $a0,$t1
 li $v0,1
 syscall
 jr $ra
 
.text
fim: 
 li $v0,10 # Finaliza o protrama
 syscall

