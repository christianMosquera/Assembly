	.file	"add-unrolled.c"
	.text
	.p2align 4,,15
	.globl	add
	.type	add, @function
add:
.LFB0:
	.cfi_startproc
	movl	(%rsi), %eax
	movl	$1, %ecx
	movl	%eax, %r8d 
	addl	(%rdi), %r8d 
	
	movl	$0, %ecx
	
.L2:

	// C[0] = c
	movl	%r8d, (%rdx) 
	
	//A[1]
	movl	4(%rdi), %r8d 
	
	//B[1]
	movl	4(%rsi), %r9d 

	//Add A[1] + B[1], put in %eax
	adcl	%r8d,%r9d
	movl	%r9d, %ecx

	
.L3:
	// C[1] = c
	movl	%ecx, 4(%rdx) 
	movl	8(%rdi), %r8d
	movl	8(%rsi), %r9d

	adcl	%r8d,%r9d
	movl	%r9d, %eax


.L4:
	//C[2] = c
	movl	%eax, 8(%rdx) 
	movl	12(%rdi), %r8d
	movl	12(%rsi), %r9d


	adcl	%r8d,%r9d
	movl	%r9d, %ecx


.L5:
	//C[3] = c
	movl	%ecx, 12(%rdx) 
	movl	16(%rdi), %r8d
	movl	16(%rsi), %r9d

	adcl	%r8d,%r9d
	movl	%r9d, %eax


.L6:
	movl	%eax, 16(%rdx) 
	movl	20(%rdi), %r8d
	movl	20(%rsi), %r9d

	adcl	%r8d,%r9d
	movl	%r9d, %ecx


.L7:
	movl	%ecx, 20(%rdx) 
	movl	24(%rdi), %r8d
	movl	24(%rsi), %r9d

	adcl	%r8d,%r9d
	movl	%r9d, %eax


.L8:
	movl	%eax, 24(%rdx) 
	movl	28(%rdi), %r8d
	movl	28(%rsi), %r9d

	adcl	%r8d,%r9d
	movl	%r9d, %ecx


.L9:
	movl	%ecx, 28(%rdx) 
	movl	32(%rdi), %r8d
	movl	32(%rsi), %r9d

	adcl	%r8d,%r9d
	movl	%r9d, %eax

	
.L10:
	movl	%eax, 32(%rdx) 
	movl	36(%rdi), %edi
	movl	36(%rsi), %esi

	adcl	%edi,%esi
	movl	%esi, %ecx

	
.L11:
	movl	%ecx, 36(%rdx)
	movl	$0, %eax
	adcl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	add, .-add
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits
