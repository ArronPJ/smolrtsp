# -------------------------------------
# CMake build
.PHONY: build
build:
	cmake -S . -B build_cmake
	cmake --build build_cmake

# - build folder
.PHONY: clean
clean:
	rm -rf build_cmake
	rm -rf build
	clear

