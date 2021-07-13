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
msgVersion db "Ingrese una version (1 o 2): $"


;variables para el ingreso de palabras
msgPalabra      db  " Ingresa una palabra: $"
bufferPalabra   db 14,?, 14 dup(' ')  
aciertos        db 0
haRenunciado    db 0




animales1   db 'BUBRPQYFODFZXIQ'
            db 'MSVDJVQDTLOEATF'
            db 'RCZPIFYGAZLPMFN'
            db 'LVWKFFBKDXHFIUW'
            db 'AOSEFQEMOOTGQUR'
            db 'ELLWTGNJJKAJISJ'
            db 'OVCOXLUEQTSDDSP'
            db 'UEAEMTNYOLVYMGI'
            db 'ORREPOMJZGYPHAI'
            db 'IFTLCBJFVOYHLUB'
            db 'WTOWZQFRAXQRLMR'
            db 'KGNYIIHHHKFUKIJ'
            db 'XMLSACGMVXEYSIT'
            db 'TSOESQVSEQRFNPU'
            db 'ODDQMDFWRGETDLY'
 
animales2   db 'GFTTESFLVXBCNKN'
            db 'WOUHHIEWJRBMOCY'
            db 'SARZEXFQOILXEFJ'
            db 'SCVIBJJFAEXBLAW'
            db 'RDUCLZZTMOFXCHO'
            db 'PIHJYAMPKNKOFFC'
            db 'PANDAHYMCSFCASM'
            db 'ATVHFXQZBMNSDLL'
            db 'ESBURMUDJQPPYRO'
            db 'EIFXOAALKPCIJOB'
            db 'RUVNHKTORTWDPDO'
            db 'XTALKIBKCEJXQVP'
            db 'NMVWISPWOBVXQCE'
            db 'KAGIWKOEXXHKSNJ'
            db 'DBWIPFHWPKVSFJQ'
         
vehiculos1  db 'KZARUTAMJSMZQTP'
            db 'MERTUHVWULFFKIL'
            db 'RTRFDINBBFPDIOX'
            db 'CEFOFXTOUNVGCWV'
            db 'NCKXECWMIIFJEDB'
            db 'NHDHXJAVEVBODXG'
            db 'NDAUXSIYPFAMCAK'
            db 'CEJYFMNJIIELSTW'
            db 'YKIOIIPHICZHQIN'
            db 'XRKRBBIUMDSJWDH'
            db 'NWLJBAPOCDQEDNW'
            db 'MYURINFCFZTPNAN'
            db 'FIKHLGDRRSZQRYM'
            db 'JIAZORRACRRGSGJ'
            db 'UEVAQMXBQZLEOQG'

vehiculos2  db 'APAGMZYPEDZBCBV'
            db 'GGGAOZQVITIRGNK'
            db 'WYUVTHYVSCECOFU'
            db 'QIHWODXKIQCCAHX'
            db 'MIIHMRICJTDPCRU'
            db 'ZFDNHYLTTEMAFYL'
            db 'OXMDCESAGQTWTNP'
            db 'YEFETURKXPPZUWQ'
            db 'ZOMAMJULOZXNCOL'
            db 'NOIMACLIKDSEURD'
            db 'GYRALXJSTSEPKGH'
            db 'YIZCHCAGWCQGXDX'
            db 'VOKJOODSICOTDLA'
            db 'DNSRBYLSFZISZUI'
            db 'LOCOMOTORABSPOF'
            
lenguajes1  db 'CTHCEQRQSSOGLFM'
            db 'PRAHSCZTQPSTAMK'
            db 'JZCRNWMDYGYWCEA'
            db 'BMAKCWJTJYNOSGT'
            db 'MDRZXFHVRIBXAAA'
            db 'QWFPTOCUUEJUPRT'
            db 'PWBKNAHRIYAZRSA'
            db 'XXXIXWRAFUVHQZK'
            db 'IGCHBGBRBQAWHKG'
            db 'LFDQIDYKWJFLNBQ'
            db 'OOQQONPTEKNRILW'
            db 'GJYPPDOLNIJZBXY'
            db 'KSVXEKAOXQHDBFZ'
            db 'ZVZKXDBBGMFLHXB'
            db 'HZRVKLCEIKWHXBA'
            
lenguajes2  db 'SLKFMBCULKVYUIM'
            db 'TWCDQFYIVIKUXKB'
            db 'GNIWEQBOSYEMDTJ'
            db 'WDHFZZPUIEDERYQ'
            db 'KMTGTKAKROMUSUV'
            db 'BELBLLTUVJQHCRW'
            db 'UPLUBYJKNUXORLF'
            db 'SGMAOOEENBOGIWR'
            db 'JVSTLPTEGPPNPJW'
            db 'YINCASSEMBLYTTU'
            db 'CHWTIOIWORDZDRV'
            db 'BRZCNRAVRWAMUNU'
            db 'KOMCOUKNGQEPQVS'
            db 'XXRXJUJUBEXVGGA'
            db 'MNKJQKZAACVCLDW'
        
flag db 0

palabraA1       db 12 dup (' ') ;perro, foca, avion, bicicleta, csharp, assembly
palabraA2       db 12 dup (' ') ;ave, lobo, carro, locomotora, python, swift
palabraA3       db 12 dup (' ') ;pez, gorila, barco, camion, java, clojure
palabraA4       db 12 dup (' ') ;gato, panda, tren, moto, ruby, visualbasic
palabraA5       db 12 dup (' ') ;conejo, leon, bus, jet, pascal, rscript

posA1 db 12 dup(226)
posA2 db 12 dup(226)
posA3 db 12 dup(226)
posA4 db 12 dup(226)
posA5 db 12 dup(226)

indx db 50 dup (226)
i db 0  

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
jmp errorIngreso 


;;;;;; ANIMALES  ;;;;;;;

animales:
call nwLine
printn 'Usted ha escogido animales'
;esta partecita imprime un mensaje y
;pide el valor para la version
CALL nwLine
CALL nwLine
lea dx, msgVersion
mov ah, 09h
int 21h
MOV AH, 01h
INT 21h

;Esta parte hace la bifurcacion entre version 1 o 2
cmp al, 31h
jz animalesv1 
cmp al, 32h
jz animalesv2
jmp errorIngreso

animalesv1:
call nwLine
printn 'Usted ha escogido animales - version 1'
call nwLine
printn '(i) puede escribir (renuncio) para salir'
call nwLine
;Asignacion de palabras
lea si, palabraA1
mov byte ptr[si],   'p'
mov byte ptr[si+1], 'e'
mov byte ptr[si+2], 'r'
mov byte ptr[si+3], 'r'
mov byte ptr[si+4], 'o'
lea si, palabraA2
mov byte ptr[si],   'a'
mov byte ptr[si+1], 'v'
mov byte ptr[si+2], 'e'
lea si, palabraA3
mov byte ptr[si],   'p'
mov byte ptr[si+1], 'e'
mov byte ptr[si+2], 'z'
lea si, palabraA4
mov byte ptr[si],   'g'
mov byte ptr[si+1], 'a'
mov byte ptr[si+2], 't'
mov byte ptr[si+3], 'o'
lea si, palabraA5
mov byte ptr[si],   'c'
mov byte ptr[si+1], 'o'
mov byte ptr[si+2], 'n'
mov byte ptr[si+3], 'e'
mov byte ptr[si+4], 'j'
mov byte ptr[si+5], 'o'

lea si, posA1
mov byte ptr[si],124
mov byte ptr[si+1],123
mov byte ptr[si+2],122
mov byte ptr[si+3],121
mov byte ptr[si+4],120
lea si,posA2
mov byte ptr[si],107
mov byte ptr[si+1],91
mov byte ptr[si+2],75
lea si,posA3
mov byte ptr[si],41
mov byte ptr[si+1],26
mov byte ptr[si+2],11
lea si,posA4
mov byte ptr[si],71
mov byte ptr[si+1],85
mov byte ptr[si+2],99
mov byte ptr[si+3],113
lea si,posA5
mov byte ptr[si],139
mov byte ptr[si+1],125
mov byte ptr[si+2],111
mov byte ptr[si+3],97
mov byte ptr[si+4],83
mov byte ptr[si+5],69

lea si, animales1
call printArrays
jmp MainView

animalesv2:
call nwLine
printn 'Usted ha escogido ANIMALES - version 2'
call nwLine
printn '(i) puede escribir (renuncio) para salir'
call nwLine
;Asignacion de palabras escondidas
lea si, palabraA1
mov byte ptr[si],   'f'
mov byte ptr[si+1], 'o'
mov byte ptr[si+2], 'c'
mov byte ptr[si+3], 'a'
lea si, palabraA2
mov byte ptr[si],   'l'
mov byte ptr[si+1], 'o'
mov byte ptr[si+2], 'b'
mov byte ptr[si+3], 'o'
lea si, palabraA3
mov byte ptr[si],   'g'
mov byte ptr[si+1], 'o'
mov byte ptr[si+2], 'r'
mov byte ptr[si+3], 'i'
mov byte ptr[si+4], 'l'
mov byte ptr[si+5], 'a'
lea si, palabraA4
mov byte ptr[si],   'p'
mov byte ptr[si+1], 'a'
mov byte ptr[si+2], 'n'
mov byte ptr[si+3], 'd'
mov byte ptr[si+4], 'a'
lea si, palabraA5
mov byte ptr[si],   'l'
mov byte ptr[si+1], 'e'
mov byte ptr[si+2], 'o'
mov byte ptr[si+3], 'n'

;posiciones de las letras
;de las palabras escondidas
lea si, posA1
mov byte ptr[si],100
mov byte ptr[si+1],86
mov byte ptr[si+2],72
mov byte ptr[si+3],58
lea si,posA2
mov byte ptr[si],119
mov byte ptr[si+1],134
mov byte ptr[si+2],149
mov byte ptr[si+3],164
lea si,posA3
mov byte ptr[si],0
mov byte ptr[si+1],16
mov byte ptr[si+2],32
mov byte ptr[si+3],48
mov byte ptr[si+4],64
mov byte ptr[si+5],80
lea si,posA4
mov byte ptr[si],90
mov byte ptr[si+1],91
mov byte ptr[si+2],92
mov byte ptr[si+3],93
mov byte ptr[si+4],94
lea si,posA5
mov byte ptr[si],57
mov byte ptr[si+1],42
mov byte ptr[si+2],27
mov byte ptr[si+3],12

lea si, animales2
call printArrays
jmp MainView

;;;;;; VEHICULOS  ;;;;;;;
vehiculos:
call nwLine
printn 'Usted ha escogido VEHICULOS DE TRANSPORTE'
;esta partecita imprime un mensaje y
;pide el valor para la version
CALL nwLine
CALL nwLine
lea dx, msgVersion
mov ah, 09h
int 21h
MOV AH, 01h
INT 21h

;Esta parte hace la bifurcacion entre version 1 o 2
cmp al, 31h
jz vehiculosv1
cmp al, 32h
jz vehiculosv2
jmp errorIngreso

vehiculosv1:
call nwLine

printn 'Usted ha escogido VEHICULOS - version 1'
call nwLine
printn '(i) puede escribir (renuncio) para salir'
call nwLine
;Asignacion de palabras
lea si, palabraA1
mov byte ptr[si],   'a'
mov byte ptr[si+1], 'v'
mov byte ptr[si+2], 'i'
mov byte ptr[si+3], 'o'
mov byte ptr[si+4], 'n'
lea si, palabraA2
mov byte ptr[si],   'c'
mov byte ptr[si+1], 'a'
mov byte ptr[si+2], 'r'
mov byte ptr[si+3], 'r'
mov byte ptr[si+4], 'o'
lea si, palabraA3
mov byte ptr[si],   'b'
mov byte ptr[si+1], 'a'
mov byte ptr[si+2], 'r'
mov byte ptr[si+3], 'c'
mov byte ptr[si+4], 'o'
lea si, palabraA4
mov byte ptr[si],   't'
mov byte ptr[si+1], 'r'
mov byte ptr[si+2], 'e'
mov byte ptr[si+3], 'n'
lea si, palabraA5
mov byte ptr[si],   'b'
mov byte ptr[si+1], 'u'
mov byte ptr[si+2], 's'

lea si, posA1
mov byte ptr[si],100
mov byte ptr[si+1],84
mov byte ptr[si+2],68
mov byte ptr[si+3],52
mov byte ptr[si+4],36
lea si,posA2
mov byte ptr[si],203
mov byte ptr[si+1],202
mov byte ptr[si+2],201
mov byte ptr[si+3],200
mov byte ptr[si+4],199
lea si,posA3
mov byte ptr[si],217
mov byte ptr[si+1],202
mov byte ptr[si+2],187
mov byte ptr[si+3],172
mov byte ptr[si+4],157
lea si,posA4
mov byte ptr[si],18
mov byte ptr[si+1],32
mov byte ptr[si+2],46
mov byte ptr[si+3],60
lea si,posA5
mov byte ptr[si],37
mov byte ptr[si+1],23
mov byte ptr[si+2],9

lea si, vehiculos1
call printArrays
jmp MainView

vehiculosv2:
call nwLine
printn 'Usted ha escogido VEHICULOS - version 2'
call nwLine
printn '(i) puede escribir (renuncio) para salir'
call nwLine
;Asignacion de palabras
lea si, palabraA1
mov byte ptr[si],   'b'
mov byte ptr[si+1], 'i'
mov byte ptr[si+2], 'c'
mov byte ptr[si+3], 'i'
mov byte ptr[si+4], 'c'
mov byte ptr[si+5], 'l'
mov byte ptr[si+6], 'e'
mov byte ptr[si+7], 't'
mov byte ptr[si+8], 'a'
lea si, palabraA2
mov byte ptr[si],   'l'
mov byte ptr[si+1], 'o'
mov byte ptr[si+2], 'c'
mov byte ptr[si+3], 'o'
mov byte ptr[si+4], 'm'
mov byte ptr[si+5], 'o'
mov byte ptr[si+6], 't'
mov byte ptr[si+7], 'o'
mov byte ptr[si+8], 'r'
mov byte ptr[si+9], 'a'
lea si, palabraA3
mov byte ptr[si],   'c'
mov byte ptr[si+1], 'a'
mov byte ptr[si+2], 'm'
mov byte ptr[si+3], 'i'
mov byte ptr[si+4], 'o'
mov byte ptr[si+5], 'n'
lea si, palabraA4
mov byte ptr[si],   'm'
mov byte ptr[si+1], 'o'
mov byte ptr[si+2], 't'
mov byte ptr[si+3], 'o'
lea si, palabraA5
mov byte ptr[si],   'j'
mov byte ptr[si+1], 'e'
mov byte ptr[si+2], 't'

lea si, posA1
mov byte ptr[si],11
mov byte ptr[si+1],25
mov byte ptr[si+2],39
mov byte ptr[si+3],53
mov byte ptr[si+4],67
mov byte ptr[si+5],81
mov byte ptr[si+6],95
mov byte ptr[si+7],109
mov byte ptr[si+8],123
lea si,posA2
mov byte ptr[si],210
mov byte ptr[si+1],211
mov byte ptr[si+2],212
mov byte ptr[si+3],213
mov byte ptr[si+4],214
mov byte ptr[si+5],215
mov byte ptr[si+6],216
mov byte ptr[si+7],217
mov byte ptr[si+8],218
mov byte ptr[si+9],219
lea si,posA3
mov byte ptr[si],135
mov byte ptr[si+1],136
mov byte ptr[si+2],137
mov byte ptr[si+3],138
mov byte ptr[si+4],139
mov byte ptr[si+5],140
lea si,posA4
mov byte ptr[si],4
mov byte ptr[si+1],19
mov byte ptr[si+2],34
mov byte ptr[si+3],49
lea si,posA5
mov byte ptr[si],68
mov byte ptr[si+1],84
mov byte ptr[si+2],100

lea si, vehiculos2
call printArrays
jmp MainView

;;;;;; LENGUAJES  ;;;;;;;

lenguajes:
call nwLine
printn 'Usted ha escogido LENGUAJES DE PROGRAMACION'
;esta partecita imprime un mensaje y
;pide el valor para la version
CALL nwLine
CALL nwLine
lea dx, msgVersion
mov ah, 09h
int 21h
MOV AH, 01h
INT 21h

;Esta parte hace la bifurcacion entre version 1 o 2
cmp al, 31h
jz lenguajesv1
cmp al, 32h
jz lenguajesv2
jmp errorIngreso

lenguajesv1:
call nwLine
printn 'Usted ha escogido LENGUAJES - version 1'
call nwLine
printn '(i) puede escribir (renuncio) para salir'
call nwLine
;Asignacion de palabras

lea si, palabraA1
mov byte ptr[si],   'c'
mov byte ptr[si+1], 's'
mov byte ptr[si+2], 'h'
mov byte ptr[si+3], 'a'
mov byte ptr[si+4], 'r'
mov byte ptr[si+5], 'p'
lea si, palabraA2
mov byte ptr[si],   'p'
mov byte ptr[si+1], 'y'
mov byte ptr[si+2], 't'
mov byte ptr[si+3], 'h'
mov byte ptr[si+4], 'o'
mov byte ptr[si+5], 'n'
lea si, palabraA3
mov byte ptr[si],   'j'
mov byte ptr[si+1], 'a'
mov byte ptr[si+2], 'v'
mov byte ptr[si+3], 'a'
lea si, palabraA4
mov byte ptr[si],   'r'
mov byte ptr[si+1], 'u'
mov byte ptr[si+2], 'b'
mov byte ptr[si+3], 'y'
lea si, palabraA5
mov byte ptr[si],   'p'
mov byte ptr[si+1], 'a'
mov byte ptr[si+2], 's'
mov byte ptr[si+3], 'c'
mov byte ptr[si+4], 'a'
mov byte ptr[si+5], 'l'

lea si, posA1
mov byte ptr[si],16
mov byte ptr[si+1],17
mov byte ptr[si+2],18
mov byte ptr[si+3],19
mov byte ptr[si+4],20
mov byte ptr[si+5],21
lea si,posA2
mov byte ptr[si],24
mov byte ptr[si+1],38
mov byte ptr[si+2],52
mov byte ptr[si+3],66
mov byte ptr[si+4],80
mov byte ptr[si+5],94
lea si,posA3
mov byte ptr[si],85
mov byte ptr[si+1],100
mov byte ptr[si+2],115
mov byte ptr[si+3],130
lea si,posA4
mov byte ptr[si],54
mov byte ptr[si+1],70
mov byte ptr[si+2],86
mov byte ptr[si+3],102
lea si,posA5
mov byte ptr[si],12
mov byte ptr[si+1],27
mov byte ptr[si+2],42
mov byte ptr[si+3],57
mov byte ptr[si+4],72
mov byte ptr[si+5],87

lea si, lenguajes1
call printArrays
jmp MainView 

lenguajesv2:
call nwLine
printn 'Usted ha escogido lenguajes de programacion - version 2'
call nwLine
printn '(i) puede escribir (renuncio) para salir'
call nwLine
;Asignacion de palabras
lea si, palabraA1
mov byte ptr[si],   'a'
mov byte ptr[si+1], 's'
mov byte ptr[si+2], 's'
mov byte ptr[si+3], 'e'
mov byte ptr[si+4], 'm'
mov byte ptr[si+5], 'b'
mov byte ptr[si+6], 'l'
mov byte ptr[si+7], 'y'
lea si, palabraA2
mov byte ptr[si],   's'
mov byte ptr[si+1], 'w'
mov byte ptr[si+2], 'i'
mov byte ptr[si+3], 'f'
mov byte ptr[si+4], 't'
lea si, palabraA3
mov byte ptr[si],   'c'
mov byte ptr[si+1], 'l'
mov byte ptr[si+2], 'o'
mov byte ptr[si+3], 'j'
mov byte ptr[si+4], 'u'
mov byte ptr[si+5], 'r'
mov byte ptr[si+6], 'e'
lea si, palabraA4
mov byte ptr[si],   'v'
mov byte ptr[si+1], 'i'
mov byte ptr[si+2], 's'
mov byte ptr[si+3], 'u'
mov byte ptr[si+4], 'a'
mov byte ptr[si+5], 'l'
mov byte ptr[si+6], 'b'
mov byte ptr[si+7], 'a'
mov byte ptr[si+8], 's'
mov byte ptr[si+9], 'i'
mov byte ptr[si+10],'c'
lea si, palabraA5
mov byte ptr[si],   'r'
mov byte ptr[si+1], 's'
mov byte ptr[si+2], 'c'
mov byte ptr[si+3], 'r'
mov byte ptr[si+4], 'i'
mov byte ptr[si+5], 'p'
mov byte ptr[si+6], 't'

lea si, posA1
mov byte ptr[si],139
mov byte ptr[si+1],140
mov byte ptr[si+2],141
mov byte ptr[si+3],142
mov byte ptr[si+4],143
mov byte ptr[si+5],144
mov byte ptr[si+6],145
mov byte ptr[si+7],146
lea si,posA2
mov byte ptr[si],0
mov byte ptr[si+1],16
mov byte ptr[si+2],32
mov byte ptr[si+3],48
mov byte ptr[si+4],64
lea si,posA3
mov byte ptr[si],54
mov byte ptr[si+1],68
mov byte ptr[si+2],82
mov byte ptr[si+3],96
mov byte ptr[si+4],110
mov byte ptr[si+5],124
mov byte ptr[si+6],138
lea si,posA4
mov byte ptr[si],10
mov byte ptr[si+1],24
mov byte ptr[si+2],38
mov byte ptr[si+3],52
mov byte ptr[si+4],66
mov byte ptr[si+5],80
mov byte ptr[si+6],94
mov byte ptr[si+7],108
mov byte ptr[si+8],122
mov byte ptr[si+9],136
mov byte ptr[si+10],150
lea si,posA5
mov byte ptr[si],57
mov byte ptr[si+1],72
mov byte ptr[si+2],87
mov byte ptr[si+3],102
mov byte ptr[si+4],117
mov byte ptr[si+5],132
mov byte ptr[si+5],147

lea si, lenguajes2
call printArrays
jmp MainView


     
; >>>> Loop del Juego <<<<<
 call printArrays ;primera vista de la sopa


MainView:
;call printArrays
mov bx, 0000h
;call printSoup
;pedir palabra
mov dx, offset msgPalabra
mov ah, 9
int 21h
; input a string:
mov dx, offset bufferPalabra
mov ah, 0ah
int 21h

call toLowerBuffer

call esRenuncia
cmp haRenunciado,1
jz LOSE 

call esAcierto 
cld


cmp aciertos, 5
jnz MainView
jz WIN


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

;imprime array
printArrays proc


mov bx,0000h
printArray:
mov dx,0000h
mov ah, 02h
mov dl,byte ptr[si+bx]
call valueinArray
cmp flag,1
jz printSpecial
int 21h
mov dl, 20h
int 21h
add bx, 1
add cl, 1
cmp cl,15
jz nextRow
jnz printArray


nextRow:
call nwLine
add ch,1
mov cl, 00h
cmp ch,15
jz finproc
jnz printArray

printSpecial:



push ax
push bx
push cx
push dx

mov dh,00h
mov al, dl
mov bh, 0
mov bl, 1111_0000b
mov cx, 1; calculate message size. 
mov dx,0000h
mov ah, 9h
int 10h
mov bh, 00h
mov ah, 03h
int 10h
mov ah,02h
add dl,1
int 10h 
mov dl, 20h
int 21h

pop dx
pop cx
pop bx
pop ax
add bx, 1
add cl, 1
cmp cl,15
jz nextRow
jnz printArray

finproc:

ret
printArrays endp

;Verifica que un elemento este en el array
valueInArray proc

mov flag, 0
mov di,0000h
iterar:
mov dh, indx[di]
cmp dh,226
jz finvalueproc
cmp bl,dh
jz found
add di,1
jmp iterar
found:
mov flag,1
jmp finvalueproc:



finvalueproc:
ret
valueInArray endp

;Borrar el bufer de entrada
clearBuffer PROC
xor bx, bx
mov bl, bufferPalabra[1]
mov bufferPalabra[bx+2], ' '

looop:    
mov bufferPalabra[bx+2], ' '
sub bl,1
cmp bl,0
jz bay
jnz looop

bay:
ret
 
clearBuffer ENDP


 
esAcierto PROC
jmp inicio    
    
size = 12  ; tamanio de todas las palabras
 
 
p1  db 0
p2  db 0
p3  db 0
p4  db 0
p5  db 0


inicio:
;quitar caracteres raros al input
xor bx, bx
mov bl, bufferPalabra[1]
mov bufferPalabra[bx+2], ' '
;inicializacion de segmentos
push si
mov     ax, cs
mov     ds, ax
mov     es, ax
lea     si, bufferPalabra[2]
mov     cx, size 

;Es perro?
lea     di, palabraA1
repe    cmpsb
jz      setP1

;Es ave?
mov     ax, cs
mov     ds, ax
mov     es, ax
lea     si, bufferPalabra[2]
lea     di, palabraA2
repe    cmpsb
jz      setP2 
;Es pez?
mov     ax, cs
mov     ds, ax
mov     es, ax
lea     si, bufferPalabra[2]
lea     di, palabraA3
repe    cmpsb
jz      setP3
;Es gato?
mov     ax, cs
mov     ds, ax
mov     es, ax
lea     si, bufferPalabra[2]
lea     di, palabraA4
repe    cmpsb
jz      setP4
;Es conejo?
mov     ax, cs
mov     ds, ax
mov     es, ax
lea     si, bufferPalabra[2]
lea     di, palabraA5
repe    cmpsb
jz      setP5
jnz     not_equal ; NINGUNA
 
yes db " - Yes $"
no  db " - No$"
encontrada db " - ya encontrada$"

equal:
pop si
pop dx
pop cx
pop bx
pop ax

lea dx, yes
mov ah, 9
int 21h
CALL nwLine
call clearBuffer
call printArrays
RET

not_equal:
pop si
lea dx, no
mov ah, 9
int 21h
CALL nwLine
call clearBuffer
RET

yaEncontrada:
lea dx, encontrada
mov ah, 9
int 21h
CALL nwLine
call clearBuffer
RET

setP1:
;verifica si la palabra 1 fue encontrada
pop si
cmp p1, 1
jz yaEncontrada
;actualiza variable y muestra mensaje
mov p1, 1
add aciertos, 1
push ax
push bx
push cx
push dx
push si
mov ax,0000h
mov bx,0000h
mov cx,0000h
mov dx,0000h
mov si,0000h
lea di,posA1
agregacionP1:
mov bl,i
lea si,indx
mov cl, byte ptr[di]
cmp cl,226
jz equal
add di, 1 
mov byte ptr[si+bx], cl
add i,1
add al,1
jnz agregacionP1

setP2:
pop si
cmp p2, 1
jz yaEncontrada
mov p2, 1
add aciertos, 1
push ax
push bx
push cx
push dx
push si
mov ax,0000h
mov bx,0000h
mov cx,0000h
mov dx,0000h
mov si,0000h
lea di,posA2
agregacionP2:
mov bl,i
lea si,indx
mov cl, byte ptr[di]
cmp cl,226
jz equal
add di, 1 
mov byte ptr[si+bx], cl
add i,1
add al,1
jmp agregacionP2

setP3:
pop si
cmp p3, 1
jz yaEncontrada
add aciertos, 1
mov p3, 1
push ax
push bx
push cx
push dx
push si
mov ax,0000h
mov bx,0000h
mov cx,0000h
mov dx,0000h
mov si,0000h
lea di,posA3
agregacionP3:
mov bl,i
lea si,indx
mov cl, byte ptr[di]
cmp cl,226
jz equal
add di, 1 
mov byte ptr[si+bx], cl
add i,1
add al,1
jmp agregacionP3

setP4:
pop si
cmp p4, 1
jz yaEncontrada
add aciertos, 1
mov p4, 1
push ax
push bx
push cx
push dx
push si
mov ax,0000h
mov bx,0000h
mov cx,0000h
mov dx,0000h
mov si,0000h
lea di,posA4
agregacionP4:
mov bl,i
lea si,indx
mov cl, byte ptr[di]
cmp cl,226
jz equal
add di, 1 
mov byte ptr[si+bx], cl
add i,1
add al,1
jmp agregacionP4

setP5:
pop si 
cmp p5, 1
jz yaEncontrada
add aciertos, 1
mov p5, 1
push ax
push bx
push cx
push dx
push si
mov ax,0000h
mov bx,0000h
mov cx,0000h
mov dx,0000h
mov si,0000h
lea di,posA5
agregacionP5:
mov bl,i
lea si,indx
mov cl, byte ptr[di]
add di, 1 
mov byte ptr[si+bx], cl
add i,1
add al,1
cmp cl,226
jz equal
jnz agregacionP5 
  
esAcierto ENDP


;>>> comprobacion para saber si 
;>>> el usuario renuncio
esRenuncia PROC
jmp comparacion    
clave db "renuncio    "    

comparacion:    

;quitar caracteres raros al input
xor bx, bx
mov bl, bufferPalabra[1]
mov bufferPalabra[bx+2], ' '
;inicializacion de segmentos
push si
mov     ax, cs
mov     ds, ax
mov     es, ax
lea     si, bufferPalabra[2]
mov     cx, 12 

;Es renuncia?
lea     di, clave
repe    cmpsb
jz      setRenuncia
pop si
RET

setRenuncia:
mov haRenunciado, 1
pop si
ret
    
esRenuncia ENDP

;Convierte la variable
;bufferPalabra a minuscula
toLowerBuffer PROC

mov bx, 1
mov cl, 26
 
loopCaracteres:
mov ch, 40h
inc bx
cmp bx, size
jz  terminar

; aqui se asigna al array deseado
mov al, bufferPalabra[bx]
     
    ;ciclo para comparar 
    ; del ascci 41 al 5A     
    de_41_a_5A:
    inc ch
    cmp al, ch
    jz convertir
    ;end ciclo
    cmp ch, 5Ah
    jnz de_41_a_5A
    jz loopCaracteres

convertir:
;desplazar al equivalente minuscula
add al, 20h            
mov bufferPalabra[bx],al 

cmp bx, size
jnz loopCaracteres

terminar:
RET    
    
toLowerBuffer ENDP    
         
;;;;;;; FIN PROCEMIENTOS ;;;;;;;;

     
errorIngreso:
CALL nwLine 
CALL nwLine
printn '!! Favor ingresar un valor valido !! . . .'
CALL nwLine 
CALL nwLine
jmp menuInicio
 
 
;MENSAJE SE VICTORIA
WIN:
call nwLine
printn "Felicidades Has Ganado"
call nwLine
jmp exit 

;MENSAJE SE DERROTA
LOSE:
call nwLine
printn "Buena suerte la proxima"
call nwLine
jmp exit 
 
  
exit:
end         
          
          
          
