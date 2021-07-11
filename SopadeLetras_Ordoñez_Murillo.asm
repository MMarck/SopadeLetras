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
msgPalabra    db  " Ingresa una palabra: $"
palabra        db 100,?, 100 dup(' ') 

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
mov bx, 0000h
call printSoup
;pedir palabra
mov dx, offset msgPalabra
mov ah, 9
int 21h
; input a string:
mov dx, offset palabra
mov ah, 0ah
int 21h
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


printSoup PROC
    
printArray:
mov dx,0000h
mov ah, 02h
mov dl,animales1[bx]
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
jnz printArray
    
RET    
printSoup ENDP    
         
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
          
          
          
