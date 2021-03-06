﻿; Listing generated by Microsoft (R) Optimizing Compiler Version 16.00.40219.01 

	TITLE	C:\DUII\Simulation\GUI\Core\GUI_CharLine.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	_GUI_CharLine_pfLog2Vis
_DATA	SEGMENT
_GUI_CharLine_pfLog2Vis DD FLAT:__Log2VisBuffered
_DATA	ENDS
EXTRN	__RTC_Shutdown:PROC
EXTRN	__RTC_InitBase:PROC
;	COMDAT rtc$TMZ
; File c:\duii\simulation\gui\core\gui_charline.c
rtc$TMZ	SEGMENT
__RTC_Shutdown.rtc$TMZ DD FLAT:__RTC_Shutdown
rtc$TMZ	ENDS
;	COMDAT rtc$IMZ
rtc$IMZ	SEGMENT
__RTC_InitBase.rtc$IMZ DD FLAT:__RTC_InitBase
; Function compile flags: /Odtp /RTCsu /ZI
rtc$IMZ	ENDS
;	COMDAT __Log2VisBuffered
_TEXT	SEGMENT
_s$ = 8							; size = 4
_pMaxNumChars$ = 12					; size = 4
__Log2VisBuffered PROC					; COMDAT
; Line 45
	push	ebp
	mov	ebp, esp
	sub	esp, 192				; 000000c0H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-192]
	mov	ecx, 48					; 00000030H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 46
	mov	eax, DWORD PTR _pMaxNumChars$[ebp]
	mov	DWORD PTR _pMaxNumChars$[ebp], eax
; Line 47
	mov	eax, DWORD PTR _s$[ebp]
; Line 48
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
__Log2VisBuffered ENDP
_TEXT	ENDS
PUBLIC	_GUI__GetLineNumChars
EXTRN	_GUI_UC__GetCharCodeInc:PROC
EXTRN	_GUI_Context:BYTE
EXTRN	__RTC_CheckEsp:PROC
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT _GUI__GetLineNumChars
_TEXT	SEGMENT
_Data$8376 = -20					; size = 2
_NumChars$ = -8						; size = 4
_s$ = 8							; size = 4
_MaxNumChars$ = 12					; size = 4
_GUI__GetLineNumChars PROC				; COMDAT
; Line 106
	push	ebp
	mov	ebp, esp
	sub	esp, 216				; 000000d8H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-216]
	mov	ecx, 54					; 00000036H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 107
	mov	DWORD PTR _NumChars$[ebp], 0
; Line 108
	cmp	DWORD PTR _s$[ebp], 0
	je	SHORT $LN8@GUI__GetLi
; Line 109
	mov	eax, DWORD PTR _GUI_Context+28
	cmp	DWORD PTR [eax+20], 0
	je	SHORT $LN7@GUI__GetLi
; Line 110
	mov	eax, DWORD PTR _GUI_Context+28
	mov	ecx, DWORD PTR [eax+20]
	cmp	DWORD PTR [ecx+4], 0
	je	SHORT $LN7@GUI__GetLi
; Line 111
	mov	esi, esp
	mov	eax, DWORD PTR _MaxNumChars$[ebp]
	push	eax
	mov	ecx, DWORD PTR _s$[ebp]
	push	ecx
	mov	edx, DWORD PTR _GUI_Context+28
	mov	eax, DWORD PTR [edx+20]
	mov	ecx, DWORD PTR [eax+4]
	call	ecx
	add	esp, 8
	cmp	esi, esp
	call	__RTC_CheckEsp
	jmp	SHORT $LN9@GUI__GetLi
$LN7@GUI__GetLi:
; Line 113
	jmp	SHORT $LN5@GUI__GetLi
$LN4@GUI__GetLi:
; Line 114
	mov	eax, DWORD PTR _NumChars$[ebp]
	add	eax, 1
	mov	DWORD PTR _NumChars$[ebp], eax
$LN5@GUI__GetLi:
	mov	eax, DWORD PTR _NumChars$[ebp]
	cmp	eax, DWORD PTR _MaxNumChars$[ebp]
	jge	SHORT $LN8@GUI__GetLi
; Line 115
	lea	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_GUI_UC__GetCharCodeInc
	add	esp, 4
	mov	WORD PTR _Data$8376[ebp], ax
; Line 116
	movzx	eax, WORD PTR _Data$8376[ebp]
	test	eax, eax
	je	SHORT $LN1@GUI__GetLi
	movzx	eax, WORD PTR _Data$8376[ebp]
	cmp	eax, 10					; 0000000aH
	jne	SHORT $LN2@GUI__GetLi
$LN1@GUI__GetLi:
; Line 117
	jmp	SHORT $LN8@GUI__GetLi
$LN2@GUI__GetLi:
; Line 119
	jmp	SHORT $LN4@GUI__GetLi
$LN8@GUI__GetLi:
; Line 121
	mov	eax, DWORD PTR _NumChars$[ebp]
$LN9@GUI__GetLi:
; Line 122
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 216				; 000000d8H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
_GUI__GetLineNumChars ENDP
_TEXT	ENDS
PUBLIC	_GUI__GetOverlap
EXTRN	@_RTC_CheckStackVars@8:PROC
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT _GUI__GetOverlap
_TEXT	SEGMENT
_r$ = -40						; size = 4
_Size$ = -28						; size = 4
_CharInfo$ = -16					; size = 12
_Char$ = 8						; size = 2
_GUI__GetOverlap PROC					; COMDAT
; Line 128
	push	ebp
	mov	ebp, esp
	sub	esp, 236				; 000000ecH
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-236]
	mov	ecx, 59					; 0000003bH
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 131
	mov	DWORD PTR _r$[ebp], 0
; Line 132
	mov	eax, DWORD PTR _GUI_Context+28
	cmp	DWORD PTR [eax+16], 0
	je	SHORT $LN3@GUI__GetOv
; Line 133
	mov	esi, esp
	lea	eax, DWORD PTR _CharInfo$[ebp]
	push	eax
	movzx	ecx, WORD PTR _Char$[ebp]
	push	ecx
	mov	edx, DWORD PTR _GUI_Context+28
	mov	eax, DWORD PTR [edx+16]
	call	eax
	add	esp, 8
	cmp	esi, esp
	call	__RTC_CheckEsp
	test	eax, eax
	jne	SHORT $LN3@GUI__GetOv
; Line 134
	movzx	eax, BYTE PTR _CharInfo$[ebp]
	movsx	ecx, BYTE PTR _CharInfo$[ebp+2]
	add	eax, ecx
	mov	DWORD PTR _Size$[ebp], eax
; Line 135
	movzx	eax, BYTE PTR _CharInfo$[ebp+4]
	cmp	DWORD PTR _Size$[ebp], eax
	jle	SHORT $LN3@GUI__GetOv
; Line 136
	movzx	eax, BYTE PTR _CharInfo$[ebp+4]
	mov	ecx, DWORD PTR _Size$[ebp]
	sub	ecx, eax
	mov	DWORD PTR _r$[ebp], ecx
$LN3@GUI__GetOv:
; Line 140
	mov	eax, DWORD PTR _r$[ebp]
; Line 141
	push	edx
	mov	ecx, ebp
	push	eax
	lea	edx, DWORD PTR $LN8@GUI__GetOv
	call	@_RTC_CheckStackVars@8
	pop	eax
	pop	edx
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 236				; 000000ecH
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
	npad	2
$LN8@GUI__GetOv:
	DD	1
	DD	$LN7@GUI__GetOv
$LN7@GUI__GetOv:
	DD	-16					; fffffff0H
	DD	12					; 0000000cH
	DD	$LN6@GUI__GetOv
$LN6@GUI__GetOv:
	DB	67					; 00000043H
	DB	104					; 00000068H
	DB	97					; 00000061H
	DB	114					; 00000072H
	DB	73					; 00000049H
	DB	110					; 0000006eH
	DB	102					; 00000066H
	DB	111					; 0000006fH
	DB	0
_GUI__GetOverlap ENDP
_TEXT	ENDS
PUBLIC	_GUI__GetLineDistX
EXTRN	_GUI_GetCharDistX:PROC
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT _GUI__GetLineDistX
_TEXT	SEGMENT
_Char$8396 = -20					; size = 2
_Dist$ = -8						; size = 4
_s$ = 8							; size = 4
_MaxNumChars$ = 12					; size = 4
_GUI__GetLineDistX PROC					; COMDAT
; Line 149
	push	ebp
	mov	ebp, esp
	sub	esp, 216				; 000000d8H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-216]
	mov	ecx, 54					; 00000036H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 154
	mov	esi, esp
	lea	eax, DWORD PTR _MaxNumChars$[ebp]
	push	eax
	mov	ecx, DWORD PTR _s$[ebp]
	push	ecx
	call	DWORD PTR _GUI_CharLine_pfLog2Vis
	add	esp, 8
	cmp	esi, esp
	call	__RTC_CheckEsp
	mov	DWORD PTR _s$[ebp], eax
; Line 158
	mov	DWORD PTR _Dist$[ebp], 0
; Line 159
	cmp	DWORD PTR _s$[ebp], 0
	je	$LN5@GUI__GetLi@2
; Line 160
	xor	eax, eax
	mov	WORD PTR _Char$8396[ebp], ax
; Line 161
	mov	eax, DWORD PTR _GUI_Context+28
	cmp	DWORD PTR [eax+20], 0
	je	SHORT $LN2@GUI__GetLi@2
; Line 162
	mov	eax, DWORD PTR _GUI_Context+28
	mov	ecx, DWORD PTR [eax+20]
	cmp	DWORD PTR [ecx], 0
	je	SHORT $LN2@GUI__GetLi@2
; Line 163
	mov	esi, esp
	mov	eax, DWORD PTR _MaxNumChars$[ebp]
	push	eax
	mov	ecx, DWORD PTR _s$[ebp]
	push	ecx
	mov	edx, DWORD PTR _GUI_Context+28
	mov	eax, DWORD PTR [edx+20]
	mov	ecx, DWORD PTR [eax]
	call	ecx
	add	esp, 8
	cmp	esi, esp
	call	__RTC_CheckEsp
	jmp	SHORT $LN6@GUI__GetLi@2
$LN2@GUI__GetLi@2:
; Line 166
	mov	eax, DWORD PTR _MaxNumChars$[ebp]
	sub	eax, 1
	mov	DWORD PTR _MaxNumChars$[ebp], eax
	js	SHORT $LN1@GUI__GetLi@2
; Line 167
	lea	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_GUI_UC__GetCharCodeInc
	add	esp, 4
	mov	WORD PTR _Char$8396[ebp], ax
; Line 168
	movzx	eax, WORD PTR _Char$8396[ebp]
	push	eax
	call	_GUI_GetCharDistX
	add	esp, 4
	add	eax, DWORD PTR _Dist$[ebp]
	mov	DWORD PTR _Dist$[ebp], eax
; Line 169
	jmp	SHORT $LN2@GUI__GetLi@2
$LN1@GUI__GetLi@2:
; Line 170
	movzx	eax, WORD PTR _Char$8396[ebp]
	push	eax
	call	_GUI__GetOverlap
	add	esp, 4
	add	eax, DWORD PTR _Dist$[ebp]
	mov	DWORD PTR _Dist$[ebp], eax
$LN5@GUI__GetLi@2:
; Line 172
	mov	eax, DWORD PTR _Dist$[ebp]
$LN6@GUI__GetLi@2:
; Line 173
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 216				; 000000d8H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
_GUI__GetLineDistX ENDP
_TEXT	ENDS
PUBLIC	_GUI__DispLine
EXTRN	_WM__GetNextIVR:PROC
EXTRN	_WM__InitIVRSearch:PROC
EXTRN	_GUI_pLCD_APIList:DWORD
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT _GUI__DispLine
_TEXT	SEGMENT
_r$ = -12						; size = 8
_s$ = 8							; size = 4
_MaxNumChars$ = 12					; size = 4
_pr$ = 16						; size = 4
_GUI__DispLine PROC					; COMDAT
; Line 179
	push	ebp
	mov	ebp, esp
	sub	esp, 208				; 000000d0H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-208]
	mov	ecx, 52					; 00000034H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 182
	cmp	DWORD PTR _GUI_pLCD_APIList, 0
	je	SHORT $LN10@GUI__DispL
; Line 184
	push	0
	call	_WM__InitIVRSearch
	add	esp, 4
	test	eax, eax
	je	SHORT $LN9@GUI__DispL
$LN8@GUI__DispL:
; Line 189
	lea	eax, DWORD PTR _r$[ebp]
	push	eax
	mov	ecx, DWORD PTR _MaxNumChars$[ebp]
	push	ecx
	mov	edx, DWORD PTR _s$[ebp]
	push	edx
	call	__DispLine
	add	esp, 12					; 0000000cH
; Line 191
	call	_WM__GetNextIVR
	test	eax, eax
	jne	SHORT $LN8@GUI__DispL
$LN9@GUI__DispL:
; Line 193
	jmp	$LN11@GUI__DispL
$LN10@GUI__DispL:
; Line 196
	mov	eax, DWORD PTR _pr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR _r$[ebp], ecx
	mov	DWORD PTR _r$[ebp+4], edx
; Line 198
	movsx	eax, WORD PTR _r$[ebp]
	add	eax, DWORD PTR _GUI_Context+64
	mov	WORD PTR _r$[ebp], ax
	movsx	eax, WORD PTR _r$[ebp+2]
	add	eax, DWORD PTR _GUI_Context+68
	mov	WORD PTR _r$[ebp+2], ax
; Line 199
	movsx	eax, WORD PTR _r$[ebp+4]
	add	eax, DWORD PTR _GUI_Context+64
	mov	WORD PTR _r$[ebp+4], ax
	movsx	eax, WORD PTR _r$[ebp+6]
	add	eax, DWORD PTR _GUI_Context+68
	mov	WORD PTR _r$[ebp+6], ax
; Line 200
	lea	eax, DWORD PTR _r$[ebp]
	push	eax
	call	_WM__InitIVRSearch
	add	esp, 4
	test	eax, eax
	je	SHORT $LN4@GUI__DispL
$LN3@GUI__DispL:
; Line 202
	mov	ax, WORD PTR _r$[ebp]
	mov	WORD PTR _GUI_Context+34, ax
; Line 203
	mov	ax, WORD PTR _r$[ebp+2]
	mov	WORD PTR _GUI_Context+36, ax
; Line 207
	lea	eax, DWORD PTR _r$[ebp]
	push	eax
	mov	ecx, DWORD PTR _MaxNumChars$[ebp]
	push	ecx
	mov	edx, DWORD PTR _s$[ebp]
	push	edx
	call	__DispLine
	add	esp, 12					; 0000000cH
; Line 209
	call	_WM__GetNextIVR
	test	eax, eax
	jne	SHORT $LN3@GUI__DispL
$LN4@GUI__DispL:
; Line 210
	movsx	eax, WORD PTR _GUI_Context+34
	sub	eax, DWORD PTR _GUI_Context+64
	mov	WORD PTR _GUI_Context+34, ax
	movsx	eax, WORD PTR _GUI_Context+36
	sub	eax, DWORD PTR _GUI_Context+68
	mov	WORD PTR _GUI_Context+36, ax
$LN11@GUI__DispL:
; Line 213
	push	edx
	mov	ecx, ebp
	push	eax
	lea	edx, DWORD PTR $LN15@GUI__DispL
	call	@_RTC_CheckStackVars@8
	pop	eax
	pop	edx
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 208				; 000000d0H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
	npad	3
$LN15@GUI__DispL:
	DD	1
	DD	$LN14@GUI__DispL
$LN14@GUI__DispL:
	DD	-12					; fffffff4H
	DD	8
	DD	$LN13@GUI__DispL
$LN13@GUI__DispL:
	DB	114					; 00000072H
	DB	0
_GUI__DispLine ENDP
_TEXT	ENDS
EXTRN	_GUI_pfDispCharStyle:DWORD
EXTRN	_GUI_RectsIntersect:PROC
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT __DispLine
_TEXT	SEGMENT
_Char$8359 = -8						; size = 2
_s$ = 8							; size = 4
_MaxNumChars$ = 12					; size = 4
_pRect$ = 16						; size = 4
__DispLine PROC						; COMDAT
; Line 70
	push	ebp
	mov	ebp, esp
	sub	esp, 204				; 000000ccH
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-204]
	mov	ecx, 51					; 00000033H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 74
	mov	esi, esp
	lea	eax, DWORD PTR _MaxNumChars$[ebp]
	push	eax
	mov	ecx, DWORD PTR _s$[ebp]
	push	ecx
	call	DWORD PTR _GUI_CharLine_pfLog2Vis
	add	esp, 8
	cmp	esi, esp
	call	__RTC_CheckEsp
	mov	DWORD PTR _s$[ebp], eax
; Line 78
	cmp	DWORD PTR _GUI_Context+20, 0
	je	SHORT $LN7@DispLine
; Line 79
	mov	eax, DWORD PTR _pRect$[ebp]
	push	eax
	mov	ecx, DWORD PTR _GUI_Context+20
	push	ecx
	call	_GUI_RectsIntersect
	add	esp, 8
	test	eax, eax
	jne	SHORT $LN7@DispLine
; Line 80
	jmp	$LN8@DispLine
$LN7@DispLine:
; Line 82
	mov	eax, DWORD PTR _GUI_Context+28
	cmp	DWORD PTR [eax+20], 0
	je	SHORT $LN3@DispLine
; Line 83
	mov	esi, esp
	mov	eax, DWORD PTR _MaxNumChars$[ebp]
	push	eax
	mov	ecx, DWORD PTR _s$[ebp]
	push	ecx
	mov	edx, DWORD PTR _GUI_Context+28
	mov	eax, DWORD PTR [edx+20]
	mov	ecx, DWORD PTR [eax+8]
	call	ecx
	add	esp, 8
	cmp	esi, esp
	call	__RTC_CheckEsp
; Line 84
	jmp	SHORT $LN8@DispLine
$LN3@DispLine:
; Line 86
	mov	eax, DWORD PTR _MaxNumChars$[ebp]
	sub	eax, 1
	mov	DWORD PTR _MaxNumChars$[ebp], eax
	js	SHORT $LN8@DispLine
; Line 87
	lea	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_GUI_UC__GetCharCodeInc
	add	esp, 4
	mov	WORD PTR _Char$8359[ebp], ax
; Line 88
	mov	esi, esp
	movzx	eax, WORD PTR _Char$8359[ebp]
	push	eax
	mov	ecx, DWORD PTR _GUI_Context+28
	mov	edx, DWORD PTR [ecx]
	call	edx
	add	esp, 4
	cmp	esi, esp
	call	__RTC_CheckEsp
; Line 89
	cmp	DWORD PTR _GUI_pfDispCharStyle, 0
	je	SHORT $LN1@DispLine
; Line 90
	mov	esi, esp
	movzx	eax, WORD PTR _Char$8359[ebp]
	push	eax
	call	DWORD PTR _GUI_pfDispCharStyle
	add	esp, 4
	cmp	esi, esp
	call	__RTC_CheckEsp
$LN1@DispLine:
; Line 92
	jmp	SHORT $LN3@DispLine
$LN8@DispLine:
; Line 94
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 204				; 000000ccH
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
__DispLine ENDP
_TEXT	ENDS
END
