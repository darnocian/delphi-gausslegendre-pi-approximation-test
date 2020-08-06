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
| Win32 |  867ms |  
| Win64 |  763ms  | 
| OSX | 1699ms |  
| iOS |  6875ms | 
| Android | 53850ms | 

# NOTE

For OSX, don't forget to stat PA Server

For iOS, don't forget to 
* set deployment provisioning profile
* under Options | Application | Version Info, set CFBundleIdentifier