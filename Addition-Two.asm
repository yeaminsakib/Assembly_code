.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DW 10
    NUM2 DW 20

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Addition
    MOV AX, NUM1
    ADD AX, NUM2

    ; Result print
    MOV BX, 10
    XOR CX, CX

CONVERT:
    XOR DX, DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JNE CONVERT

PRINT:
    POP DX
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    LOOP PRINT

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN