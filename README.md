# tos-serial
Temporary repository for TinyOS serial modules that are somehow different from the ones that TinyOS has.

# Using the components in your project (option 1)

Use the TINYOS_ROOT_DIR_ADDITIONAL functionality to overlay the contents of this repository over
tinyos-main. When configuring the environment(setenv.sh), add the path to this repository to
TINYOS_ROOT_DIR_ADDITIONAL.
```
TINYOS_ROOT_DIR_ADDITIONAL=$TINYOS_ROOT_DIR_ADDITIONAL:$PATH_TO_TOS_SERIAL_REPOSITORY_ROOT
```

In your makefile define ```PFLAGS = $(FPFLAGS)``` and include the tos-serial.extra after
the Makefile.include. tos-serial.extra will define some things in FPFLAGS and this will
cause the defines to get included before anything else defined by the platforms (which is
what these components try to replace).

Makefile
```
COMPONENT ?= ApplicationC
PFLAGS = $(FPFLAGS)

... other stuff ...

include $(TINYOS_ROOT_DIR)/Makefile.include
$(call TOSMake_include,extras/tos-serial.extra)
```

# Using the components in your project (option 2)

Use the TINYOS_ROOT_DIR_ADDITIONAL functionality to overlay the contents of this repository over
tinyos-main. When configuring the environment(setenv.sh), add the path to this repository to
TINYOS_ROOT_DIR_ADDITIONAL.

```
TINYOS_ROOT_DIR_ADDITIONAL=$TINYOS_ROOT_DIR_ADDITIONAL:$PATH_TO_TOS_SERIAL_REPOSITORY_ROOT
```

Include tos-serial.mk in your makefile before the Makefile.include.

```
include $(PATH_TO_TOS_SERIAL_REPOSITORY_ROOT)/tos/tos-serial.mk
```
