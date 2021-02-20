.data
	end: .word 0
	row: .word 0
	enter_a_number: .asciz "Enter a number:"
	input_format: .asciz "%d"
	newline: .asciz "\n"

.text

.global main
addr_end: .word end
addr_enter_a_number: .word enter_a_number
addr_input_format: .word input_format
addr_newline: .word newline

main:
	str lr, [sp, #-4]!

	// printf("Enter a number:");
	ldr r0, addr_enter_a_number
	bl printf
	
	// int end = 0;
	// scanf("%d", &end);
	ldr r0, addr_input_format
	ldr r1, addr_end
	bl scanf
	
	// int row = 1;
	mov r5, #1

loop:
	// int n = 0;
	mov r6, #0
	
row_loop:
	// ++n;
	// printf("%d", n);
	add r6, r6, #1
	mov r1, r6
	ldr r0, addr_input_format
	bl printf
	
	// while(n < row);
	cmp r6, r5
	blt row_loop
	
	// printf("\n");
	// ++row;
	ldr r0, addr_newline
	bl printf
	add r5, r5, #1
	
	// while(row <= end);
	ldr r1, addr_end
	ldr r1, [r1]
	cmp r5, r1
	ble loop
	
	mov r0, #0
	ldr lr, [sp], #4
	bx lr
