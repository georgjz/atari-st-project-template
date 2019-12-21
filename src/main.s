;-------------------------------------------------------------------------------
;   This section contains the main subroutine
;-------------------------------------------------------------------------------
    section main,code

;-------------------------------------------------------------------------------
;   Main: This is the program's entry point.
;-------------------------------------------------------------------------------
Main::
    move.w  #100,d0


    clr.l   -(sp)               ; set supervisor mode
    move.w  #32, -(sp)
    trap #1
    addq.l #6, sp

Loop:
    move.w #$ff, -(sp)          ; get keypress
    move.w #6, -(sp)
    trap #1
    lea 4(sp), sp

    cmp #32, d0                 ; space pressed?
    bne Loop                    ; if not, check key again

    clr.l -(sp)                 ; return to user mode
    move.w #32, -(sp)
    trap #1
    addq.l #6, sp

    ; program done, now terminate it 
    clr.l   d0                  ; return code is 0 
    move.w  d0, -(sp)           ; pass return code 
    move.w  #$4c, -(sp)         ; pass Pterm opcode 
    trap    #1                  ; call GEMDOS
;----- end of Main subroutine --------------------------------------------------

;----- end of main section -----------------------------------------------------


;-------------------------------------------------------------------------------
;   This section contains the variables and user stack
;-------------------------------------------------------------------------------
    section bss,bss 

            ds.l    1000        ; reserve 4000 bytes for the stack 
UserStack:: ds.l    2           ; user stack base address

;----- end of bss section ------------------------------------------------------