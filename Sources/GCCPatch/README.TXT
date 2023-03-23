*********************
* Emu48 GCC Version *
*********************

Emu48 is normally compiled with the Microsoft Visual C++ 2005 compiler. An
alternative is the GCC compiler from the GNU project. A great distribution
of the compiler and the necessary files is MinGW at www.mingw.org.

Emu48 was tested with the following MinGW file versions over the years. The
actual Emu48 GCC version was tested with the latest GGC version in this
list:

w32api-3.11.tar.gz
mingw-runtime-3.14.tar.gz
mingw32-make-3.81-20080326.tar.gz
binutils-2.18.50-20080109-2.tar.gz
gcc-core-3.4.5-20060117-1.tar.gz

or

gcc-core-4.6.2-1-mingw32-bin.tar.lzma
binutils-2.22-1-mingw32-bin.tar.lzma
libgmp-5.0.1-1-mingw32-dll-10.tar.lzma
libmpc-0.8.1-1-mingw32-dll-2.tar.lzma
libmpfr-2.4.1-1-mingw32-dll-1.tar.lzma
libpthreadgc-2.9.0-mingw32-pre-20110507-2-dll-2.tar.lzma
mingwrt-3.20-mingw32-dev.tar.gz
mingwrt-3.20-mingw32-dll.tar.gz
pthreads-w32-2.9.0-mingw32-pre-20110507-2-dev.tar.lzma
w32api-3.17-2-mingw32-dev.tar.lzma
mingw32-make-3.81-20080326.tar.gz

or

gcc-core-4.8.1-4-mingw32-bin.tar.lzma
binutils-2.24-1-mingw32-bin.tar.xz
libgmp-5.1.2-1-mingw32-dll-10.tar
libmpc-1.0.1-2-mingw32-dll-3.tar
libmpfr-3.1.2-2-mingw32-dll-4.tar
libpthreadgc-2.9.1-1-mingw32-dll-2.tar
mingwrt-3.21-mingw32-dev.tar.xz
mingwrt-3.21-mingw32-dll.tar.xz
w32api-3.17-2-mingw32-dev.tar.lzma
mingw32-make-3.82.90-2-mingw32-cvs-20120902-bin.tar.lzma

or

gcc-core-5.3.0-3-mingw32-bin.tar.xz
binutils-2.25.1-1-mingw32-bin.tar.xz
libgmp-5.1.2-1-mingw32-dll-10.tar
libmpc-1.0.2-mingw32-dll-3.tar.xz
libmpfr-3.1.2-2-mingw32-dll-4.tar
libpthreadgc-2.10-mingw32-pre-20160821-1-dev.tar.xz
mingwrt-3.22.4-mingw32-dev.tar.xz
mingwrt-3.22.4-mingw32-dll.tar.xz
w32api-3.18.2-mingw32-dev.tar.xz
mingw32-make-3.82.90-2-mingw32-cvs-20120902-bin.tar.lzma

Older versions of the MinGW package might not work, because there are several
bug fixes, especially in the header files, made in the last time.


Because of some inconsistences in the current MinGW distribution you have to
add the files of this archive to the actual Emu48 source files.

Many thanks to Pedro A. Arranda Gutiérrez for his work on making Emu48 GCC
compatible.


08/07/17 (c) by Christoph Gießelink
