    include 'emu8086.inc' 
.stack
.model 100h
.data
x db ?
y db ?
b db ?
c db ? 
d db ? 
z db ? 
tsa db ?
tsb db ?
tsc db ? 
msg1 db '***************************************$'
msg2 db '          WELCOME TO QUIZ              $'
msg3 db '***************************************$'
msg4 db 'Enter The Buzzer$'
msg5 db 'Enter The Option$'
msg6 db 'Team1 Has Entered The Buzzer$'
msg7 db 'Team2 Has Entered The Buzzer$'
msg8 db 'Team3 Has Entered The Buzzer$'
msg9 db 'TEAM-1 HAS SCORED$'
msg10 db 'TEAM-2 HAS SCORED$'
msg11 db 'TEAM_3 HAS SCORED$'
msg12 db 'TEAM1 IS THE WINNER$'
msg13 db 'TEAM2 IS THE WINNER$'
msg15 db 'TEAM3 IS THE WINNER$'
msg14 db 'MATCH DRAW$'
msg16 db 'TEAM-1 AND TEAM-2 ARE SELECTED FOR THE NEXT LEVEL$'
msg17 db 'TEAM-2 AND TEAM-3 ARE SELECTED FOR THE NEXT LEVEL$'
msg18 db 'TEAM-3 AND TEAM-1 ARE SELECTED FOR THE NEXT LEVEL$'
msg22 db '###################################################$' 
msg19 db '**CONGRATS**.YOU HAVE ENTERED TO THE NEXT LEVEL$'   
msg20 db '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^$' 
msg23 db '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!$'
qn1 db '1.How Many Bites Make A Bite?$'
q1op db 'A)4 B)3 C)8$'
qn2 db '2.RAM Stands For:?$'
q2op db 'A)Random Arbitary Memory  B)Random Access Memory C)Read Access Memory$'
qn3 db '3.ROM Stands For:?$'
q3op db 'A)Read Only Memory B)Read Object Memory C)Random Object Memory$' 
qn4 db '4.Which Of The Following Is Not A Programming Language=?.$'
q4op db 'A)KNOTCH   B)JAVA   C)BASIC$'
qn5 db '5.What Does WWW STANDS For=?.$'
q5op db 'A)WORLD WIDE WRESTLING  B)WACKY,WILD,WONDERFUL   C)WORLD WIDE WEB$'


qn7 db '7. WHICH IS NOT AN INTERNET PROTOCOL=?.$'
q7op db 'A)HTTP   B)STP  C)FTP$'
qn8 db '8.WHICH WAS NOT AN EARLY MAINFRAME COMPUTER=?.$'
q8op db 'A)ENIAC  B)UNIVAC  C)BRAINIAC$' 
qn9 db '9.CPU STANDS FOR=?.$'
q9op db 'A)CENTRAL PROCESSING UNIT  B)CENTRAL PROTOCOL UNIT  C)CENTRAL PROGRAMMING UNIT$' 
data ends
.code
main proc
    
mov tsa,0
mov tsb,0
mov tsc,0
mov ax,@data     
mov ds,ax
lea dx,msg1    
mov ah,9
int 21h    

call NL
lea dx,msg2
mov ah,9
int 21h
      
call NL      
lea dx,msg3
mov ah,9
int 21h

call NL
lea dx,qn1
mov ah,9
int 21h
      
call NL      
lea dx,q1op
mov ah,9
int 21h
      
call NL      
lea dx,msg4
mov ah,9
int 21h 
jmp BZ 

NL:MOV AH,2
	MOV DL, 0AH
	INT 21H   
    MOV DL, 0DH
    INT 21H
    RET 

BZ:mov ah,1
   int 21h  
   push ax
   
   
   mov ah,1
   int 21h
   mov bx,ax
   push bx  
   
   
   mov ah,1
   int 21h
   mov cx,ax 
   push cx  
   
   pop cx   ;storing the c value
   mov c,cl
   
   pop bx   ;storing the b value
   mov b,bl
  
   pop ax   ;storing the a value
   mov z,al
   
   
   mov al,z
   cmp al,'a'
   je TA
   cmp al,'b'
   je TB
   cmp al,'c'
   je TC
  
TA:call NL
   lea dx,msg6
   mov ah,9
   int 21h 
         
   call NL      
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'C'
   je STEA
   cmp al,'C'
   jne STWA
   
TB:call NL
   lea dx,msg7
   mov ah,9
   int 21h
   
   call NL       
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'C'
   je STEB
   cmp al,'C'
   jne STWB 
   
TC:call NL
   lea dx,msg8
   mov ah,9
   int 21h
   
   call NL
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'C'
   je STEC
   cmp al,'C'
   jne STWC
   
STEA:mov bx,0
     jmp TPA
   
TPA:mov bl,tsa
    inc bx 
    mov tsa,bl
    call NL 
    lea dx,msg9
    mov ah,9
    int 21h
    
    mov dx,bx
    add dl,48
    mov ah,2
    int 21h
    jmp Q2  
  
STWA:mov bx,0
     jmp TWA
    
TWA:mov bl,tsa
    dec bx 
    mov tsa,bl
    call NL
    lea dx,msg9
    mov ah,9
    int 21h
      
    mov dl,bl 
    add dl,48
    mov ah,2
    int 21h
    
    ;pop bx
    mov bl,b 
    cmp bl,'a'
    je A3
    cmp bl,'b'
    je TB
    cmp bl,'c'
    je TC
    
A3:mov cl,c  
   cmp cx,'b'
   je TB
   cmp cx,'c'
   je TC
   cmp cx,'a'
   jne Q2  
   
STEB:mov cx,0
    jmp TPB
   
TPB:mov cl,tsb
    inc cx
    mov tsb,cl 
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    mov dx,cx
    add dl,48
    mov ah,2
    int 21h
    jmp Q2
    
STWB:mov cx,0
    jmp TWB
    
TWB:mov cl,tsb
    dec cx
    mov tsb,cl
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h    
    
    mov bl,b  
    ;pop bx
    cmp bl,'b'
    je B3 
    cmp bl,'c'
    je TC
    cmp bl,'a'
    je TA
    
    
B3:mov cl,c
   ;pop cx
   cmp cl,'a'
   je TA
   cmp cl,'c'
   je TC
   cmp cl,'b'
   jne Q2 
   
STEC:mov ax,0
    jmp TPC 
    
TPC:mov al,tsc
    inc ax 
    mov tsc,al
    mov d,al
    call NL
    lea dx,msg11 
    mov ah,9
    int 21h
         
    mov dl,d
    add dl,48
    mov ah,2
    int 21h
    jmp Q2
          
STWC:mov ax,0
     jmp TWC 
     
TWC:mov al,tsc
    dec ax
    mov tsc,al
    mov d,al
    call NL
    lea dx,msg11
    mov ah,9
    int 21h
             
    mov dl,d
    add dl,48
    mov ah,2
    int 21h
    
    mov bl,b  
    ;pop bx
    cmp bl,'c'
    je C3 
    cmp bl,'a'
    je TA
    cmp bl,'b'
    je TB
    
    
C3:mov cl,c   
   ;pop cx
   cmp cl,'a'
   je TA
   cmp cl,'b'
   je TB
   cmp cl,'c'
   jne Q2           
Q2:call NL
    lea dx,qn2
    mov ah,9
    int 21h 
    
    call NL
    lea dx,q2op
    mov ah,9
    int 21h
    
    call NL
    lea dx,msg4
    mov ah,9
    int 21h  
    
    jmp BZ2
    
BZ2:mov ah,1
   int 21h  
   push ax
   
   
   mov ah,1
   int 21h
   mov bx,ax
   push bx  
   
   
   mov ah,1
   int 21h
   mov cx,ax 
   push cx  
   
   pop cx   ;storing the c value
   mov c,cl
   
   pop bx   ;storing the b value
   mov b,bl
  
   pop ax   ;storing the a value
   mov z,al
   
   
   mov al,z
   cmp al,'a'
   je TA2
   cmp al,'b'
   je TB2
   cmp al,'c'
   je TC2
  
TA2:call NL
   lea dx,msg6
   mov ah,9
   int 21h 
         
   call NL      
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'B'
   je TPA2
   cmp al,'B'
   jne TWA2
   
TB2:call NL
   lea dx,msg7
   mov ah,9
   int 21h
   
   call NL       
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'B'
   je TPB2
   cmp al,'B'
   jne TWB2 
   
TC2:call NL
   lea dx,msg8
   mov ah,9
   int 21h
   
   call NL
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'B'
   je TPC2
   cmp al,'B'
   jne TWC2
   

   
TPA2:mov bl,tsa
    inc bx
    mov tsa,bl
    call NL 
    lea dx,msg9
    mov ah,9
    int 21h
    
    mov dx,bx
    add dl,48
    mov ah,2                              
    int 21h
    jmp Q3  
  

    
TWA2:mov bl,tsa
    dec bx
    mov tsa,bl
    call NL
    lea dx,msg9
    mov ah,9
    int 21h
      
    mov dl,bl 
    add dl,48
    mov ah,2
    int 21h
    
    ;pop bx
    mov bl,b 
    cmp bl,'a'
    je A32
    cmp bl,'b'
    je TB2
    cmp bl,'c'
    je TC2
    
A32:mov cl,c  
   cmp cx,'b'
   je TB2
   cmp cx,'c'
   je TC2
   cmp cx,'a'
   jne Q3  
   

   
TPB2:mov cl,tsb
    inc cx
    mov tsb,cl 
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    mov dx,cx
    add dl,48
    mov ah,2
    int 21h
    jmp Q3
    

    
TWB2:mov cl,tsb
    dec cx   
    mov tsb,cl
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h    
    
    mov bl,b  
    ;pop bx
    cmp bl,'b'
    je B32 
    cmp bl,'c'
    je TC2
    cmp bl,'a'
    je TA2 
    
B32:mov cl,c
   ;pop cx
   cmp cl,'a'
   je TA2
   cmp cl,'c'
   je TC2
   cmp cl,'b'
   jne Q3 
   

    
TPC2:mov al,tsc
    inc ax    
    mov tsc,al
    mov d,al
    call NL
    lea dx,msg11 
    mov ah,9
    int 21h
         
    mov dl,d
    add dl,48
    mov ah,2
    int 21h
    jmp Q3
          

     
TWC2:mov al,tsc
    dec ax    
    mov tsc,al
    mov d,al
    call NL
    lea dx,msg11
    mov ah,9
    int 21h
             
    mov dl,d
    add dl,48
    mov ah,2
    int 21h
    
    mov bl,b  
    ;pop bx
    cmp bl,'c'
    je C32 
    cmp bl,'a'
    je TA2
    cmp bl,'b'
    je TB2
    
    
C32:mov cl,c   
   ;pop cx
   cmp cl,'a'
   je TA2
   cmp cl,'b'
   je TB2
   cmp cl,'c'
   jne Q3           
Q3:call NL
    lea dx,qn3
    mov ah,9
    int 21h 
    
    call NL
    lea dx,q3op
    mov ah,9
    int 21h
    
    call NL
    lea dx,msg4
    mov ah,9
    int 21h  
    
    jmp BZ3
  
  
BZ3:mov ah,1
   int 21h  
   push ax
   
   
   mov ah,1
   int 21h
   mov bx,ax
   push bx  
   
   
   mov ah,1
   int 21h
   mov cx,ax 
   push cx  
   
   pop cx   ;storing the c value
   mov c,cl
   
   pop bx   ;storing the b value
   mov b,bl
  
   pop ax   ;storing the a value
   mov z,al
   
   
   mov al,z
   cmp al,'a'
   je TA3
   cmp al,'b'
   je TB3
   cmp al,'c'
   je TC3
  
TA3:call NL
   lea dx,msg6
   mov ah,9
   int 21h 
         
   call NL      
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'A'
   je TPA3
   cmp al,'A'
   jne TWA3
   
TB3:call NL
   lea dx,msg7
   mov ah,9
   int 21h
   
   call NL       
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'A'
   je TPB3
   cmp al,'A'
   jne TWB3 
   
TC3:call NL
   lea dx,msg8
   mov ah,9
   int 21h
   
   call NL
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'A'
   je TPC3
   cmp al,'A'
   jne TWC3
   

   
TPA3:mov bl,tsa
    inc bx
    mov tsa,bl
    call NL 
    lea dx,msg9
    mov ah,9
    int 21h
    
    mov dx,bx
    add dl,48
    mov ah,2
    int 21h
    jmp Q4  
  

    
TWA3:mov bl,tsa
    dec bx
    mov tsa,bl
    call NL
    lea dx,msg9
    mov ah,9
    int 21h
      
    mov dl,bl 
    add dl,48
    mov ah,2
    int 21h
    
    ;pop bx
    mov bl,b 
    cmp bl,'a'
    je A33
    cmp bl,'b'
    je TB3
    cmp bl,'c'
    je TC3
    
A33:mov cl,c  
   cmp cx,'b'
   je TB3
   cmp cx,'c'
   je TC3
   cmp cx,'a'
   jne Q4  
   

   
TPB3:mov cl,tsb
    inc cx
    mov tsb,cl 
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    mov dx,cx
    add dl,48
    mov ah,2
    int 21h
    jmp Q4
    

    
TWB3:mov cl,tsb
    dec cx   
    mov tsb,cl
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h    
    
    mov bl,b  
    ;pop bx
    cmp bl,'b'
    je B33 
    cmp bl,'c'
    je TC3
    cmp bl,'a'
    je TA3 
    
B33:mov cl,c
   ;pop cx
   cmp cl,'a'
   je TA3
   cmp cl,'c'
   je TC3
   cmp cl,'b'
   jne Q4 
   

    
TPC3:mov al,tsc
    inc ax    
    mov tsc,al
    mov d,al
    call NL
    lea dx,msg11 
    mov ah,9
    int 21h
         
    mov dl,d
    add dl,48
    mov ah,2
    int 21h
    jmp Q4
          

     
TWC3:mov al,tsc
    dec ax    
    mov tsc,al
    mov d,al
    call NL
    lea dx,msg11
    mov ah,9
    int 21h
             
    mov dl,d
    add dl,48
    mov ah,2
    int 21h
    
    mov bl,b  
    ;pop bx
    cmp bl,'c'
    je C33 
    cmp bl,'a'
    je TA3
    cmp bl,'b'
    je TB3
    
    
C33:mov cl,c   
   ;pop cx
   cmp cl,'a'
   je TA3
   cmp cl,'b'
   je TB3
   cmp cl,'c'
   jne Q4           
Q4:call NL
    lea dx,qn4
    mov ah,9
    int 21h 
    
    call NL
    lea dx,q4op
    mov ah,9
    int 21h
    
    call NL
    lea dx,msg4
    mov ah,9
    int 21h  
    
    jmp BZ4
           
BZ4:mov ah,1
   int 21h  
   push ax
   
   
   mov ah,1
   int 21h
   mov bx,ax
   push bx  
   
   
   mov ah,1
   int 21h
   mov cx,ax 
   push cx  
   
   pop cx   ;storing the c value
   mov c,cl
   
   pop bx   ;storing the b value
   mov b,bl
  
   pop ax   ;storing the a value
   mov z,al
   
   
   mov al,z
   cmp al,'a'
   je TA4
   cmp al,'b'
   je TB4
   cmp al,'c'
   je TC4
  
TA4:call NL
   lea dx,msg6
   mov ah,9
   int 21h 
         
   call NL      
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'A'
   je TPA4
   cmp al,'A'
   jne TWA4
   
TB4:call NL
   lea dx,msg7
   mov ah,9
   int 21h
   
   call NL       
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'A'
   je TPB4
   cmp al,'A'
   jne TWB4 
   
TC4:call NL
   lea dx,msg8
   mov ah,9
   int 21h
   
   call NL
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'A'
   je TPC4
   cmp al,'A'
   jne TWC4
   

   
TPA4:mov bl,tsa
    inc bx
    mov tsa,bl
    call NL 
    lea dx,msg9
    mov ah,9
    int 21h
    
    mov dx,bx
    add dl,48
    mov ah,2
    int 21h
    jmp Q5  
  

    
TWA4:mov bl,tsa
    dec bx
    mov tsa,bl
    call NL
    lea dx,msg9
    mov ah,9
    int 21h
      
    mov dl,bl 
    add dl,48
    mov ah,2
    int 21h
    
    ;pop bx
    mov bl,b 
    cmp bl,'a'
    je A34
    cmp bl,'b'
    je TB4
    cmp bl,'c'
    je TC4
    
A34:mov cl,c  
   cmp cx,'b'
   je TB4
   cmp cx,'c'
   je TC4
   cmp cx,'a'
   jne Q5  
   

   
TPB4:mov cl,tsb
    inc cx
    mov tsb,cl 
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    mov dx,cx
    add dl,48
    mov ah,2
    int 21h
    jmp Q5
    

    
TWB4:mov cl,tsb
    dec cx   
    mov tsb,cl
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h    
    
    mov bl,b  
    ;pop bx
    cmp bl,'b'
    je B34 
    cmp bl,'c'
    je TC4
    cmp bl,'a'
    je TA4 
    
B34:mov cl,c
   ;pop cx
   cmp cl,'a'
   je TA4
   cmp cl,'c'
   je TC4
   cmp cl,'b'
   jne Q5 
   

    
TPC4:mov al,tsc
    inc ax    
    mov tsc,al
    mov d,al
    call NL
    lea dx,msg11 
    mov ah,9
    int 21h
         
    mov dl,d
    add dl,48
    mov ah,2
    int 21h
    jmp Q5
          

     
TWC4:mov al,tsc
    dec ax    
    mov tsc,al
    mov d,al
    call NL
    lea dx,msg11
    mov ah,9
    int 21h
             
    mov dl,d
    add dl,48
    mov ah,2
    int 21h
    
    mov bl,b  
    ;pop bx
    cmp bl,'c'
    je C34 
    cmp bl,'a'
    je TA4
    cmp bl,'b'
    je TB4
    
    
C34:mov cl,c   
   ;pop cx
   cmp cl,'a'
   je TA4
   cmp cl,'b'
   je TB4
   cmp cl,'c'
   jne Q5           
Q5:call NL
    lea dx,qn5
    mov ah,9
    int 21h 
    
    call NL
    lea dx,q5op
    mov ah,9
    int 21h
    
    call NL
    lea dx,msg4
    mov ah,9
    int 21h  
    
    jmp BZ5
           
    
BZ5:mov ah,1
   int 21h  
   push ax
   
   
   mov ah,1
   int 21h
   mov bx,ax
   push bx  
   
   
   mov ah,1
   int 21h
   mov cx,ax 
   push cx  
   
   pop cx   ;storing the c value
   mov c,cl
   
   pop bx   ;storing the b value
   mov b,bl
  
   pop ax   ;storing the a value
   mov z,al
   
   
   mov al,z
   cmp al,'a'
   je TA5
   cmp al,'b'
   je TB5
   cmp al,'c'
   je TC5
  
TA5:call NL
   lea dx,msg6
   mov ah,9
   int 21h 
         
   call NL      
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'C'
   je TPA5
   cmp al,'C'
   jne TWA5
   
TB5:call NL
   lea dx,msg7
   mov ah,9
   int 21h
   
   call NL       
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'C'
   je TPB5
   cmp al,'C'
   jne TWB5
   
TC5:call NL
   lea dx,msg8
   mov ah,9
   int 21h
   
   call NL
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'C'
   je TPC5
   cmp al,'C'
   jne TWC5
   

   
TPA5:mov bl,tsa
    inc bx
    mov tsa,bl
    call NL 
    lea dx,msg9
    mov ah,9
    int 21h
    
    mov dx,bx
    add dl,48
    mov ah,2
    int 21h
    jmp CLVL  
  

    
TWA5:mov bl,tsa
    dec bx
    mov tsa,bl
    call NL
    lea dx,msg9
    mov ah,9
    int 21h
      
    mov dl,bl 
    add dl,48
    mov ah,2
    int 21h
    
    ;pop bx
    mov bl,b 
    cmp bl,'a'
    je A35
    cmp bl,'b'
    je TB5
    cmp bl,'c'
    je TC5
    
A35:mov cl,c  
   cmp cx,'b'
   je TB5
   cmp cx,'c'
   je TC5
   cmp cx,'a'
   jne CLVL 
   

   
TPB5:mov cl,tsb
    inc cx
    mov tsb,cl 
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    mov dx,cx
    add dl,48
    mov ah,2
    int 21h
    jmp CLVL
    

    
TWB5:mov cl,tsb
    dec cx   
    mov tsb,cl
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h    
    
    mov bl,b  
    ;pop bx
    cmp bl,'b'
    je B35 
    cmp bl,'c'
    je TC5
    cmp bl,'a'
    je TA5 
    
B35:mov cl,c
   ;pop cx
   cmp cl,'a'
   je TA5
   cmp cl,'c'
   je TC5
   cmp cl,'b'
   jne CLVL 
   

    
TPC5:mov al,tsc
    inc ax    
    mov tsc,al
    mov d,al
    call NL
    lea dx,msg11 
    mov ah,9
    int 21h
         
    mov dl,d
    add dl,48
    mov ah,2
    int 21h
    jmp CLVL
          

     
TWC5:mov al,tsc
    dec ax    
    mov tsc,al
    mov d,al
    call NL
    lea dx,msg11
    mov ah,9
    int 21h
             
    mov dl,d
    add dl,48
    mov ah,2
    int 21h
    
    mov bl,b  
    ;pop bx
    cmp bl,'c'
    je C35 
    cmp bl,'a'
    je TA5
    cmp bl,'b'
    je TB5
    
    
C35:mov cl,c   
   ;pop cx
   cmp cl,'a'
   je TA5
   cmp cl,'b'
   je TB5
   cmp cl,'c'
   jne CLVL
              
CLVL:MOV BL,tsa
	CMP BL,tsb
	JE DRAW
	CMP BL,tsb
	JG RES 
	CMP BL,tsc
    JE DRAW
	JG FGB 
	call NL
	LEA DX,MSG15
	MOV AH,9
	INT 21H 
	call NL 
	LEA DX,MSG22
	MOV AH,9
	INT 21H
	CALL NL
	LEA DX,MSG17
	MOV AH,9
	INT 21H
	LEA DX,MSG22
	MOV AH,9
	INT 21H
	JMP LEVEL 
    
FGB:call NL
    LEA DX,MSG13
	MOV AH,9
	INT 21H 
	MOV DL,tsa
	CMP AL,tsc
	JE DRAW
	JG AB  
	call NL
	LEA DX,MSG22
	MOV AH,9
	INT 21H
	call NL 
	LEA DX,MSG22
	MOV AH,9
	INT 21H     
	call NL
	LEA DX,MSG17
	MOV AH,9
	INT 21H
	call NL 
	LEA DX,MSG22
	MOV AH,9
	INT 21H
	call NL
	LEA DX,MSG22
	MOV AH,9
	INT 21H
	JMP LEVEL
RES:
  MOV DL,tsc
  CMP tsa,DL
  JE DRAW
  JG FD 
  call NL
  LEA DX,MSG15
  MOV AH,9
  INT 21H
  call NL 
	LEA DX,MSG22
	MOV AH,9
	INT 21H
  call NL
  LEA DX,MSG18
  MOV AH,9
  INT 21H
  call NL 
	LEA DX,MSG22
	MOV AH,9
	INT 21H
  JMP LEVEL
  
 FD:call NL 
    LEA DX,MSG12
     MOV AH,9
     INT 21H
     MOV BL,tsb
     CMP BL,tsc
   	JE DRAW
     JG AB
     call NL 
	LEA DX,MSG22
	MOV AH,9
	INT 21H 
     call NL
     LEA DX,MSG18
     MOV AH,9
     INT 21H
     call NL 
	LEA DX,MSG22
	MOV AH,9
	INT 21H   
     JMP LEVEL
  
 AB:call NL 
	LEA DX,MSG22
	MOV AH,9
	INT 21H
    call NL
    LEA DX,MSG16
    MOV AH,9
    INT 21H
    call NL 
	LEA DX,MSG22
	MOV AH,9
	INT 21H
    JMP LEVEL
DRAW:call NL
    LEA DX,MSG14
  MOV AH,9
  INT 21H 
  
  MOV AH,4CH
  INT 21H
    
    jmp LEVEL

LEVEL:mov bx,0
      mov cx,0 
     call NL 
     lea dx,msg20
     mov ah,9
     int 21h
     call NL     
     lea dx,msg19
     mov ah,9
     int 21h
     call NL 
     lea dx,msg20
     mov ah,9
     int 21h

call NL
lea dx,qn7
mov ah,9
int 21h
      
call NL      
lea dx,q7op
mov ah,9
int 21h
      
call NL      
lea dx,msg4
mov ah,9
int 21h 
jmp LBZ

LBZ:mov ah,1
   int 21h
   mov ah,1
   int 21h
   mov x,al 
   cmp al,'a'
   je LTB
   cmp al,'b'
   je LTA
  
  

LTA:call NL
   lea dx,msg6
   mov ah,9
   int 21h 
         
   call NL      
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'B'
   je LTPA
   cmp al,'B'
   jne LTWA
   
LTB:call NL
   lea dx,msg7
   mov ah,9
   int 21h
   
   call NL       
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'B'
   je LTPB
   cmp al,'B'
   jne LTWB
   
LTPA:inc bx
    call NL 
    lea dx,msg9
    mov ah,9
    int 21h
    
    lea dx,bx
    add dl,48
    mov ah,2
    int 21h
    jmp LQ2 
    
LTWA:dec bx
     call NL
     lea dx,msg9
     mov ah,9
     int 21h
     
     lea dx,bx
     add dl,48
     mov ah,2
     int 21h 
            
     mov dl,x
     cmp dx,'a'
     je LQ2
     cmp dx,'a'
     jne LTB
     
LTPB:inc cx 
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    lea dx,cx
    add dl,48
    mov ah,2
    int 21h
    jmp LQ2 
    
LTWB:dec cx
     call NL 
     lea dx,msg10
     mov ah,9
     int 21h
     
     lea dx,cx
     add dl,48
     mov ah,2
     int  21h
     
     mov dl,x
     cmp dx,'b'
     je LQ2
     cmp dx,'b'
     jne LTA
            
LQ2:call NL
    lea dx,qn8
    mov ah,9
    int 21h 
    
    call NL
    lea dx,q8op
    mov ah,9
    int 21h
    
    call NL
    lea dx,msg4
    mov ah,9
    int 21h 
    
    jmp LBZ2
    
LBZ2:mov ah,1
   int 21h
   mov ah,1
   int 21h 
   mov x,al
   cmp al,'a'
   je LTB2
   cmp al,'b'
   je LTA2
  
  

LTA2:call NL
   lea dx,msg6
   mov ah,9
   int 21h 
          
   call NL       
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'C'
   je LTPA2
   cmp al,'C'
   jne LTWA2
   
LTB2:call NL
    lea dx,msg7
    mov ah,9
    int 21h
          
   call NL       
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'C'
   je LTPB2
   cmp al,'C'
   jne LTWB2
   
LTPA2:inc bx
    call NL 
    lea dx,msg9
    mov ah,9
    int 21h
    
    lea dx,bx
    add dl,48
    mov ah,2
    int 21h
    jmp LQ3 
    
LTWA2:dec bx
      call NL
      lea dx,msg9
      mov ah,9
      int 21h 
       
      lea dx,bx
      add dl,48
      mov ah,2
      int 21h
      
      mov dl,x
      cmp dl,'a'
      je LQ3
      cmp dl,'a'
      jne LTB2
      
       
LTPB2:inc cx
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    lea dx,cx
    add dl,48
    mov ah,2
    int 21h
    jmp LQ3 
    
LTWB2:dec cx
      call NL
      lea dx,msg10
      mov ah,9
      int 21h
               
      lea dx,cx
      add dl,48
      mov ah,2
      int 21h
      
      mov dl,x
      cmp dl,'b'
      je LQ3
      cmp dl,'b'
      jne LTB2
      
LQ3:call NL
    lea dx,qn9
    mov ah,9
    int 21h 
    
    call NL
    lea dx,q9op
    mov ah,9
    int 21h
    
    call NL
    lea dx,msg4
    mov ah,9
    int 21h 
    
    jmp LBZ3
    
LBZ3:mov ah,1
   int 21h
   mov ah,1
   int 21h
   mov x,al 
   cmp al,'a'
   je LTB3
   cmp al,'b'
   je LTA3
  
  

LTA3:call NL
   lea dx,msg6
   mov ah,9
   int 21h 
          
   call NL       
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'A'
   je LTPA3
   cmp al,'A'
   jne LTWA3
   
LTB3:call NL
    lea dx,msg7
    mov ah,9
    int 21h
          
   call NL       
   lea dx,msg5
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   cmp al,'A'
   je LTPB3
   cmp al,'A'
   jne LTWB3
   
LTPA3:inc bx
    call NL 
    lea dx,msg9
    mov ah,9
    int 21h
    
    lea dx,bx
    add dl,48
    mov ah,2
    int 21h
    jmp LFINAL 
    
LTWA3:dec bx
      call NL
      lea dx,msg9
      mov ah,9
      int 21h
      
      lea dx,bx
      add dl,48
      mov ah,2
      int 21h
      
      mov dl,x
      cmp dl,'a'
      je LFINAL
      cmp dl,'a'
      jne LTB3
      
LTPB3:inc cx
    call NL
    lea dx,msg10
    mov ah,9
    int 21h
    
    lea dx,cx
    add dl,48
    mov ah,2
    int 21h
    jmp LFINAL
    
LTWB3:dec bx
      call NL
      lea dx,msg10
      mov ah,9
      int 21h
      
      lea dx,bx
      add dl,48
      mov ah,2
      int 21h
      
      mov dl,x
      cmp dl,'b'
      je LFINAL
      cmp dl,'b'
      jne LTA3
     
LFINAL:mov y,cl
      cmp bl,y
      jg LWX
      cmp bl,y
      je LDRAW
      call NL 
	LEA DX,MSG23
	MOV AH,9
	INT 21H
      call NL
      lea dx,msg13
      mov ah,9
      int 21h
      call NL 
	LEA DX,MSG23
	MOV AH,9
	INT 21H
      mov ah,4ch
      int 21h 
            
LWX:call NL 
	LEA DX,MSG23
	MOV AH,9
	INT 21H
    call NL
   lea dx,msg12
   mov ah,9
   int 21h   
   call NL 
	LEA DX,MSG23
	MOV AH,9
	INT 21H
   
   mov ah,4ch
   int 21h
    
LDRAW:call NL
     LEA DX,MSG23
	MOV AH,9
	INT 21H
    call NL
     lea dx,msg14
     mov ah,9
     int 21h
     call NL 
     LEA DX,MSG23
	MOV AH,9
	INT 21H
  

      MOV AH,4CH
      INT 21H
    
    end main proc
        end
