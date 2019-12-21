; Copyright (C) 2019 Georg Ziegler
;
; Permission is hereby granted, free of charge, to any person obtaining a copy of
; this software and associated documentation files (the "Software"), to deal in
; the Software without restriction, including without limitation the rights to
; use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
; of the Software, and to permit persons to whom the Software is furnished to do
; so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in
; all copies or substantial portions of the Software.
; -----------------------------------------------------------------------------
;   File: Header.s
;   Author(s): Georg Ziegler
;   Description: This file contains the header data each Genesis/Mega Drive 
;   cartridge must contain.
;

;-------------------------------------------------------------------------------
;   Header Section: These data are placed in ROM memory starting at $100
;-------------------------------------------------------------------------------
    section header

; Sega Genesis ROM header
    dc.l      $00FFE000       ; Initial stack pointer value
    dc.l      ResetHandler    ; Start of our program in ROM
    dc.l      Interrupt       ; Bus error
    dc.l      Interrupt       ; Address error
    dc.l      Interrupt       ; Illegal instruction
    dc.l      Interrupt       ; Division by zero
    dc.l      Interrupt       ; CHK exception
    dc.l      Interrupt       ; TRAPV exception
    dc.l      Interrupt       ; Privilege violation
    dc.l      Interrupt       ; TRACE exception
    dc.l      Interrupt       ; Line-A emulator
    dc.l      Interrupt       ; Line-F emulator
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Uninitialized interrupt vector
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Spurious exception
    dc.l      Interrupt       ; IRQ level 1
    dc.l      Interrupt       ; IRQ level 2
    dc.l      Interrupt       ; IRQ level 3
    dc.l      HBlankHandler   ; IRQ level 4 (horizontal retrace interrupt)
    dc.l      Interrupt       ; IRQ level 5
    dc.l      VBlankHandler   ; IRQ level 6 (vertical retrace interrupt)
    dc.l      Interrupt       ; IRQ level 7
    dc.l      Interrupt       ; TRAP #00 exception
    dc.l      Interrupt       ; TRAP #01 exception
    dc.l      Interrupt       ; TRAP #02 exception
    dc.l      Interrupt       ; TRAP #03 exception
    dc.l      Interrupt       ; TRAP #04 exception
    dc.l      Interrupt       ; TRAP #05 exception
    dc.l      Interrupt       ; TRAP #06 exception
    dc.l      Interrupt       ; TRAP #07 exception
    dc.l      Interrupt       ; TRAP #08 exception
    dc.l      Interrupt       ; TRAP #09 exception
    dc.l      Interrupt       ; TRAP #10 exception
    dc.l      Interrupt       ; TRAP #11 exception
    dc.l      Interrupt       ; TRAP #12 exception
    dc.l      Interrupt       ; TRAP #13 exception
    dc.l      Interrupt       ; TRAP #14 exception
    dc.l      Interrupt       ; TRAP #15 exception
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)
    dc.l      Interrupt       ; Unused (reserved)


;            0123456789abdcef0123456789abdcef0123456789abdcef
; Sega string and copyright
    dc.b    "SEGA MEGA DRIVE "
    dc.b    "(C)T-XC 2019.DEC"
; Domestic name
    dc.b    "CLC_XCE TEST CODE                               "
; Overseas name
    dc.b    "CLC_XCE TEST CODE                               "
; GM (game), product code and serial
    dc.b    "GM 12345678-01"
; Checksum will be here //TODO
    dc.b     $81, $B4
; Which devices are supported ?
    dc.b    "JD              "
; ROM start address
    dc.b     $00, $00, $00, $00
; ROM end address will be here
    dc.b     $00, $02, $00, $00
; External RAM informations //TODO
    dc.b     $00, $FF, $00, $00
    dc.b     $00, $FF, $FF, $FF
; We don't have a modem, so we fill this with spaces
    dc.b    "                "
; Unused
    dc.b    "                "
    dc.b    "                "
    dc.b    "                "
; Country
    dc.b    "JUE             "