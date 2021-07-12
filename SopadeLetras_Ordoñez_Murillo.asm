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
;printn ' !!      Bienvenido al juego de sopa de letras   !!' 

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
;jz animalesv2
jmp errorIngreso

animalesv1:
call nwLine
printn 'Usted ha escogido animales - version 1'
call nwLine
;Asignacion de palabras
lea si, palabraA1
mov byte ptr[si],'p'
mov byte ptr[si+1],'e'
mov byte ptr[si+2],'r'
mov byte ptr[si+3],'r'
mov byte ptr[si+4],'o'
lea si, palabraA2
mov byte ptr[si],'a'
mov byte ptr[si+1],'v'
mov byte ptr[si+2],'e'
lea si, palabraA3
mov byte ptr[si],'p'
mov byte ptr[si+1],'e'
mov byte ptr[si+2],'z'
lea si, palabraA4
mov byte ptr[si],'g'
mov byte ptr[si+1],'a'
mov byte ptr[si+2],'t'
mov byte ptr[si+3],'o'
lea si, palabraA5
mov byte ptr[si],'c'
mov byte ptr[si+1],'o'
mov byte ptr[si+2],'n'
mov byte ptr[si+3],'e'
mov byte ptr[si+4],'j'
mov byte ptr[si+5],'o'

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
mov byte ptr[si],72
mov byte ptr[si+1],86
mov byte ptr[si+2],100
mov byte ptr[si+3],114
lea si,posA5
mov byte ptr[si],139
mov byte ptr[si+1],125
mov byte ptr[si+2],111
mov byte ptr[si+3],97
mov byte ptr[si+4],83
mov byte ptr[si+5],69

lea si, animales1


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

call esAcierto 
cld

cmp aciertos, 5
jnz MainView
jz WIN


cld 
jmp MainView  
;comparar palabra
WIN:
call nwLine
printn "Felicidades Has Ganado $"
call nwLine

cld 
jmp exit 


;;;;;; VEHICULOS  ;;;;;;;
vehiculos:
call nwLine
printn 'Usted ha escogido vehiculos de transporte'
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
;jz vehiculosv1
cmp al, 32h
;jz vehiculosv2
jmp errorIngreso


;;;;;; LENGUAJES  ;;;;;;;

lenguajes:
call nwLine
printn 'Usted ha escogido lenguajes de programacion'
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
;jz lenguajesv1
cmp al, 32h
;jz lenguajesv2
jmp errorIngreso




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
mov di,0001h
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
encontrada db " - ya encontrada"

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
add di, ax
mov cl, byte ptr[di] 
mov byte ptr[si+bx], cl
add i,1
add al,1
cmp cl,226
jz equal
jnz agregacionP1

setP2:
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
add di, ax
mov cl, byte ptr[di] 
mov byte ptr[si+bx], cl
add i,1
add al,1
cmp cl,226
jz equal
jnz agregacionP2

setP3:
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
add di, ax
mov cl, byte ptr[di] 
mov byte ptr[si+bx], cl
add i,1
add al,1
cmp cl,226
jz equal
jnz agregacionP3

setP4:
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
add di, ax
mov cl, byte ptr[di] 
mov byte ptr[si+bx], cl
add i,1
add al,1
cmp cl,226
jz equal
jnz agregacionP4

setP5: 
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
add di, ax
mov cl, byte ptr[di] 
mov byte ptr[si+bx], cl
add i,1
add al,1
cmp cl,226
jz equal
jnz agregacionP5 
  
esAcierto ENDP
         
;;;;;;; FIN PROCEMIENTOS ;;;;;;;;

     
errorIngreso:
CALL nwLine 
CALL nwLine
printn '!! Favor ingresar un valor valido !! . . .'
CALL nwLine 
CALL nwLine
jmp menuInicio

  
exit:
end         
          
          
          
