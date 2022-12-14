#Reliazado a leitura de nomes e matricula
#Realizado a operação da equação proposta - Grupo 1
#Alunos: Luis Felipe de Souza, Arthur Lima, João pedro Oliveira, Renato Haniel e Victor Henrry
#Data: 12/12/2022

#Leituras de String e Int puxadas do arquivo Atividade1-5.asm


.data
 perguntaCOEFICIENTES: .asciiz "Informe os coeficientes (a, b, c ,d): "
 perguntaVARIAVEIS: .asciiz "Informe as variaveis independentes (x, y, z): "
 
 Resultado: .asciiz "Resultado da Funçãof(x,y,z): "
 	
 x: .asciiz"Informe o valor de x  :" 
 y: .asciiz"Informe o valor de y  :" 
 z: .asciiz"Informe o valor de z  :" 
 a: .asciiz"Informe o valor de a  :" 
 bb: .asciiz"Informe o valor de b  :" 
 c: .asciiz"Informe o valor de c  :" 
 d: .asciiz"Informe o valor de d  :" 

.text
main:

 li $t2, 3 
 move $t0,$zero
 While:
  bgt $t0, $t2, saida
  
  la $a0, prompt 
  jal PrintString 
  jal LerString 
  jal ImprimeSaudacao 
  jal EscreveString 
  la $a0, idade
  jal PrintString 
  jal LerInt 
  move $t1, $v0
  jal EscreveString 
  jal EscreveInt 
  
  la $a0, quebra 
  jal PrintString 
  
  addi $t0, $t0, 1
  j While 
 saida:
 
 jal Funcao_desafio
 
 j fim
 

 #Codigo para calcular a função
.text
Funcao_desafio:
#Leitura dos coeficientes

 la $a0, perguntaCOEFICIENTES
 jal PrintString
		
 la $a0, a
 jal PrintString
 jal LerInt
 move $t1,$v0
 
 				
 la $a0, bb
 jal PrintString
 jal LerInt
 move $t9,$v0
		
 la $a0, c
 jal PrintString
 jal LerInt
 move $t6,$v0
	
 la $a0, d
 jal PrintString
 jal LerInt
 move $s1,$v0
		
 #Leitura das variÃ¡veis
 la $a0, perguntaVARIAVEIS
 jal PrintString
		
 la $a0, x
 jal PrintString
 jal LerInt
 move $a1,$v0
		
 la $a0, y
 jal PrintString
 jal LerInt
 move $a2,$v0
		
 la $a0, z
 jal PrintString
 jal LerInt
 move $a3,$v0
		
 #Calculo 		
 li $t0,5  #constante 5
		
 # 5 . a
 mult $t0,$t1
 mflo $t3

 #x.x.x.x
 mult $a1,$a1
 mflo $t2
 mult $t2,$a1
 mflo $t2
 mult $t2,$a1
 mflo $t2

 #(5.a).(x.x.x.x)
 mult $t2,$t3     
 mflo $t2 #valor primeira operação

 li $t0,3 #constatnte 3


 #3.b
 mult $t0,$t9
 mflo $t4

 #x.x
 mult $a1,$a1
 mflo $t5

 #(3.b).(x.x)
 mult $t4,$t5
 mflo $s7 #Valor segunda operação

 #((5.a).(x.x.x.x))-((3.b).(x.x))
 sub $t8,$t2,$s7 #Valor terceira operação

 li $t7,7 #Contante 7

 #7.c
 mult $t7,$t6
 mflo $t0

#y.y.y
 mult $a2,$a2
 mflo $t2
 mult $t2,$a2
 mflo $t2

 # (7.c).(y.y.y)
 mult $t0,$t2
 mflo $t3 #Valor quarta operaçãp

 li $s2,2


 #(2.d)
 mult $s1,$s2
 mflo $s3
 
 li $k0,-1

#z.z
 mult $a3,$a3
 mflo $t5

 li $k0,-1 

#(2.d).z.z
 mult $s3,$t5
 mflo $s2
 mult $s2,$k0 #Transforma a operação em negativo
 mflo $s2 #Valor quinta operação

#((7.c).(y.y.y))-((2.d).z.z)
 add $s3,$t3,$s2 #Valor Sexta operação

 #((5.a).(x.x.x.x))-((3.b).(x.x))+((7.c).(y.y.y))-((2.d).z.z)
 add $s4,$t8,$s3
		
 la $a0 , Resultado
 jal PrintString
		
 move $a0,$s4
 jal EscreveInt
		
 #Fim
 li $v0, 10
 syscall
 jr $ra


.include ".\SubRotinas.asm" 
