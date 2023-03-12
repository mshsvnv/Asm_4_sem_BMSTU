PUBLIC output_letter, output_num, make_new, output_new

EXTERN letter: byte, num: byte

DSEG SEGMENT PARA COMMON 'DATA'
    new_letter db 0
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG, DS:DSEG

output_letter proc near  ; вывод исходной буквы
    mov dl, letter
    mov AH, 2
    int 21h

    ret
output_letter endp

output_num proc near    ; вывод цифры
    mov dl, num
    mov AH, 2
    int 21h

    ret
output_num endp

make_new proc far   ; вычитание
    sub num, 48
    mov cl, num

    mov al, letter
    mov new_letter, al

    shift:
        sub new_letter, 1
        loop shift

    ret
make_new endp

output_new proc far ; вывод новой строки
    mov dl, new_letter
    mov AH, 2
    int 21H

    ret
output_new endp

CSEG ENDS
END