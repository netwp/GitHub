﻿; Listing generated by Microsoft (R) Optimizing Compiler Version 16.00.40219.01 

	TITLE	C:\DUII\Simulation\GUI\Core\GUI_UC_DispString.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	_GUI_UC_DispString
EXTRN	_GUI_GetFontDistY:PROC
EXTRN	_GUI_GetYAdjust:PROC
EXTRN	_GUI_Context:BYTE
EXTRN	__RTC_CheckEsp:PROC
EXTRN	@_RTC_CheckStackVars@8:PROC
EXTRN	__RTC_Shutdown:PROC
EXTRN	__RTC_InitBase:PROC
;	COMDAT rtc$TMZ
; File c:\duii\simulation\gui\core\gui_uc_dispstring.c
rtc$TMZ	SEGMENT
__RTC_Shutdown.rtc$TMZ DD FLAT:__RTC_Shutdown
rtc$TMZ	ENDS
;	COMDAT rtc$IMZ
rtc$IMZ	SEGMENT
__RTC_InitBase.rtc$IMZ DD FLAT:__RTC_InitBase
; Function compile flags: /Odtp /RTCsu /ZI
rtc$IMZ	ENDS
;	COMDAT _GUI_UC_DispString
_TEXT	SEGMENT
tv139 = -284						; size = 4
tv83 = -284						; size = 4
_xLineSize$8398 = -84					; size = 4
_LineLen$8397 = -72					; size = 4
_r$8396 = -60						; size = 8
_FontSizeY$ = -44					; size = 4
_xOrg$ = -32						; size = 4
_yAdjust$ = -20						; size = 4
_xAdjust$ = -8						; size = 4
_s$ = 8							; size = 4
_GUI_UC_DispString PROC					; COMDAT
; Line 115
	push	ebp
	mov	ebp, esp
	sub	esp, 284				; 0000011cH
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-284]
	mov	ecx, 71					; 00000047H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 118
	cmp	DWORD PTR _s$[ebp], 0
	jne	SHORT $LN16@GUI_UC_Dis
; Line 119
	jmp	$LN17@GUI_UC_Dis
$LN16@GUI_UC_Dis:
; Line 121
	mov	eax, DWORD PTR _GUI_Context+28
	movzx	ecx, BYTE PTR [eax+24]
	mov	DWORD PTR _FontSizeY$[ebp], ecx
; Line 122
	movsx	eax, WORD PTR _GUI_Context+34
	mov	DWORD PTR _xOrg$[ebp], eax
; Line 124
	call	_GUI_GetYAdjust
	mov	DWORD PTR _yAdjust$[ebp], eax
; Line 125
	movsx	eax, WORD PTR _GUI_Context+36
	sub	eax, DWORD PTR _yAdjust$[ebp]
	mov	WORD PTR _GUI_Context+36, ax
	jmp	SHORT $LN15@GUI_UC_Dis
$LN14@GUI_UC_Dis:
; Line 126
	mov	eax, DWORD PTR _s$[ebp]
	add	eax, 2
	mov	DWORD PTR _s$[ebp], eax
$LN15@GUI_UC_Dis:
	mov	eax, DWORD PTR _s$[ebp]
	movzx	ecx, WORD PTR [eax]
	test	ecx, ecx
	je	$LN13@GUI_UC_Dis
; Line 128
	push	32767					; 00007fffH
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	__GetLineLen
	add	esp, 8
	mov	DWORD PTR _LineLen$8397[ebp], eax
; Line 129
	mov	eax, DWORD PTR _LineLen$8397[ebp]
	push	eax
	mov	ecx, DWORD PTR _s$[ebp]
	push	ecx
	call	__GetLineDistX
	add	esp, 8
	mov	DWORD PTR _xLineSize$8398[ebp], eax
; Line 131
	movsx	eax, WORD PTR _GUI_Context+44
	and	eax, 3
	mov	DWORD PTR tv83[ebp], eax
	cmp	DWORD PTR tv83[ebp], 1
	je	SHORT $LN9@GUI_UC_Dis
	cmp	DWORD PTR tv83[ebp], 2
	je	SHORT $LN10@GUI_UC_Dis
	jmp	SHORT $LN8@GUI_UC_Dis
$LN10@GUI_UC_Dis:
; Line 132
	mov	eax, DWORD PTR _xLineSize$8398[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _xAdjust$[ebp], eax
	jmp	SHORT $LN11@GUI_UC_Dis
$LN9@GUI_UC_Dis:
; Line 133
	mov	eax, DWORD PTR _xLineSize$8398[ebp]
	mov	DWORD PTR _xAdjust$[ebp], eax
	jmp	SHORT $LN11@GUI_UC_Dis
$LN8@GUI_UC_Dis:
; Line 134
	mov	DWORD PTR _xAdjust$[ebp], 0
$LN11@GUI_UC_Dis:
; Line 136
	movsx	eax, WORD PTR _GUI_Context+34
	sub	eax, DWORD PTR _xAdjust$[ebp]
	mov	WORD PTR _GUI_Context+34, ax
	mov	cx, WORD PTR _GUI_Context+34
	mov	WORD PTR _r$8396[ebp], cx
; Line 137
	movsx	eax, WORD PTR _r$8396[ebp]
	mov	ecx, DWORD PTR _xLineSize$8398[ebp]
	lea	edx, DWORD PTR [eax+ecx-1]
	mov	WORD PTR _r$8396[ebp+4], dx
; Line 138
	mov	ax, WORD PTR _GUI_Context+36
	mov	WORD PTR _r$8396[ebp+2], ax
; Line 139
	movsx	eax, WORD PTR _r$8396[ebp+2]
	mov	ecx, DWORD PTR _FontSizeY$[ebp]
	lea	edx, DWORD PTR [eax+ecx-1]
	mov	WORD PTR _r$8396[ebp+6], dx
; Line 140
	lea	eax, DWORD PTR _r$8396[ebp]
	push	eax
	mov	ecx, DWORD PTR _LineLen$8397[ebp]
	push	ecx
	mov	edx, DWORD PTR _s$[ebp]
	push	edx
	call	__DispLine
	add	esp, 12					; 0000000cH
; Line 141
	mov	ax, WORD PTR _r$8396[ebp+2]
	mov	WORD PTR _GUI_Context+36, ax
; Line 142
	mov	eax, DWORD PTR _LineLen$8397[ebp]
	mov	ecx, DWORD PTR _s$[ebp]
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	DWORD PTR _s$[ebp], edx
; Line 143
	mov	eax, DWORD PTR _s$[ebp]
	movzx	ecx, WORD PTR [eax]
	cmp	ecx, 10					; 0000000aH
	jne	SHORT $LN7@GUI_UC_Dis
; Line 144
	movsx	eax, WORD PTR _GUI_Context+44
	and	eax, 3
	mov	DWORD PTR tv139[ebp], eax
	jle	SHORT $LN3@GUI_UC_Dis
	cmp	DWORD PTR tv139[ebp], 2
	jle	SHORT $LN4@GUI_UC_Dis
	jmp	SHORT $LN3@GUI_UC_Dis
$LN4@GUI_UC_Dis:
; Line 147
	mov	ax, WORD PTR _xOrg$[ebp]
	mov	WORD PTR _GUI_Context+34, ax
; Line 148
	jmp	SHORT $LN5@GUI_UC_Dis
$LN3@GUI_UC_Dis:
; Line 150
	mov	ax, WORD PTR _GUI_Context+32
	mov	WORD PTR _GUI_Context+34, ax
$LN5@GUI_UC_Dis:
; Line 153
	call	_GUI_GetFontDistY
	movsx	ecx, WORD PTR _GUI_Context+36
	add	ecx, eax
	mov	WORD PTR _GUI_Context+36, cx
; Line 154
	jmp	SHORT $LN2@GUI_UC_Dis
$LN7@GUI_UC_Dis:
; Line 155
	movsx	eax, WORD PTR _r$8396[ebp]
	add	eax, DWORD PTR _xLineSize$8398[ebp]
	mov	WORD PTR _GUI_Context+34, ax
$LN2@GUI_UC_Dis:
; Line 157
	mov	eax, DWORD PTR _s$[ebp]
	movzx	ecx, WORD PTR [eax]
	test	ecx, ecx
	jne	SHORT $LN1@GUI_UC_Dis
; Line 158
	jmp	SHORT $LN13@GUI_UC_Dis
$LN1@GUI_UC_Dis:
; Line 159
	jmp	$LN14@GUI_UC_Dis
$LN13@GUI_UC_Dis:
; Line 160
	movsx	eax, WORD PTR _GUI_Context+36
	add	eax, DWORD PTR _yAdjust$[ebp]
	mov	WORD PTR _GUI_Context+36, ax
; Line 161
	movsx	eax, WORD PTR _GUI_Context+44
	and	eax, -4					; fffffffcH
	mov	WORD PTR _GUI_Context+44, ax
$LN17@GUI_UC_Dis:
; Line 163
	push	edx
	mov	ecx, ebp
	push	eax
	lea	edx, DWORD PTR $LN21@GUI_UC_Dis
	call	@_RTC_CheckStackVars@8
	pop	eax
	pop	edx
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 284				; 0000011cH
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
	npad	2
$LN21@GUI_UC_Dis:
	DD	1
	DD	$LN20@GUI_UC_Dis
$LN20@GUI_UC_Dis:
	DD	-60					; ffffffc4H
	DD	8
	DD	$LN19@GUI_UC_Dis
$LN19@GUI_UC_Dis:
	DB	114					; 00000072H
	DB	0
_GUI_UC_DispString ENDP
_TEXT	ENDS
EXTRN	_GUI_GetCharDistX:PROC
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT __GetLineDistX
_TEXT	SEGMENT
_Char$8343 = -20					; size = 2
_Dist$ = -8						; size = 4
_s$ = 8							; size = 4
_MaxNumChars$ = 12					; size = 4
__GetLineDistX PROC					; COMDAT
; Line 37
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
; Line 38
	mov	DWORD PTR _Dist$[ebp], 0
; Line 39
	cmp	DWORD PTR _s$[ebp], 0
	je	SHORT $LN3@GetLineDis
$LN2@GetLineDis:
; Line 41
	mov	eax, DWORD PTR _s$[ebp]
	mov	cx, WORD PTR [eax]
	mov	WORD PTR _Char$8343[ebp], cx
	movzx	edx, WORD PTR _Char$8343[ebp]
	test	edx, edx
	je	SHORT $LN3@GetLineDis
	cmp	DWORD PTR _MaxNumChars$[ebp], 0
	jl	SHORT $LN3@GetLineDis
; Line 42
	mov	eax, DWORD PTR _s$[ebp]
	add	eax, 2
	mov	DWORD PTR _s$[ebp], eax
; Line 43
	mov	eax, DWORD PTR _MaxNumChars$[ebp]
	sub	eax, 1
	mov	DWORD PTR _MaxNumChars$[ebp], eax
; Line 44
	movzx	eax, WORD PTR _Char$8343[ebp]
	push	eax
	call	_GUI_GetCharDistX
	add	esp, 4
	add	eax, DWORD PTR _Dist$[ebp]
	mov	DWORD PTR _Dist$[ebp], eax
; Line 45
	jmp	SHORT $LN2@GetLineDis
$LN3@GetLineDis:
; Line 47
	mov	eax, DWORD PTR _Dist$[ebp]
; Line 48
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 216				; 000000d8H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
__GetLineDistX ENDP
; Function compile flags: /Odtp /RTCsu /ZI
_TEXT	ENDS
;	COMDAT __GetLineLen
_TEXT	SEGMENT
_Len$ = -8						; size = 4
_s$ = 8							; size = 4
_MaxLen$ = 12						; size = 4
__GetLineLen PROC					; COMDAT
; Line 54
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
; Line 55
	mov	DWORD PTR _Len$[ebp], 0
; Line 56
	cmp	DWORD PTR _s$[ebp], 0
	jne	SHORT $LN2@GetLineLen
; Line 57
	xor	eax, eax
	jmp	SHORT $LN4@GetLineLen
$LN2@GetLineLen:
; Line 59
	mov	eax, DWORD PTR _s$[ebp]
	movzx	ecx, WORD PTR [eax]
	test	ecx, ecx
	je	SHORT $LN1@GetLineLen
	mov	eax, DWORD PTR _Len$[ebp]
	cmp	eax, DWORD PTR _MaxLen$[ebp]
	jge	SHORT $LN1@GetLineLen
; Line 60
	mov	eax, DWORD PTR _Len$[ebp]
	add	eax, 1
	mov	DWORD PTR _Len$[ebp], eax
	mov	eax, DWORD PTR _s$[ebp]
	add	eax, 2
	mov	DWORD PTR _s$[ebp], eax
; Line 61
	jmp	SHORT $LN2@GetLineLen
$LN1@GetLineLen:
; Line 63
	mov	eax, DWORD PTR _Len$[ebp]
$LN4@GetLineLen:
; Line 64
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
__GetLineLen ENDP
_TEXT	ENDS
EXTRN	_WM__GetNextIVR:PROC
EXTRN	_WM__InitIVRSearch:PROC
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT __DispLine
_TEXT	SEGMENT
_r$ = -12						; size = 8
_s$ = 8							; size = 4
_Len$ = 12						; size = 4
_pr$ = 16						; size = 4
__DispLine PROC						; COMDAT
; Line 88
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
; Line 90
	mov	eax, DWORD PTR _pr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR _r$[ebp], ecx
	mov	DWORD PTR _r$[ebp+4], edx
; Line 92
	movsx	eax, WORD PTR _r$[ebp]
	add	eax, DWORD PTR _GUI_Context+64
	mov	WORD PTR _r$[ebp], ax
	movsx	eax, WORD PTR _r$[ebp+2]
	add	eax, DWORD PTR _GUI_Context+68
	mov	WORD PTR _r$[ebp+2], ax
; Line 93
	movsx	eax, WORD PTR _r$[ebp+4]
	add	eax, DWORD PTR _GUI_Context+64
	mov	WORD PTR _r$[ebp+4], ax
	movsx	eax, WORD PTR _r$[ebp+6]
	add	eax, DWORD PTR _GUI_Context+68
	mov	WORD PTR _r$[ebp+6], ax
; Line 94
	lea	eax, DWORD PTR _r$[ebp]
	push	eax
	call	_WM__InitIVRSearch
	add	esp, 4
	test	eax, eax
	je	SHORT $LN4@DispLine
$LN3@DispLine:
; Line 96
	mov	ax, WORD PTR _r$[ebp]
	mov	WORD PTR _GUI_Context+34, ax
; Line 97
	mov	ax, WORD PTR _r$[ebp+2]
	mov	WORD PTR _GUI_Context+36, ax
; Line 98
	lea	eax, DWORD PTR _r$[ebp]
	push	eax
	mov	ecx, DWORD PTR _Len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _s$[ebp]
	push	edx
	call	__DispLine_UC
	add	esp, 12					; 0000000cH
; Line 100
	call	_WM__GetNextIVR
	test	eax, eax
	jne	SHORT $LN3@DispLine
$LN4@DispLine:
; Line 101
	movsx	eax, WORD PTR _GUI_Context+34
	sub	eax, DWORD PTR _GUI_Context+64
	mov	WORD PTR _GUI_Context+34, ax
	movsx	eax, WORD PTR _GUI_Context+36
	sub	eax, DWORD PTR _GUI_Context+68
	mov	WORD PTR _GUI_Context+36, ax
; Line 103
	push	edx
	mov	ecx, ebp
	push	eax
	lea	edx, DWORD PTR $LN9@DispLine
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
$LN9@DispLine:
	DD	1
	DD	$LN8@DispLine
$LN8@DispLine:
	DD	-12					; fffffff4H
	DD	8
	DD	$LN7@DispLine
$LN7@DispLine:
	DB	114					; 00000072H
	DB	0
__DispLine ENDP
_TEXT	ENDS
EXTRN	_GL_DispChar:PROC
EXTRN	_GUI_RectsIntersect:PROC
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT __DispLine_UC
_TEXT	SEGMENT
_c0$8368 = -8						; size = 2
_s$ = 8							; size = 4
_Len$ = 12						; size = 4
_pRect$ = 16						; size = 4
__DispLine_UC PROC					; COMDAT
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
; Line 71
	cmp	DWORD PTR _GUI_Context+20, 0
	je	SHORT $LN2@DispLine_U
; Line 72
	mov	eax, DWORD PTR _pRect$[ebp]
	push	eax
	mov	ecx, DWORD PTR _GUI_Context+20
	push	ecx
	call	_GUI_RectsIntersect
	add	esp, 8
	test	eax, eax
	jne	SHORT $LN2@DispLine_U
; Line 73
	jmp	SHORT $LN5@DispLine_U
$LN2@DispLine_U:
; Line 77
	mov	eax, DWORD PTR _Len$[ebp]
	sub	eax, 1
	mov	DWORD PTR _Len$[ebp], eax
	js	SHORT $LN5@DispLine_U
; Line 78
	mov	eax, DWORD PTR _s$[ebp]
	mov	cx, WORD PTR [eax]
	mov	WORD PTR _c0$8368[ebp], cx
	mov	edx, DWORD PTR _s$[ebp]
	add	edx, 2
	mov	DWORD PTR _s$[ebp], edx
; Line 79
	movzx	eax, WORD PTR _c0$8368[ebp]
	push	eax
	call	_GL_DispChar
	add	esp, 4
; Line 80
	jmp	SHORT $LN2@DispLine_U
$LN5@DispLine_U:
; Line 82
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 204				; 000000ccH
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
__DispLine_UC ENDP
_TEXT	ENDS
END