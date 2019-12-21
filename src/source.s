intin       equ   8                   ; setup some constants
ptsin       equ   12
colbit0     equ   24
colbit1     equ   26
colbit2     equ   28
colbit3     equ   30
lstlin      equ   32
lnmask      equ   34
wmode       equ   36
x1          equ   38
y1          equ   40
x2          equ   42
y2          equ   44
init        equ   $a000
setpix      equ   $a001
getpix      equ   $a002
drwlin      equ   $a003

start:
   jsr   initialize  

   dc.w  init                   ; call line a init

   move.w   #1,colbit0(a0)      ; setup arguments to draw line
   move.w   #1,colbit1(a0)
   move.w   #1,colbit2(a0)
   move.w   #1,colbit3(a0)
   move.w   #0,lstlin(a0)
   move.w   #$ffff,lnmask(a0)
   move.w   #0,wmode(a0)
   move.w   #0,x1(a0)
   move.w   #0,y1(a0)
   move.w   #100,x2(a0)
   move.w   #100,y2(a0)
   dc.w  drwlin                 ;call line a draw line
      
   move.w   #7,-(a7)
   trap     #1                     ;wait keypress
   addq.l   #2,a7 
   jsr      restore
   clr.l    -(a7)               ;call gemdos
   trap     #1
   
initialize:                     ; go into super user mode
   clr.l    -(a7) 
   move.w   #32,-(a7)  
   trap     #1     
   addq.l   #6,a7   
   move.l   d0,oldstack
   rts
   
restore:                        ; go back into user mode
   move.l   oldstack,-(a7)
   move.w   #32,-(a7)
   trap     #1     
   addq.l   #6,a7
   rts

oldstack dc.l 0