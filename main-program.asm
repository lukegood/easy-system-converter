;�����ܣ�ʮ����תʮ�����ơ������ƺͰ˽��ƣ�����0-65535��Χ��
;�˽���תʮ�����ơ�ʮ���ƣ�����0-177777��Χ�ڣ�
;������תʮ�����ơ��˽��ƣ�����0-1111111111111111��Χ�ڣ����ϳ�����Χ����������
;ÿ�ο���0-8��ѡ��ͬ��ת�����˳�
;data�����info���������Ϣ
;This program was designed by Luke. You can only read it for studying and can not copy any codes for business.
data segment
    num dw 0
    info0_1 db 0dh,0ah,'Welcome to use this program!$'
    info0_2 db 0dh,0ah,'*********************************Main Menu*********************************$'
    info0_3 db 0dh,0ah,0dh,0ah,' 0: Show the main menu!$'
    info0_4 db 0dh,0ah,' 1: change decimal number (only between 0 and 65535) into hexadecimal number!$'
    info0_5 db 0dh,0ah,' 2: change decimal number (only between 0 and 65535) into binary number!$'
    info0_6 db 0dh,0ah,' 3: change decimal number (only between 0 and 65535) into octal number!$'
    info0_7 db 0dh,0ah,' 4: change octal number (only between 0 and 177777) into hexadecimal number!$'
    info0_8 db 0dh,0ah,' 5: change octal number (only between 0 and 177777) into binary number!$'
    info0_9 db 0dh,0ah,' 6: change binary number (0 - 1111111111111111) into hexadecimal number!$'
    info0_10 db 0dh,0ah,' 7: change binary number (0 - 1111111111111111) into octal number!$'
    info0_11 db 0dh,0ah,' 8: Finsh & exit!',0dh,0ah,0dh,0ah,'***************************************************************************$'
    info1 db 0dh,0ah,0dh,0ah,'Ok! The number you want to change is $'
    info2 db 'We get the result! The result is $'
    info3 db 0dh,0ah,0dh,0ah,'The function you want to use is $'
    info4 db '0123456789ABCDEF'
    info5 db '01'
    info6 db '01234567'
data ends

assume cs:code,ds:data
code segment
start: mov ax,data
       mov ds,ax
   s0: mov dx,offset info0_1  ;����˵�
       mov ah,9
       int 21h
       mov dx,offset info0_2
       mov ah,9
       int 21h
       mov dx,offset info0_3
       mov ah,9
       int 21h
       mov dx,offset info0_4
       mov ah,9
       int 21h
       mov dx,offset info0_5
       mov ah,9
       int 21h
       mov dx,offset info0_6
       mov ah,9
       int 21h
       mov dx,offset info0_7  
       mov ah,9
       int 21h
       mov dx,offset info0_8  
       mov ah,9
       int 21h
       mov dx,offset info0_9 
       mov ah,9
       int 21h
       mov dx,offset info0_10  
       mov ah,9
       int 21h
       mov dx,offset info0_11  
       mov ah,9
       int 21h
   s1: mov dx,offset info3  ;�������ѡ�����ʾ
       mov ah,9
       int 21h    
   s2: mov ah,1   ;����������ת����ͬ�Ĺ���
       int 21h
       cmp al,48
       je s0
       cmp al,49
       je s3
       cmp al,50
       je s6
       cmp al,51
       je s8
       cmp al,52
       je s11
       cmp al,53
       je s12
       cmp al,54
       je s14
       cmp al,55
       je s15
       cmp al,56
       je ok
       jne s2  
 s3: mov ax,data  ;����s4��s5����10ת16����
       mov ds,ax
       mov num,0
       mov dx,offset info1
       mov ah,9
       int 21h
       call s4
       call s5
       jmp s1
 s6: mov ax,data  ;����s4��s7����10ת2����
       mov ds,ax
       mov num,0
       mov dx,offset info1
       mov ah,9
       int 21h
       call s4
       call s7
       jmp s1
 s8: mov ax,data  ;����s4��s9����10ת8����
       mov ds,ax
       mov num,0
       mov dx,offset info1
       mov ah,9
       int 21h
       call s4
       call s9
       jmp s1
 s4: mov ah,1  ;�����ʮ�������������Զ�������ʽ������num��
       int 21h
       sub al,30h
       cmp al,0
       jb exit
       cmp al,9
       ja exit
       mov ah,0
       xchg ax,num
       mov cx,10
       mul cx
       add num,ax
       jmp s4
 exit: ret
 s5: mov dx,offset info2  ;ת16����
       mov ah,9
       int 21h
       mov bx,num
       mov ch,4
       mov cl,4
rept1:rol bx,cl
      mov ax,bx
      and ax,000fh
      mov si,ax
      mov dl,info4[si]
      mov ah,2
      int 21h
      dec ch
      jnz rept1
      ret
 s7: mov dx,offset info2  ;ת2����
       mov ah,9
       int 21h
       mov bx,num
       mov ch,16
       mov cl,1
rept2:rol bx,cl
      mov ax,bx
      and ax,0001h
      mov si,ax
      mov dl,info5[si]
      mov ah,2
      int 21h
      dec ch
      jnz rept2
      ret
 s9: mov dx,offset info2  ;ת8����
       mov ah,9
       int 21h
       mov bx,num  ;����ÿ3λ��������תһ���˽�������������һ�����࣬�ڴ˵�������
       rol bx,1
       mov ax,bx
       and ax,0001h
       mov si,ax
       mov dl,info6[si]
       mov ah,2
       int 21h
       mov ch,5
       mov cl,3
rept3:rol bx,cl
      mov ax,bx
      and ax,0007h
      mov si,ax
      mov dl,info6[si]
      mov ah,2
      int 21h
      dec ch
      jnz rept3
      ret
  s10: mov ah,1  ;����İ˽������������Զ�������ʽ������num��
       int 21h
       sub al,30h
       cmp al,0
       jb exit
       cmp al,7
       ja exit
       mov ah,0
       xchg ax,num
       mov cx,8
       mul cx
       add num,ax
       jmp s10
  s11: mov ax,data  ;����s10��s5����8ת16����
       mov ds,ax
       mov num,0
       mov dx,offset info1
       mov ah,9
       int 21h
       call s10
       call s5
       jmp s1
  s12: mov ax,data  ;����s10��s7����8ת2����
       mov ds,ax
       mov num,0
       mov dx,offset info1
       mov ah,9
       int 21h
       call s10
       call s7
       jmp s1
  s13: mov ah,1  ;����Ķ��������������Զ�������ʽ������num��
       int 21h
       sub al,30h
       cmp al,0
       jb exit
       cmp al,1
       ja exit
       mov ah,0
       xchg ax,num
       mov cx,2
       mul cx
       add num,ax
       jmp s13
  s14: mov ax,data  ;����s13��s5����2ת16����
       mov ds,ax
       mov num,0
       mov dx,offset info1
       mov ah,9
       int 21h
       call s13
       call s5
       jmp s1
  s15: mov ax,data  ;����s13��s9����2ת8����
       mov ds,ax
       mov num,0
       mov dx,offset info1
       mov ah,9
       int 21h
       call s13
       call s9
       jmp s1
 ok:mov ax,4c00h  ;����debug
      int 21h
 code ends
 end start

