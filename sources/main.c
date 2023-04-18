#include "../headers/main.h"

int menu(void)
{
    int choix = 0;

    printf("\nQue voulez-vous faire ?\n");
    printf("0) Quitter.\n");
    printf("1) Dire bonjour au monde.\n");
    printf("2) Faire une addition.\n");
    printf("3) Faire une soustraction.\n");
    printf("4) Faire une multiplication.\n");
    printf("5) Faire une division.\n");
    printf("Votre choix : ");
    scanf("%d", &choix);

    return choix;
}

int main(void)
{
    int choix = 0;
    int continuer = 1;
    int num1 = 0, num2 = 0;

    while(continuer == 1)
    {
        choix = menu();

        switch (choix)
        {
            case 0: // Quitter
                continuer = 0;
                break;

            case 1: // Bonjour
                sayHello();
                break;

            case 2: // Addition
                printf("Veuillez selectionner un premier nombre : ");
                scanf("%d", &num1);
                printf("Veuillez selectionner un second nombre : ");
                scanf("%d", &num2);
                printf("%d + %d = %d\n", num1, num2, add(num1, num2));
                break;

            case 3: // Soustraction
                printf("Veuillez selectionner un premier nombre : ");
                scanf("%d", &num1);
                printf("Veuillez selectionner un second nombre : ");
                scanf("%d", &num2);
                printf("%d - %d = %d\n", num1, num2, sous(num1, num2));
                break;

            case 4: // Multiplication
                printf("Veuillez selectionner un premier nombre : ");
                scanf("%d", &num1);
                printf("Veuillez selectionner un second nombre : ");
                scanf("%d", &num2);
                printf("%d * %d = %d\n", num1, num2, multiplication(num1, num2));
                break;

            case 5: // Division
                printf("Veuillez selectionner un premier nombre : ");
                scanf("%d", &num1);
                printf("Veuillez selectionner un second nombre : ");
                scanf("%d", &num2);
                printf("%d / %d = %d\n", num1, num2, division(num1, num2));
                break;

            default:
                printf("Ce n'est pas un choix possible.\n");
                break;
        }
    }

    printf("Bonne journee !\n");
    return 0;
}