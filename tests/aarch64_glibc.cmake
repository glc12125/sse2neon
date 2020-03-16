if(COMMAND toolchain_save_config)
  return() # prevent recursive call
endif()

SET(CMAKE_SYSTEM_PROCESSOR aarch64)

#SET(CMAKE_SYSROOT /Development/cross_compile/aarch64--glibc--stable-2018.02-2/aarch64-buildroot-linux-gnu/sysroot)

SET(SSE_NOT_SUPPORTED true)

# this one is important
SET(CMAKE_SYSTEM_NAME Linux)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)
#SET(CMAKE_C_COMPILER_WORKS 1)
#SET(CMAKE_CXX_COMPILER_WORKS 1)

# specify the cross compiler
#SET(CMAKE_C_COMPILER   /home/robok/Downloads/aarch64--glibc--bleeding-edge/bin/aarch64-linux-gcc)
#SET(CMAKE_CXX_COMPILER /home/robok/Downloads/aarch64--glibc--bleeding-edge/bin/aarch64-linux-g++)
#SET(CMAKE_LINKER       /home/robok/Downloads/aarch64--glibc--bleeding-edge/bin/aarch64-linux-ld)
#SET(CMAKE_ASM_COMPILER /home/robok/Downloads/aarch64--glibc--bleeding-edge/bin/aarch64-linux-as)
#SET(CMAKE_OBJCOPY      /home/robok/Downloads/aarch64--glibc--bleeding-edge/bin/aarch64-linux-objcopy)
#SET(CMAKE_STRIP        /home/robok/Downloads/aarch64--glibc--bleeding-edge/bin/aarch64-linux-strip)
#SET(CMAKE_CPP          /home/robok/Downloads/aarch64--glibc--bleeding-edge/bin/aarch64-linux-cpp)

SET(CMAKE_C_COMPILER   /Development/cross_compile/aarch64-glibc-withopenmp/bin/aarch64-buildroot-linux-gnu-gcc)
SET(CMAKE_CXX_COMPILER /Development/cross_compile/aarch64-glibc-withopenmp/bin/aarch64-buildroot-linux-gnu-g++)
SET(CMAKE_LINKER       /Development/cross_compile/aarch64-glibc-withopenmp/bin/aarch64-buildroot-linux-gnu-ld)
SET(CMAKE_ASM_COMPILER /Development/cross_compile/aarch64-glibc-withopenmp/bin/aarch64-buildroot-linux-gnu-as)
SET(CMAKE_OBJCOPY      /Development/cross_compile/aarch64-glibc-withopenmp/bin/aarch64-buildroot-linux-gnu-objcopy)
SET(CMAKE_STRIP        /Development/cross_compile/aarch64-glibc-withopenmp/bin/aarch64-buildroot-linux-gnu-strip)
SET(CMAKE_CPP          /Development/cross_compile/aarch64-glibc-withopenmp/bin/aarch64-buildroot-linux-gnu-cpp)

# where is the target environment 
SET(CMAKE_FIND_ROOT_PATH  /Development/cross_compile/arm64)


# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

SET(ELAS_DISABLED false)
SET(CROSS_COMPILE_ARCH "aarch64")