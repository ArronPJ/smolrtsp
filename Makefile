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

### Generate Xcode Project (Lib)
# -- Open with "open IDE/smolrtsp.xcodeproj"
# -- Would xcode_ide be better name ?
.PHONY: xcode
xcode:
	cmake -S . -B IDE -G Xcode

### Build Lib with Debug
# -- Clean by "xcodebuild clean -project IDE/smolrtsp.xcodeproj -scheme smolrtsp -configuration Debug"
# -- output file == "/IDE/Debug/libsmolrtsp.a"
.PHONY: xbdebuglib
xbdebuglib:
	xcodebuild -project IDE/smolrtsp.xcodeproj -scheme smolrtsp -configuration Debug



### Generate Xcode Project (App)-Default-Apple
# -- "-Wno-dev"
.PHONY: xcode_app
xcode_app:
	cmake -S examples -B IDE_EX -G Xcode -DCMAKE_OSX_SYSROOT=macosx15.5
# Clean by "xcodebuild clean -project IDE_EX/examples.xcodeproj -scheme server -configuration Debug"


### ### Generate Xcode Project (App)-x86_64
# DONT' use (Build-Run-Fail)
# Intel-X86 compatible
#.PHONY: xcode_app_x86
#xcode_app_x86:
#	cmake -S examples -B IDE_EX -G Xcode -DCMAKE_OSX_ARCHITECTURES=x86_64 -DCMAKE_OSX_SYSROOT=macosx15.5
# Clean by "xcodebuild clean -project IDE_EX/examples.xcodeproj -scheme server -configuration Debug"


### Build App with Debug
# Both : Apple-M-Series
#.       x86_64
.PHONY: xbapp
xbapp:
	xcodebuild -project IDE_EX/examples.xcodeproj -scheme server -configuration Debug