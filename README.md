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

Samples 1 000 000

Digits: 10 000 000 

for n digits, iteration count of log2 n is used.

*Release Build*

|Platform| Timing  | 
|---|---|
| Win32 |  1357ms |  
| Win64 |  827ms  | 
| OSX | 3768ms |  
| iOS |  19764ms | 
| Android | 124339 ms | 

# NOTE

For OSX, don't forget to stat PA Server

For iOS, don't forget to 
* set deployment provisioning profile
* under Options | Application | Version Info, set CFBundleIdentifier