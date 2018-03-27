; Traffic ligts Program modified by OGWAL STEVEN ALBERT
;EMAIL: ogsteval@gmail.com



; c:\emu8086\devices\Traffic_Lights
#start=Traffic_Lights.exe#

name "traffic" 

;setting the colours 
;according to the LED lights
                         

;r = Red    -> 001
;y = Yellow -> 010
;g = Green  -> 100 

;sit1 => g_r_g_r
;sit2 => r_g_r_g
 
; BA9 _ 876 _ 543 _ 210
sit1 equ 0011_0000_1100b 

sit2 equ 1000_0110_0001b

sit3 equ 0110_1001_1010b  

sit4 equ 0100_1101_0011b


all_red          equ      0010_0100_1001b 

 
 
start:
nop
  

                       ;Start of the lights

mov ax, all_red        ;All lights get red
out 4,ax   



mov ax, sit1            ;LEDs BA9+543 get Red while 876+210 get Green
out 4,ax 

                    ; wait 5 seconds (5 million microseconds)
mov     cx, 4Ch         ; 004C4B40h = 5,000,000
mov     dx, 4B40h
mov     ah, 86h
int     15h  


mov ax,sit3             ;LEDs BA9+543 get Red and Yellow while 876+210 get yellow
out 4,ax 

                    ; wait 5 seconds (5 million microseconds)
mov     cx, 4Ch         ;004C4B40h = 5,000,000
mov     dx, 4B40h
mov     ah, 86h
int     15h 
 



mov ax, sit2            ;LEDs BA9+543 get green and 876+210 get red
out 4,ax 

                   ; wait 5 seconds (5 million microseconds)
mov     cx, 4Ch         ;004C4B40h = 5,000,000
mov     dx, 4B40h
mov     ah, 86h
int     15h 



mov ax,sit4             ;LEDs BA9+543 get Red and Yellow while 876+210 get yellow
out 4,ax
 

                   ; wait 5 seconds (5 million microseconds)
mov     cx, 4Ch         ;004C4B40h = 5,000,000
mov     dx, 4B40h
mov     ah, 86h
int     15h  
 

jmp start
