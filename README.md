#  Delphi Gauss-Legendre PI Approximation Test 

This is a sample Delphi project using [Gauss-Legendre algorithm](https://en.wikipedia.org/wiki/Gauss%E2%80%93Legendre_algorithm)  to approximate PI.


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

*Timing Results*

Tester| Type  | Test Device | Delphi Version | Win32 | Win64 | macOS | iOS | Android | Linux
---|---|---|---|---:|---:|---:|---:|---:|---:
CV |Double |MacBook Pro (Mid 2014) 3 GHz Dual-Core Intel Core i7 | 10.3.3 | 531ms<sup>1</sup> | 234ms<sup>1</sup> | 865ms | - | - | -
CV |Extended|MacBook Pro (Mid 2014) 3 GHz Dual-Core Intel Core i7 | 10.3.3 | 640ms<sup>1</sup> | 234ms<sup>1</sup> | 1,043ms | - | - | -
CV |Double|iPhone 6s 64bit | 10.3.3 | - | - | - | 5,877ms | - | -
CV |Extended|iPhone 6s 64bit | 10.3.3 | - | - | - | 5,966ms | - | -
CV |Double|iPhone 6s 64bit | 10.4 (p.3) | - | - | - | 5,847ms | - | -
CV |Extended|iPhone 6s 64bit | 10.4 (p.3) | - | - | - | 5,847ms | - | -
CV |Double|Cubot J7 Android 9 32bit | 10.3.3 | - | - | - | - | 20,760ms | -
CV |Extended|Cubot J7 Android 9 32bit | 10.3.3 | - | - | - | - | 20,771ms | -
CV |Double|Cubot J7 Android 9 32bit | 10.4 (p.3) | - | - | - | - | 19,103ms | -
CV |Extended|Cubot J7 Android 9 32bit | 10.4 (p.3) | - | - | - | - | 19,103ms | -
RH |Extended|Mac Pro (Late 2013) 3GHz 8-Core Intel Xeon E5 | 10.4 (p.3) | 579ms<sup>1</sup> | 217ms<sup>1</sup> | 931ms | - | - | 8,288ms<sup>1</sup>
RH |Extended|iPhone Xs | 10.4 (p.3) | - | - | - | 4,204ms | - | -

1. Running in VMWare Fusion

# NOTE

Build project in release mode.

For OSX and Linux, don't forget to start PA Server. Once project is built on the relevant platform, run the application standalone without the IDE to minimise any additional overheads.

For iOS, don't forget to 
* set deployment provisioning profile
* under Options | Application | Version Info, set CFBundleIdentifier

# Observations

The app was fairly simple, and initially updating the approximation on the UI label was done inside of the testing loop.
Android performed very poorly as a result compared to other platforms, with results almost 2.5 times what it was once updating UI was fully outside of the loop.
