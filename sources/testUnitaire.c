#include "../headers/testUnitaire.h"

int main(void)
{
    sayHello();
    printf("add(10,5)            = %d\n", add(10, 5));
    printf("sous(10,5)           = %d\n", sous(10, 5));
    printf("multiplication(10,5) = %d\n", multiplication(10, 5));
    printf("division(10,5)       = %d\n", division(10, 5));
    return 0;
}