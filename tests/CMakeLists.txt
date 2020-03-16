cmake_minimum_required(VERSION 2.8)
project(SSE2NEONTEST)


if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()
message("Build type: " ${CMAKE_BUILD_TYPE})


set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -O3 ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -std=c++11 -O3 ")


if(SSE_NOT_SUPPORTED)
    MESSAGE("SSE instruction set not found, will not use Intel based acceleration.")
    # -flax-vector-conversions allows implementation for _mm_srai_epi16 to work
    # This is a temporary solution, should be properly implemented
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=cortex-a53 -mtune=cortex-a53 -flax-vector-conversions")
else()
    MESSAGE("SSE3 instruction detected, will use Intel based acceleration.")
    add_definitions(-DSSE3_FOUND)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -msse4.2")
endif()


include_directories(
    ${CMAKE_SOURCE_DIR}/..
    ${CMAKE_SOURCE_DIR}/
)


add_executable(
${PROJECT_NAME}
main.cpp
SSE2NEONBinding.cpp
SSE2NEONTEST.cpp
)


if(CROSS_COMPILE_ARCH STREQUAL "aarch64")
    SET(RUN_DIR "build_cross")
else()
    SET(RUN_DIR "build")
endif()

set_target_properties(${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/${RUN_DIR})