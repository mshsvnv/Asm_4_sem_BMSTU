StkSeg SEGMENT PARA STACK 'STACK'
    DB 200h DUP (?)
StkSeg ENDS
;
DataS SEGMENT WORD 'DATA'
    HelloMessage DB 13 ;курсор поместить в нач. строки
    DB 10 ;перевести курсор на нов. строку
    DB 'Hello, world!' ;текст сообщения
    DB '$' ;ограничитель для функции DOS
DataS ENDS
;
Code SEGMENT WORD 'CODE'
    ASSUME CS:Code, DS:DataS
DispMsg:
    mov AX, DataS
    mov DS, AX 

    mov DX, OFFSET HelloMessage
    mov AH,9
    mov CX, 3

label1:
    int 21h
    loop label1

    mov AH, 4Ch
    int 21h 

Code ENDS
END DispMsg