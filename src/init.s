   section init
initialize::                   ; go into super user mode
   clr.l    -(a7) 
   move.w   #32,-(a7)  
   trap     #1     
   addq.l   #6,a7   
   move.l   d0,oldstack
   rts