	.file	"program.c"
	.intel_syntax noprefix
	.text
	.globl	"global_value"
	.data
	.align 4
"global_value":
	.long	10
	.globl	"global_empty"
	.bss
	.align 4
"global_empty":
	.space 4
	.text
	.globl	"add"
	.def	"add";	.scl	2;	.type	32;	.endef
	.seh_proc	"add"
"add":
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	DWORD PTR 24[rbp], edx
	mov	edx, DWORD PTR 16[rbp]
	mov	eax, DWORD PTR 24[rbp]
	add	eax, edx
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "Result: %d\12\0"
	.text
	.globl	"main"
	.def	"main";	.scl	2;	.type	32;	.endef
	.seh_proc	"main"
"main":
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	call	"__main"
	mov	eax, DWORD PTR "global_value"[rip]
	mov	edx, 20
	mov	ecx, eax
	call	"add"
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	lea	rcx, .LC0[rip]
	mov	edx, eax
	call	"printf"
	mov	eax, 0
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.def	"__main";	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev4, Built by MSYS2 project) 16.2.0"
	.def	"printf";	.scl	2;	.type	32;	.endef
