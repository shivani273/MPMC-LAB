.MODEL SMALL

DISP MACRO MSG
    LEA DX,MSG
    MOV AH,09H
    INT 21H
ENDM

.DATA
MSG1 DB 0DH,0AH,"ENTER FILE NAME TO BE CREATED $"
MSG2 DB 0DH,0AH,"CREATION WAS SUCCESSFUL $"
MSG3 DB 0DH,0AH,"CREATION FAILED $"
MSG4 DB 0DH,0AH,"ENTER FILE NAME TO BE DELETED $"
MSG5 DB 0DH,0AH,"DELETION WAS SUCCESSFUL $"
MSG6 DB 0DH,0AH,"DELETION FAILED $"
FNAME1 DB 10 DUP(0)
FNAME2 DB 10 DUP(0)

.CODE
MOV AX,@DATA
MOV DS,AX

LEA SI,FNAME1
DISP MSG1

L1: MOV AH,01H
    INT 21H
    CMP AL,0DH
    JE NEXT1
    MOV [SI],AL
    INC SI
JMP L1

NEXT1: MOV [SI],BYTE PTR '$'
       LEA DX,FNAME1
       XOR CX,CX

       MOV AH,3CH
       INT 21H

       JC CFAIL
       DISP MSG2
       JMP DEL

CFAIL:DISP MSG3

DEL:LEA SI,FNAME2
    DISP MSG4

L2: MOV AH,01H
    INT 21H
    CMP AL,0DH
    JE NEXT2
    MOV [SI],AL
    INC SI
JMP L2

NEXT2:MOV [SI],BYTE PTR '$'
      LEA DX,FNAME2
      
      MOV AH,41H
      INT 21H

      JC DFAIL
      DISP MSG5
      JMP FINAL

DFAIL: DISP MSG6

FINAL:MOV AH,4CH
      INT 21H
      END