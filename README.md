#  Delphi Gauss-Legendre PI Approximation Test 

This is a sample Delphi project using Gauss-Legendre algorithm to approximate PI.

Used to get an idea of how Delphi performs with floating point operations cross platform.

Platforms tested:
- Win32
- Win64
- macOS
- iOS
- Android
- Linux

# Results

Samples: 1,000,000

Digits: 10,000,000

For n digits, iteration count of log2 n is used.

*Release Build*

Test Device | Delphi Version | Win32 | Win64 | macOS | iOS | Android | Linux
---|---|---:|---:|---:|---:|---:|---:
MacBook 2014 | 10.3.3 | 867ms<sup>1</sup> | 763ms<sup>1</sup> | 1,699ms | - | - | -
iPhone 6s 64bit | 10.3.3 | - | - | - | 6,875ms | - | -
Cubot J7 Android 9 32bit | 10.3.3 | - | - | - | - | 53,850ms | -
Mac Pro (Late 2013) 3GHz 8-Core Intel Xeon E5 | 10.4 (p.3) | 781ms<sup>1</sup> | 656ms<sup>1</sup> | 1,404ms | - | - | 8,358ms<sup>1</sup>
iPhone Xs | 10.4 (p.3) | - | - | - | 4,748ms | - | -

1. Running in VMWare Fusion

# NOTE

For OSX, don't forget to stat PA Server

For iOS, don't forget to 
* set deployment provisioning profile
* under Options | Application | Version Info, set CFBundleIdentifier
