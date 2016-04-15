# tos-serial
Temporary repository for TinyOS serial modules that are somehow different from the ones that TinyOS has.

Use the TINYOS_ROOT_DIR_ADDITIONAL functionality to overlay the contents of this repository over
tinyos-main. When configuring the environment(setenv.sh), add the path to this repository to
TINYOS_ROOT_DIR_ADDITIONAL.

```
TINYOS_ROOT_DIR_ADDITIONAL=$TINYOS_ROOT_DIR_ADDITIONAL:$PATH_TO_TOS_SERIAL_REPOSITORY_ROOT
```

Include tos-serial.mk in your makefile to make use of UART0_BAUDRATE and UART1_BAUDRATE definitions in the makefile.

```
include $(PATH_TO_TOS_SERIAL_REPOSITORY_ROOT)/tos/tos-serial.mk
```
