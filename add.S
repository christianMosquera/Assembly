// this assembly language subroutine is the result of compiling the following code:
//
// int add (unsigned int *A, unsigned int *B, unsigned int *C, int n) {
//         int     i, carry;
//         unsigned int c;
// 
//         carry = 0;
//         for (i=0; i<n; i++) {
//                 c = A[i];
//                 c += B[i];
//                 c += carry;
//                 carry = (A[i] > c) || (B[i] > c);
//                 C[i] = c;
//         }
//         return carry;
// }

	.file	"add.S"
	.text
	.globl	add
	.type	add, @function
add:
.LFB0:
	.cfi_startproc
// %ecx (%rcx) is i * 4 ; set i = 0
	movl	$0, %ecx
// %eax is carry; set carry = 0
	movl	$0, %eax

.L4:
// %rdi is A[]; get A[i] into %r9d
	movl	(%rdi,%rcx), %r9d
// %rsi is B[]; get B[i] into %r10d
	movl	(%rsi,%rcx), %r10d
// %r8d is c; add A[i] plus B[i] and put the result into %r8d
	leal	(%r9,%r10), %r8d
// add %eax to %r8d, putting the result back into %r8d; %eax is the carry
	addl	%eax, %r8d
// set %eax to 1; this is initially assuming the carry is 1
	movl	$1, %eax
// compute A[i] - c; if the result is above 0 then jump to .L2 and %eax remains as 1
	cmpl	%r8d, %r9d
	ja	.L2
// compute B[i] - c; if the result is above 0, then %al = 0 
	cmpl	%r8d, %r10d
	seta	%al
// extend %al to %eax
	movzbl	%al, %eax

.L2:
// C[i] = the sum computed with addl above
	movl	%r8d, (%rdx,%rcx)
// advance %rcx by 4
	addq	$4, %rcx
// see if %rcx has reached 40 (i.e. 4 * 10)
	cmpq	$40, %rcx
// if not, loop back
	jne	.L4
// done; return %eax as the carry out
	rep ret
	.cfi_endproc
.LFE0:
	.size	add, .-add
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits
