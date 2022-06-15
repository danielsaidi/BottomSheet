# ``BottomSheet``

BottomSheet makes it easy to add custom bottom sheets to `SwiftUI` apps.



## Overview

![BottomSheet logo](Logo.png)

These sheets can be resized manually and programatically and can be customized to fit your specific needs. You can change colors, fonts, corner radius, size etc. and add any content to them.



## Deprecation notice

This library has been deprecated, due to the new sheet size capabilities in SwiftUI 4, where you can use the new `presentationDetents` view modifier to define custom sizes. The library won't be developed further, but will be around for those of you who use it.

The library previews show you how to use the new SwiftUI APIs while the demo still uses the library functionality. 



## Supported Platforms

BottomSheet supports `iOS 13` and `macOS 11`.



## Installation

BottomSheet can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/BottomSheet.git
```

or with CocoaPods:

```
pod DSBottomSheet
```



## About this documentation

The online documentation is currently iOS only. To generate documentation for other platforms, open the package in Xcode, select a simulator then run `Product/Build Documentation`.

Note that DocC currently omits extensions, which means that some extensions are missing. Future versions will aim to improve this.



## License

BottomSheet is available under the MIT license.



## Topics

### Articles

- <doc:Getting-Started>

### Views

- ``BottomSheet/BottomSheet``
- ``BottomSheetHandle``
- ``BottomSheetHandleBar``

### Styles

- ``BottomSheetStyle``
- ``BottomSheetHandleStyle``
- ``BottomSheetHeight``
- ``SheetColor``
