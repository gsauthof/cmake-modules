message("Defining coverage build type ...")

# - `-fprofile-arcs` and `-ftest-coverage` are understood by GCC and Clang
# - `--coverage` is an alias for those two options, also understood
#   by GCC and Clang
# - `-fprofile-arcs` (or `--coverage`) must also be specified at link time
# - specifying `-test-coverage` at link time doesn't hurt
# - cmake automatically supplied CXX_FLAGS or C_FLAGS at link time
SET(CMAKE_CXX_FLAGS_COVERAGE
    "${CMAKE_CXX_FLAGS_DEBUG} -fprofile-arcs -ftest-coverage"
    )
SET(CMAKE_C_FLAGS_COVERAGE
    "${CMAKE_C_FLAGS_DEBUG} -fprofile-arcs -ftest-coverage"
    )
SET(CMAKE_EXE_LINKER_FLAGS_COVERAGE "${CMAKE_EXE_LINKER_FLAGS_DEBUG}")
SET(CMAKE_SHARED_LINKER_FLAGS_COVERAGE "${CMAKE_SHARED_LINKER_FLAGS_DEBUG}")
SET(CMAKE_STATIC_LINKER_FLAGS_COVERAGE "${CMAKE_STATIC_LINKER_FLAGS_DEBUG}")
SET(CMAKE_MODULE_LINKER_FLAGS_COVERAGE "${CMAKE_MODULE_LINKER_FLAGS_DEBUG}")

# for the GUI
MARK_AS_ADVANCED(
    CMAKE_CXX_FLAGS_COVERAGE
    CMAKE_C_FLAGS_COVERAGE
    CMAKE_EXE_LINKER_FLAGS_COVERAGE
    CMAKE_SHARED_LINKER_FLAGS_COVERAGE
    CMAKE_STATIC_LINKER_FLAGS_COVERAGE
    CMAKE_MODULE_LINKER_FLAGS_COVERAGE
    )

# - mixing coverage gathering and optimization is supported, but
#   but may yield some inaccuracies
SET(CMAKE_CXX_FLAGSCOVERAGEO
    "${CMAKE_CXX_FLAGS_RELEASE} -fprofile-arcs -ftest-coverage"
    )
SET(CMAKE_C_FLAGSCOVERAGEO
    "${CMAKE_C_FLAGS_RELEASE} -fprofile-arcs -ftest-coverage"
    )
SET(CMAKE_EXE_LINKER_FLAGSCOVERAGEO "${CMAKE_EXE_LINKER_FLAGS_DEBUG}")
SET(CMAKE_SHARED_LINKER_FLAGSCOVERAGEO "${CMAKE_SHARED_LINKER_FLAGS_DEBUG}")
SET(CMAKE_STATIC_LINKER_FLAGSCOVERAGEO "${CMAKE_STATIC_LINKER_FLAGS_DEBUG}")
SET(CMAKE_MODULE_LINKER_FLAGSCOVERAGEO "${CMAKE_MODULE_LINKER_FLAGS_DEBUG}")

# for the GUI
MARK_AS_ADVANCED(
    CMAKE_CXX_FLAGSCOVERAGEO
    CMAKE_C_FLAGSCOVERAGEO
    CMAKE_EXE_LINKER_FLAGSCOVERAGEO
    CMAKE_SHARED_LINKER_FLAGSCOVERAGEO
    CMAKE_STATIC_LINKER_FLAGSCOVERAGEO
    CMAKE_MODULE_LINKER_FLAGSCOVERAGEO
    )


# Example post-processing with lcov:
#
#     lcov --capture --directory ./ --output-file lcov_raw.info
#     lcov --remove lcov_raw.info 'boost/*' '/c++/*' 'build-cov/*' 'cppformat/*' \
#        '/qt5/*' -o lcov.info
#     genhtml lcov.info --output-directory pages
#
# View e.g. via:
#
#     firefox pages/index.html
