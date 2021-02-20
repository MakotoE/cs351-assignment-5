#include <iostream>

int main() {
	printf("Enter a number:");

	int end = 0;
	scanf("%d", &end);

	int row = 1;
	do {
		int n = 0;
		do {
			printf("%d", n + 1);
			++n;
		} while(n < row);

		printf("\n");
		++row;
	} while(row <= end);

	return 0;
}
