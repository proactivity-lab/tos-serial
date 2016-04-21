#ifndef ATM128UARTBAUDRATE_H_
#define ATM128UARTBAUDRATE_H_

  #ifndef UART0_BAUDRATE
    #define UART0_BAUDRATE PLATFORM_BAUDRATE
    #warning "Using PLATFORM_BAUDRATE for UART0_BAUDRATE"
  #endif // UART0_BAUDRATE

  #ifndef UART1_BAUDRATE
    #define UART1_BAUDRATE PLATFORM_BAUDRATE
    #warning "Using PLATFORM_BAUDRATE for UART1_BAUDRATE"
  #endif // UART1_BAUDRATE

#endif // ATM128UARTBAUDRATE_H_
