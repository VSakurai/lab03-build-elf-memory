#include <stdio.h>
#include <stdlib.h>

void my_function(void)
{
    printf("Function address:         %p\n", (void *)my_function);
}

const char *string_literal = "Hello, Memory Map!";

int global_initialized = 100;

int global_uninitialized;

static int static_initialized = 200;

static int static_uninitialized;

int main(void)
{
    int local = 300;

    int *dynamic = malloc(sizeof(int));
    if (dynamic == NULL) return 1;
    *dynamic = 400;

    printf("\n=== Addresses ===\n");

    my_function();

    printf("String literal:           %p\n", (void *)string_literal);
    printf("Global initialized:       %p\n", (void *)&global_initialized);
    printf("Global uninitialized:     %p\n", (void *)&global_uninitialized);
    printf("Static initialized:       %p\n", (void *)&static_initialized);
    printf("Static uninitialized:     %p\n", (void *)&static_uninitialized);
    printf("Heap allocation:          %p\n", (void *)dynamic);
    printf("Stack/local:              %p\n", (void *)&local);

    free(dynamic);
    return 0;
}
