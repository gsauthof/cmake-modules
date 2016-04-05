message("Defining sanitize build type ...")

SET(CMAKE_CXX_FLAGS_SANITIZE
    "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address -fsanitize=undefined")
SET(CMAKE_C_FLAGS_SANITIZE
    "${CMAKE_C_FLAGS_DEBUG} -fsanitize=address -fsanitize=undefined")
SET(CMAKE_EXE_LINKER_FLAGS_SANITIZE "${CMAKE_EXE_LINKER_FLAGS_DEBUG}")
SET(CMAKE_SHARED_LINKER_FLAGS_SANITIZE "${CMAKE_SHARED_LINKER_FLAGS_DEBUG}")
SET(CMAKE_STATIC_LINKER_FLAGS_SANITIZE "${CMAKE_STATIC_LINKER_FLAGS_DEBUG}")
SET(CMAKE_MODULE_LINKER_FLAGS_SANITIZE "${CMAKE_MODULE_LINKER_FLAGS_DEBUG}")

# for the GUI
MARK_AS_ADVANCED(
    CMAKE_CXX_FLAGS_SANITIZE
    CMAKE_C_FLAGS_SANITIZE
    CMAKE_EXE_LINKER_FLAGS_SANITIZE
    CMAKE_SHARED_LINKER_FLAGS_SANITIZE
    CMAKE_STATIC_LINKER_FLAGS_SANITIZE
    CMAKE_MODULE_LINKER_FLAGS_SANITIZE
    )

# cf. http://clang.llvm.org/docs/AddressSanitizer.html#usage

SET(CMAKE_CXX_FLAGS_SANITIZEO
    "${CMAKE_CXX_FLAGS_RELEASE} -g -fno-omit-frame-pointer -fsanitize=address -fsanitize=undefined")
SET(CMAKE_C_FLAGS_SANITIZEO
    "${CMAKE_C_FLAGS_RELEASE} -g -fno-omit-frame-pointer -fsanitize=address -fsanitize=undefined")
SET(CMAKE_EXE_LINKER_FLAGS_SANITIZEO "${CMAKE_EXE_LINKER_FLAGS_RELEASE}")
SET(CMAKE_SHARED_LINKER_FLAGS_SANITIZEO "${CMAKE_SHARED_LINKER_FLAGS_RELEASE}")
SET(CMAKE_STATIC_LINKER_FLAGS_SANITIZEO "${CMAKE_STATIC_LINKER_FLAGS_RELEASE}")
SET(CMAKE_MODULE_LINKER_FLAGS_SANITIZEO "${CMAKE_MODULE_LINKER_FLAGS_RELEASE}")

# for the GUI
MARK_AS_ADVANCED(
    CMAKE_CXX_FLAGS_SANITIZEO
    CMAKE_C_FLAGS_SANITIZEO
    CMAKE_EXE_LINKER_FLAGS_SANITIZEO
    CMAKE_SHARED_LINKER_FLAGS_SANITIZEO
    CMAKE_STATIC_LINKER_FLAGS_SANITIZEO
    CMAKE_MODULE_LINKER_FLAGS_SANITIZEO
    )
