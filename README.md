Collection of CMake module files.

2015, Georg Sauthoff <mail@georg.so>


## Examples

The coverge/sanitize build types can be used like this:

Include the module or modules in the project's `CMakeLists.txt`, e.g.:

    include (${CMAKE_SOURCE_DIR}/cmake/modules/coverage.cmake)
    include (${CMAKE_SOURCE_DIR}/cmake/modules/sanitize.cmake)

Configure the build type when calling cmake:

    $ mkdir build
    $ cd build
    $ cmake -D CMAKE_BUILD_TYPE=Coverage ..

Or:

    $ mkdir build
    $ cd build
    $ cmake -D CMAKE_BUILD_TYPE=Sanitize ..

In that way they work similar to the builtin build types `Release` and `Debug`.

Those build types also work with non-makefile generators, e.g. `ninja`:

    $ cmake -G Ninja -D CMAKE_BUILD_TYPE=Sanitize ..

## License

I don't think that those files reach the [threshold of originality][2].
In any case, they are put into the public domain and licensed under [CC0][3].


[1]: https://en.wikipedia.org/wiki/CMake
[2]: https://en.wikipedia.org/wiki/Threshold_of_originality
[3]: https://en.wikipedia.org/wiki/Creative_Commons_license#Zero_.2F_public_domain
