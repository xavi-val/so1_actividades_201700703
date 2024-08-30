# Actividad: Investigación sobre conceptos de Sistemas Operativos

## Conceptos Investigados

### 1. Tipos de Kernel y sus diferencias
El kernel es el núcleo del sistema operativo y existen varios tipos, cada uno con sus características y diferencias principales:

- **Monolítico**: 
  - El kernel monolítico incluye todos los servicios del sistema operativo (gestión de memoria, controladores de dispositivos, sistemas de archivos, etc.) en un solo gran proceso en modo kernel.
  - Ventaja: Mejora de rendimiento debido a la reducción de la sobrecarga de comunicación entre componentes.
  - Desventaja: Menor seguridad y estabilidad, ya que un fallo en una parte del kernel puede afectar a todo el sistema.

- **Microkernel**:
  - El microkernel tiene un diseño más pequeño y minimalista, delegando la mayoría de los servicios (como los controladores de dispositivos) a procesos en modo usuario.
  - Ventaja: Mayor seguridad y estabilidad, ya que el fallo de un proceso en modo usuario no afecta directamente al núcleo.
  - Desventaja: Posible sobrecarga de rendimiento debido a la comunicación entre el microkernel y los procesos de usuario.

- **Híbrido**:
  - Combina elementos de kernels monolíticos y microkernels. Es utilizado en sistemas operativos como Windows y macOS.
  - Ventaja: Intenta aprovechar lo mejor de ambos mundos, manteniendo rendimiento y estabilidad.
  - Desventaja: Complejidad en su desarrollo y mantenimiento.

- **Exokernel**:
  - Se enfoca en la separación de la gestión de recursos del hardware y su utilización, permitiendo que los programas de usuario manejen los recursos directamente.
  - Ventaja: Mayor eficiencia al permitir que las aplicaciones controlen directamente los recursos.
  - Desventaja: Mayor complejidad en el desarrollo de aplicaciones y sistemas.

### 2. User vs Kernel Mode
En un sistema operativo, el procesador puede operar en dos modos principales:

- **User Mode (Modo Usuario)**:
  - Es el modo en el que se ejecutan las aplicaciones de usuario.
  - Las instrucciones peligrosas o privilegiadas no pueden ejecutarse directamente.
  - Si una aplicación intenta realizar una operación no permitida, se genera una excepción y el control se transfiere al kernel.

- **Kernel Mode (Modo Kernel)**:
  - Es el modo en el que se ejecuta el kernel y las partes críticas del sistema operativo.
  - Permite el acceso completo a todo el hardware y todos los recursos del sistema.
  - En este modo, se pueden ejecutar todas las instrucciones privilegiadas del procesador.

La alternancia entre estos modos asegura que las aplicaciones de usuario no puedan realizar operaciones que comprometan la seguridad y estabilidad del sistema.

### 3. Interruptions vs Traps
Ambos son mecanismos utilizados por el procesador para manejar eventos que requieren atención inmediata, pero tienen diferencias clave:

- **Interruptions (Interrupciones)**:
  - Son señales enviadas al procesador desde hardware externo (como dispositivos de E/S) para indicarle que debe detener temporalmente la ejecución de la tarea actual y atender el evento.
  - Son asincrónicas y pueden ocurrir en cualquier momento.
  - Ejemplo: Una interrupción de un dispositivo de teclado cuando se presiona una tecla.

- **Traps**:
  - Son eventos generados por el software o por el mismo procesador como resultado de una condición excepcional (como un error de división por cero) o cuando se necesita realizar una llamada al sistema.
  - A diferencia de las interrupciones, las traps son síncronas y están directamente relacionadas con la instrucción que se ejecuta en ese momento.
  - Ejemplo: Una trampa generada por una instrucción de división cuando el divisor es cero.

## Detalles de la entrega

- **Entrega**: El archivo `README.md` debe ser subido a un repositorio de GitHub.
- **Nombre del repositorio**: `so1_actividades_#carnet`
- Reemplaza `#carnet` con tu número de carnet para nombrar correctamente el repositorio.

