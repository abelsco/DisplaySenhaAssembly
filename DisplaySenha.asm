;* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
;*                        (CODIGO 1)                               *
;*                          UTFPR                                  *
;*         DESENVOLVIDO RAFAEL ALBARELLO E ABEL MENEZES            *
;*   VERSAO: 1.0                           DATA: 02/04/2018        *
;* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
;*                     ENTRADA DE KEYPAD 4X4                       *
;*                                                                 *
;* O CODIGO PRETENDE LER INFINITAMENTE A ENTRADA DE UM KEYPAD 4X4  *
;* E DAR A SAIDA EM BINÁRIO EM LEDS                                *
;*                                                                 *
;*                                                                 *
;*-----------------------------------------------------------------*
;* CODIGO PARA 8051 DA DISCIPLINA "SISTEMAS MICROCONTROLADOS".     *
;*                                                                 *
;*                                                                 *
;* INPUT: KEYPAD 4X4 NO PORT P2                                    *
;* OUTPUT: 8 LEDS NO PORT P1                                       *
;*                                                                 *
;* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 
ORG 00H         ;COMECO
 
MAIN:
 
    MOV P1, #11111111b ; seta a saida p1 em alto (led acende em baixo)
    MOV P0, #11111111b ; seta a entrada p2 em alto
 
LINHA1:
    SETB P0.3
    CLR P0.0
BOTAO7:
    JB P0.4, BOTAO8  ; se p2.0 está em alto (nao pressionado), testa o proximo
    MOV A, #07D ; MOVE PARA O ACUMULADOR O VALOR 7
    ACALL IMPRIME
BOTAO8:
    JB P0.5, BOTAO9
    MOV A, #08D
    ACALL IMPRIME
BOTAO9:
    JB P0.6, BOTAODIVIDE
    MOV A, #09D
    ACALL IMPRIME
BOTAODIVIDE:
    JB P0.7, LINHA2
    MOV A, #15D
    ACALL IMPRIME
 
   
LINHA2:
    SETB P0.0
    CLR P0.1
BOTAO4:
    JB P0.4, BOTAO5  ; se p2.0 está em alto (nao pressionado), testa o proximo
    MOV A, #04D ; MOVE PARA O ACUMULADOR O VALOR 7
    ACALL IMPRIME
BOTAO5:
    JB P0.5, BOTAO6
    MOV A, #05D
    ACALL IMPRIME
BOTAO6:
    JB P0.6, BOTAOVEZES
    MOV A, #06D
    ACALL IMPRIME
BOTAOVEZES:
    JB P0.7, LINHA3
    MOV A, #14D
    ACALL IMPRIME
 
 
LINHA3:
    SETB P0.1
    CLR P0.2
BOTAO1:
    JB P0.4, BOTAO2
    MOV A, #01D
    ACALL IMPRIME
BOTAO2:
    JB P0.5, BOTAO3
    MOV A, #02D
    ACALL IMPRIME
BOTAO3:
    JB P0.6, BOTAOMENOS
    MOV A, #03D
    ACALL IMPRIME
BOTAOMENOS:
    JB P0.7, LINHA4
    MOV A, #13D
    ACALL IMPRIME
 
LINHA4:
    SETB P0.2
    CLR P0.3
BOTAOON:
    JB P0.4, BOTAO0
    MOV A, #10D
    ACALL IMPRIME
BOTAO0:
    JB P0.5, BOTAOIGUAL
    MOV A, #00D
    ACALL IMPRIME
BOTAOIGUAL:
    JB P0.6, BOTAOMAIS
    MOV A, #11D
    ACALL IMPRIME
BOTAOMAIS:
    JB P0.7, RETORNO
    MOV A, #12D
    ACALL IMPRIME
RETORNO:
    ACALL LINHA1
 
IMPRIME:
    ;CPL A ; INVERTER POIS OS LED LIGAM EM 0
    MOV P3, A
    RET
END
