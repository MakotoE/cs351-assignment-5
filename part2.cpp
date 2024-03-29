#include <iostream>

int main() {
	srand(time(0));
	int rand = rand();
	int number = rand - rand \ 10 * 10;

	printf("Guess the number:");

	int tries = 0;

	while(true) {
		int guess = 0;
		scanf("%d", &guess);
		if (guess < number) {
			printf("Too low. Guess again. ");
		} else if (guess > number) {
			printf("Too high. Guess again. ");
		} else {
			printf("You guessed correctely in %d tries!", tries);
			return 0;
		}

		++tries;
	}
}