//Gabriel Suzuki gabriel@suzuki-aloha.com
// Header file for printf function.
#include <stdio.h>

// Declaration for assembly manager function which returns largest integer in the array.
extern "C" double manager();

int main()
{
	double result_code = -999;
	printf("\n%s", "This is 240-07 programming final by Gabriel Suzuki\n\n");
	result_code = manager();
	printf("%s%.7lf%s", "The driver received this number and will keep it: ", result_code, "\n");
	return 0;
}
