#
# Makefile extension to include all the stuff in this repository.
# @author Raido Pahtma
# @license MIT
#

THIS_TOSSERIAL_DIR := $(realpath $(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))

ifdef UART0_BAUDRATE
    PFLAGS += -DUART0_BAUDRATE=$(UART0_BAUDRATE)
endif
ifdef UART1_BAUDRATE
    PFLAGS += -DUART1_BAUDRATE=$(UART1_BAUDRATE)
endif

ifdef PLATFORM_SERIAL_UART0
    PFLAGS += -I$(THIS_TOSSERIAL_DIR)/chips/atm128/uart0
endif

ifdef PLATFORM_SERIAL_UART1
    PFLAGS += -I$(THIS_TOSSERIAL_DIR)/chips/atm128/uart1
endif
