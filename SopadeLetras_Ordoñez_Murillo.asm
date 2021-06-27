;libreria de emu8086 (solo para usar la funcion "printn" )
include 'emu8086.inc' 
ORG 100h            

;;;;;;; VARIABLES ;;;;;;;;
.data
msgInicio1 db " Por favor ingrese un numero para seleccionar$"
msgInicio2 db " una de las siguientes categorias:$"
msgOP1 db " 1 - Animales$"
msgOP2 db " 2 - Vehiculos de transporte$"
msgOP3 db " 3 - Lenguajes de programacion$"
msgSelect db "Ingrese el numero de la categoria deseada: $"
array db 'BUBRPQYFODFZXIQ'
      db 'MSVDJVQDTLOEATF' 
 
;;;;;;; FIN VARIABLES ;;;;;;;;

;Declaracion del punto de inicio del programa
.stack
.code
.start up


;Inicializacion de los registros
mov ax,0000h  
mov bx,0000h
mov cx,0000h
mov dx,0000h
     
      
           
;Este bloque de codigo imprime el mensaje de bienvenida y 
;toma la opcion de categoria para inciar el juego           
menuInicio: 

CALL nwLine
printn ' !!      Bienvenido al juego de sopa de letras   !!' 

CALL nwLine
MOV AH, 09h
LEA DX,msgInicio1
INT 21h  

CALL nwLine
MOV AH, 09h
LEA DX,msgInicio2
INT 21h 
         
         
CALL nwLine
CALL nwLine
MOV AH, 09h
LEA DX,msgOP1
INT 21h  

CALL nwLine
MOV AH, 09h
LEA DX,msgOP2
INT 21h  

CALL nwLine
MOV AH, 09h
LEA DX,msgOP3
INT 21h

;esta partecita imprime un mensaje y
;pide el valor para la categoria
CALL nwLine
CALL nwLine
MOV AH, 09h
LEA DX,msgSelect
INT 21h
MOV AH, 01h
INT 21h       

;Esta parte va a hacer la comparacion
cmp al, 31h
jz animales
cmp al, 32h
jz vehiculos
cmp al, 33h
jz lenguajes  

animales:
call nwLine
printn 'Usted ha escogido animales'
call nwLine
mov bx, 0000h
jmp printArray

vehiculos:
call nwLine
printn 'Usted ha escogido vehiculos de transporte'
jmp exit

lenguajes:
call nwLine
printn 'Usted ha escogido lenguajes de programacion'
jmp exit

printArray:
mov dx,0000h
mov ah, 02h
mov cx, 0000h
outerLoop:
call nwLine
mov cl, 00h
add ch,1
cmp ch,2
jz exit
jnz innerLoop:
    innerLoop:
    mov dl,array[bx]
    int 21h
    mov dl, 20h
    int 21h
    add bx,1
    add cl,1
    cmp cl,15
    jz outerLoop:
    jnz innerLoop:




;;;;;;; PROCEMIENTOS ;;;;;;;;


;NUEVA LINEA: Este procedimiento realiza un salto de linea           
nwLine PROC
MOV AH,02h
MOV DX,0Ah; imprime asscii 10 (nueva linea)
INT 21h
MOV DX,0Dh; imprime asscii 13 (retorno de carro)
INT 21h
RET
nwLine ENDP            
         
;;;;;;; FIN PROCEMIENTOS ;;;;;;;;

exit:
end         
          
          
          
