/*
 * Copyright (c) 2006 Arch Rock Corporation
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the Arch Rock Corporation nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE
 * ARCH ROCK OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE
 */

/**
 * @author Alec Woo <awoo@archrock.com>
 * @author Jonathan Hui <jhui@archrock.com>
 */
#include "Atm128UartBaudrate.h"
configuration Atm128Uart1C {

  provides interface GetSet<uint32_t> as UartBaudRate;
  provides interface StdControl;
  provides interface UartByte;
  provides interface UartStream;
  uses interface Counter<TMicro, uint32_t>;

}

implementation{

  #ifndef UART1_BAUDRATE
    #define UART1_BAUDRATE PLATFORM_BAUDRATE
    #warning "Using PLATFORM_BAUDRATE for UART1_BAUDRATE"
  #endif // UART1_BAUDRATE

  components new Atm128UartP(UART1_BAUDRATE) as UartP;
  UartBaudRate = UartP;
  StdControl = UartP;
  UartByte = UartP;
  UartStream = UartP;
  UartP.Counter = Counter;

  components HplAtm128UartC as HplUartC;
  UartP.HplUartBaudRate -> HplUartC.Uart1BaudRate;
  UartP.HplUartTxControl -> HplUartC.Uart1TxControl;
  UartP.HplUartRxControl -> HplUartC.Uart1RxControl;
  UartP.HplUart -> HplUartC.HplUart1;

  components MainC;
  MainC.SoftwareInit -> UartP;

}
