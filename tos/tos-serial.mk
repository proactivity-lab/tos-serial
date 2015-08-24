#
# Makefile extension to include all the stuff in this repository.
# @author Raido Pahtma
# @license MIT
#

THIS_TOSSERIAL_DIR := $(realpath $(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))

ifdef UART0_BAUDRATE
    CFLAGS += -DUART0_BAUDRATE=$(UART0_BAUDRATE)
endif
ifdef UART1_BAUDRATE
    CFLAGS += -DUART1_BAUDRATE=$(UART1_BAUDRATE)
endif

CFLAGS += -I$(THIS_TOSSERIAL_DIR)/lib/serial
