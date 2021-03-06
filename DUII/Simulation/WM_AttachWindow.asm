﻿; Listing generated by Microsoft (R) Optimizing Compiler Version 16.00.40219.01 

	TITLE	C:\DUII\Simulation\GUI\WM\WM_AttachWindow.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	_WM_DetachWindow
EXTRN	_WM_MoveWindow:PROC
EXTRN	_WM__DetachWindow:PROC
EXTRN	_GUI_ALLOC_h2p:PROC
EXTRN	__RTC_CheckEsp:PROC
EXTRN	__RTC_Shutdown:PROC
EXTRN	__RTC_InitBase:PROC
;	COMDAT rtc$TMZ
; File c:\duii\simulation\gui\wm\wm_attachwindow.c
rtc$TMZ	SEGMENT
__RTC_Shutdown.rtc$TMZ DD FLAT:__RTC_Shutdown
rtc$TMZ	ENDS
;	COMDAT rtc$IMZ
rtc$IMZ	SEGMENT
__RTC_InitBase.rtc$IMZ DD FLAT:__RTC_InitBase
; Function compile flags: /Odtp /RTCsu /ZI
rtc$IMZ	ENDS
;	COMDAT _WM_DetachWindow
_TEXT	SEGMENT
_pParent$9439 = -32					; size = 4
_pWin$9436 = -20					; size = 4
_hParent$9435 = -8					; size = 4
_hWin$ = 8						; size = 4
_WM_DetachWindow PROC					; COMDAT
; Line 37
	push	ebp
	mov	ebp, esp
	sub	esp, 228				; 000000e4H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-228]
	mov	ecx, 57					; 00000039H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 38
	cmp	DWORD PTR _hWin$[ebp], 0
	je	SHORT $LN3@WM_DetachW
; Line 42
	mov	eax, DWORD PTR _hWin$[ebp]
	push	eax
	call	_GUI_ALLOC_h2p
	add	esp, 4
	mov	DWORD PTR _pWin$9436[ebp], eax
; Line 43
	mov	eax, DWORD PTR _pWin$9436[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR _hParent$9435[ebp], ecx
; Line 44
	cmp	DWORD PTR _hParent$9435[ebp], 0
	je	SHORT $LN3@WM_DetachW
; Line 46
	mov	eax, DWORD PTR _hWin$[ebp]
	push	eax
	call	_WM__DetachWindow
	add	esp, 4
; Line 47
	mov	eax, DWORD PTR _hParent$9435[ebp]
	push	eax
	call	_GUI_ALLOC_h2p
	add	esp, 4
	mov	DWORD PTR _pParent$9439[ebp], eax
; Line 48
	mov	eax, DWORD PTR _pParent$9439[ebp]
	movsx	ecx, WORD PTR [eax+2]
	neg	ecx
	push	ecx
	mov	edx, DWORD PTR _pParent$9439[ebp]
	movsx	eax, WORD PTR [edx]
	neg	eax
	push	eax
	mov	ecx, DWORD PTR _hWin$[ebp]
	push	ecx
	call	_WM_MoveWindow
	add	esp, 12					; 0000000cH
$LN3@WM_DetachW:
; Line 52
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 228				; 000000e4H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
_WM_DetachWindow ENDP
_TEXT	ENDS
PUBLIC	_WM_AttachWindow
EXTRN	_WM_InvalidateWindow:PROC
EXTRN	_WM__InsertWindowIntoList:PROC
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT _WM_AttachWindow
_TEXT	SEGMENT
_pParent$9449 = -20					; size = 4
_pWin$9447 = -8						; size = 4
_hWin$ = 8						; size = 4
_hParent$ = 12						; size = 4
_WM_AttachWindow PROC					; COMDAT
; Line 58
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
; Line 60
	cmp	DWORD PTR _hParent$[ebp], 0
	je	SHORT $LN3@WM_AttachW
	mov	eax, DWORD PTR _hParent$[ebp]
	cmp	eax, DWORD PTR _hWin$[ebp]
	je	SHORT $LN3@WM_AttachW
; Line 61
	mov	eax, DWORD PTR _hWin$[ebp]
	push	eax
	call	_GUI_ALLOC_h2p
	add	esp, 4
	mov	DWORD PTR _pWin$9447[ebp], eax
; Line 62
	mov	eax, DWORD PTR _hParent$[ebp]
	push	eax
	call	_GUI_ALLOC_h2p
	add	esp, 4
	mov	DWORD PTR _pParent$9449[ebp], eax
; Line 63
	mov	eax, DWORD PTR _pWin$9447[ebp]
	mov	ecx, DWORD PTR [eax+24]
	cmp	ecx, DWORD PTR _hParent$[ebp]
	je	SHORT $LN3@WM_AttachW
; Line 64
	mov	eax, DWORD PTR _hWin$[ebp]
	push	eax
	call	_WM_DetachWindow
	add	esp, 4
; Line 65
	mov	eax, DWORD PTR _hParent$[ebp]
	push	eax
	mov	ecx, DWORD PTR _hWin$[ebp]
	push	ecx
	call	_WM__InsertWindowIntoList
	add	esp, 8
; Line 66
	mov	eax, DWORD PTR _pParent$9449[ebp]
	movsx	ecx, WORD PTR [eax+2]
	push	ecx
	mov	edx, DWORD PTR _pParent$9449[ebp]
	movsx	eax, WORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _hWin$[ebp]
	push	ecx
	call	_WM_MoveWindow
	add	esp, 12					; 0000000cH
; Line 67
	mov	eax, DWORD PTR _hWin$[ebp]
	push	eax
	call	_WM_InvalidateWindow
	add	esp, 4
$LN3@WM_AttachW:
; Line 71
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 216				; 000000d8H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
_WM_AttachWindow ENDP
_TEXT	ENDS
PUBLIC	_WM_AttachWindowAt
EXTRN	_WM_MoveTo:PROC
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT _WM_AttachWindowAt
_TEXT	SEGMENT
_hWin$ = 8						; size = 4
_hParent$ = 12						; size = 4
_x$ = 16						; size = 4
_y$ = 20						; size = 4
_WM_AttachWindowAt PROC					; COMDAT
; Line 77
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
; Line 78
	mov	eax, DWORD PTR _hWin$[ebp]
	push	eax
	call	_WM_DetachWindow
	add	esp, 4
; Line 79
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	ecx, DWORD PTR _x$[ebp]
	push	ecx
	mov	edx, DWORD PTR _hWin$[ebp]
	push	edx
	call	_WM_MoveTo
	add	esp, 12					; 0000000cH
; Line 80
	mov	eax, DWORD PTR _hParent$[ebp]
	push	eax
	mov	ecx, DWORD PTR _hWin$[ebp]
	push	ecx
	call	_WM_AttachWindow
	add	esp, 8
; Line 81
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 192				; 000000c0H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
_WM_AttachWindowAt ENDP
_TEXT	ENDS
END
