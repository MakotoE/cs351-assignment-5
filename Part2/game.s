.data
	guess_the_number: .asciz "Guess the number:"
	input_format: .asciz "%d"
	too_low: .asciz "Too low. Guess again. "
	too_high: .asciz "Too high. Guess again. "
	you_guessed_correctly: .asciz "You guessed correctely in %d tries!\n"
	guess: .word 0

.text

.global main
addr_guess_the_number: .word guess_the_number
addr_input_format: .word input_format
addr_too_low: .word too_low
addr_too_high: .word too_high
addr_you_guessed_correctly: .word you_guessed_correctly
addr_guess: .word guess

main:
	str lr, [sp, #-4]!
	
	// srand(time(0));
	// int rand = rand();
	// int number = rand - rand \ 10 * 10 + 1;
	mov r0, #0
	bl time
	bl srand
	bl rand
	mov r6, #10
	udiv r5, r0, r6
	mul r4, r5, r6
	sub r4, r0, r4
	add r4, r4, #1
	
	// printf("Guess the number:");
	ldr r0, addr_guess_the_number
	bl printf
	
	// int tries = 1;
	mov r5, #1
	
loop:
	// scanf("%d", &guess);
	ldr r0, addr_input_format
	ldr r1, addr_guess
	bl scanf
	
	ldr r6, addr_guess
	ldr r6, [r6]
	
	// if (guess < number)
	cmp r6, r4
	blt guess_too_low
	
	// if (guess > number)
	bgt guess_too_high
	
	// printf("You guessed correctely in %d tries!", tries);
	// return 0;
	ldr r0, addr_you_guessed_correctly
	mov r1, r5
	bl printf
	mov r0, #0
	ldr lr, [sp], #4
	bx lr

guess_too_low:
	ldr r0, addr_too_low
	bl printf
	b end_loop
	
guess_too_high:
	ldr r0, addr_too_high
	bl printf

end_loop:
	add r5, r5, #1
	b loop
