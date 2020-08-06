#  Delphi Gauss-Legendre PI Approximation Test 

This is a sample Delphi project using Gauss-Legendre algorithm to approximate PI.

Used to get an idea of how Delphi performs with floating point operations cross platform.

Platforms tested:
- Win32
- Win64
- OSX
- iOS
- Android

NOTE: linux missing due to unavailability of compiler

# Results

Win32 and Win64 tests run on a Macbook 2014 using VMWare Fusion.
iPhone 6s 64bit
Cubot J7 Android 9 32bit

Samples 1
Iterations Per Sample: 10 000 000

*Release Build*


|Platform| Normal Mode  | Faster Mode |
|---|---|---|
| Win32 |  6912ms |   503ms|
| Win64 |  171ms  |   170ms|
| OSX | 7299ms |   1931ms|
| iOS |  8171ms |   7925ms|
| Android |  39703ms |  45298ms|

* in normal mode, all variables were double type. no result was returned - suspect an overflow, but need to investigate.
* in 'faster' mode, pi approximation was returned.