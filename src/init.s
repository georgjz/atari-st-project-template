;-------------------------------------------------------------------------------
;   This section contains initialization code after the program is called
;-------------------------------------------------------------------------------
   section init,code

;-------------------------------------------------------------------------------
;  InitBasepage: This subroutine allocates memory for all sections (code, data, bss),
;  and the stack. This subroutine *must* be called first.
;-------------------------------------------------------------------------------
InitBasepage::                   
    move.l  4(sp), a0           ; get pointer to basepage
    lea     UserStack, sp       ; set user stack pointer 
    move.l  #$100, d0           ; length of basepage 
    add.l   $0c(a0), d0         ; add length of code section 
    add.l   $14(a0), d0         ; add length of data section 
    add.l   $1c(a0), d0         ; add length of bss section for total program length 
    move.l  d0, -(sp)           ; pass total length 
    move.l  a0, -(sp)           ; pass pointer to basepage 
    clr.w   -(sp)               ; clear word 
    move.w  #$4a, -(sp)         ; Mskrink opcode 
    trap    #1                  ; call GEMDOS 
    lea     $0c(sp), sp         ; correct stack pointer
    ; Program is now initialized 
    jmp     Main                ; execute main subroutine
;----- end of InitBasepage subroutine ------------------------------------------

;----- end of init section -----------------------------------------------------