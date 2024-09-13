
# Tarea de Sistemas Operativos

## Análisis del Programa en C

### Pregunta 1: ¿Incluyendo el proceso inicial, cuántos procesos son creados por el siguiente programa?

```c
#include <stdio.h>
#include <unistd.h>

int main()
{
    /* fork a child process */
    fork();

    /* fork another child process */
    fork();

    /* and fork another */
    fork();

    return 0;
}
```

### Respuesta:

Para entender cuántos procesos se crean por este programa, analicemos cada llamada a `fork()`:

1. **Proceso inicial**: El programa comienza con un solo proceso.
2. **Primera llamada a `fork()`**: Esta llamada crea un nuevo proceso hijo. Ahora hay 2 procesos en ejecución.
3. **Segunda llamada a `fork()`**: Cada uno de los 2 procesos existentes ejecuta otra llamada a `fork()`, lo que resulta en 4 procesos en total.
4. **Tercera llamada a `fork()`**: Finalmente, cada uno de los 4 procesos existentes realiza una tercera llamada a `fork()`, lo que da lugar a un total de 8 procesos.

### Conclusión:

El programa crea un total de **8 procesos**, incluyendo el proceso inicial.
