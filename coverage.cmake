message("Defining coverage build type ...")

# - --coverage is equivalent to the old -fprofile-arcs -ftest-coverage
#   combination
# - --coverage must be specified for each compile and link step
#   (i.e. CFLAGS/CXXFLAGS and LDFLAGS)
# - cmake automatically supplies CXX_FLAGS or C_FLAGS at link time
# - --coverage is understood by GCC and clang
# - clang also support an alternative coverage collection/processing scheme
SET(CMAKE_CXX_FLAGS_COVERAGE "${CMAKE_CXX_FLAGS_DEBUG} --coverage")
SET(CMAKE_C_FLAGS_COVERAGE "${CMAKE_C_FLAGS_DEBUG} --coverage")
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
SET(CMAKE_CXX_FLAGSCOVERAGEO "${CMAKE_CXX_FLAGS_RELEASE} --coverage")
SET(CMAKE_C_FLAGSCOVERAGEO "${CMAKE_C_FLAGS_RELEASE} --coverage")
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
# see also gen-coverage.py
#
#     lcov --rc lcov_branch_coverage=1 --capture --directory $PWD -o coverage_post_raw.info
#     lcov --capture --initial --directory $PWD -o coverage_init_raw.info
#     lcov --rc lcov_branch_coverage=1 --remove coverage_post_raw.info 'boost/*' '/c++/*' 'build-cov/*' 'cppformat/*' '/qt5/*' -o coverage_post.info
#     lcov --rc lcov_branch_coverage=1 --remove coverage_init_raw.info 'boost/*' '/c++/*' 'build-cov/*' 'cppformat/*' '/qt5/*' -o coverage_init.info
#     lcov --rc lcov_branch_coverage=1  -a coverage_init.info -a coverage_post.info -o coverage.info
#     genhtml --branch-coverage coverage.info -o coverage
#
# View e.g. via:
#
#     firefox coverage/index.html
