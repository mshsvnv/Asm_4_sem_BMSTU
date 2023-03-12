PUBLIC letter, num, new_letter
EXTERN output_letter: near, output_num: near, make_new: far, output_new: far

SSTK SEGMENT para STACK 'STACK'
    db 100 dup(0)
SSTK ENDS

DSEG SEGMENT PARA COMMON 'DATA'
    letter_msg db 10, 13, "Input letter: $"
    num_msg db 10, "Input number: $"
    new_msg db 10, "New letter: $"
    
    letter db 0
    num db 0
    new_letter db 0
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG, DS:DSEG
main:
    mov AX, DSEG
    mov DS, AX

    mov dx, offset letter_msg
    mov AH, 9
    int 21h

    mov AH, 7       ; ввод символа без эхо
    int 21h

    mov DS:letter, al ; занесение буквы в letter
    call output_letter

    mov dx, offset num_msg
    mov AH, 9
    int 21h

    mov AH, 7       ; ввод символа без эхо
    int 21h

    mov DS:num, al  ; занесение цифры в num
    call output_num

    call make_new

    mov dx, offset new_msg
    mov AH, 9
    int 21h
    call output_new

    mov AH, 4Ch
    int 21h

CSEG ENDS
END main