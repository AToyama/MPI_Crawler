cmake_minimum_required (VERSION 2.8.7)
project (WebCrawler)

find_package(PkgConfig REQUIRED)

add_definitions("-Wall")

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMakeModules)

if(NOT ${CMAKE_VERSION} LESS 3.2)
    set(CMAKE_CXX_STANDARD 11)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
else()
    message(STATUS "Checking compiler flags for C++11 support.")
    # Set C++11 support flags for various compilers
    include(CheckCXXCompilerFlag)
    check_cxx_compiler_flag("-std=c++11" COMPILER_SUPPORTS_CXX11)
    check_cxx_compiler_flag("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
    if(COMPILER_SUPPORTS_CXX11)
        message(STATUS "C++11 is supported.")
        if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -stdlib=libc++")
        else()
            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
        endif()
    elseif(COMPILER_SUPPORTS_CXX0X)
        message(STATUS "C++0x is supported.")
        if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x -stdlib=libc++")
        else()
            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
        endif()
    else()
        message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
    endif()
endif()

add_subdirectory(cpr)
include_directories(${CPR_INCLUDE_DIRS})

FIND_PACKAGE(Boost REQUIRED COMPONENTS regex mpi)
INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR} )

FIND_PACKAGE(MPI REQUIRED)
include_directories(${MPI_INCLUDE_PATH})

add_executable(seq_crawler main_seq.cpp web_crawler.cpp)
target_link_libraries(seq_crawler ${CPR_LIBRARIES} ${Boost_LIBRARIES})
SET_TARGET_PROPERTIES(seq_crawler PROPERTIES COMPILE_FLAGS "-lboost_regex")

add_executable(mpi_crawler main_mpi.cpp web_crawler.cpp)
target_link_libraries(mpi_crawler ${CPR_LIBRARIES} ${Boost_LIBRARIES} ${MPI_LIBRARIES})
SET_TARGET_PROPERTIES(mpi_crawler PROPERTIES COMPILE_FLAGS "-lboost_regex -lboost_mpi")


	
