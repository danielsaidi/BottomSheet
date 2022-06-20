<p align="center">
    <img src ="Resources/Logo.png" alt="BottomSheet Logo" title="BottomSheet" width=600 />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/BottomSheet?color=%2300550&sort=semver" alt="Version" />
    <img src="https://img.shields.io/badge/Swift-5.6-orange.svg" alt="Swift 5.6" />
    <img src="https://img.shields.io/github/license/danielsaidi/BottomSheet" alt="MIT License" />
    <a href="https://twitter.com/danielsaidi">
        <img src="https://img.shields.io/badge/contact-@danielsaidi-blue.svg?style=flat" alt="Twitter: @danielsaidi" />
    </a>
</p>


## Deprecation notice

This library will be deprecated, due to the new SwiftUI 4 custom sheet size capabilities. Since this functionality will be added to SwiftUI, this library is no longer needed.

In SwiftUI 4, you can use the new `presentationDetents` view modifier to define custom sheet sizes. You can also make sheets non-dismissable, hide the resize handle, etc.  

You can read more about these new capabilities [here](https://danielsaidi.com/blog/2022/06/15/swiftui-4-custom-sheet-sizes).

This library will not be developed further, but will be around for a while, for those of you who use it. It will be archived before it's completely removed in a few years.



## About BottomSheet

BottomSheet makes it easy to add custom bottom sheets to your `SwiftUI` apps. The result can look like this, or completely different:

<p align="center">
    <img src="Resources/Demo.gif" width=300 />
</p>

These sheets can be resized manually and programatically and can be customized to fit your specific needs. You can change colors, fonts, corner radius, expanded height etc. and add any content to them.



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



## Getting started

To get started with BottomSheet, have a look at [this getting started guide][GettingStarted].



## Documentation

The [online documentation][Documentation] contains more information, code examples etc. and makes it easy to overview the various parts of the library.

The online documentation is currently iOS only. To generate documentation for other platforms, open the package in Xcode, select a simulator then run `Product/Build Documentation`. 



## Demo Application

This project contains a demo app that lets you explore BottomSheet on iOS. To run it, just open and run `Demo/Demo.xcodeproj`.



## Acknowledgements

This library is based on [this amazing gist][MecidGist] by [@mecid][Mecid]. It would not have been made without him, so big thanks for putting that gist out into the world.



## Support

You can sponsor this project on [GitHub Sponsors][Sponsors] or get in touch for paid support. 



## Contact

Feel free to reach out if you have questions or if you want to contribute in any way:

* E-mail: [daniel.saidi@gmail.com][Email]
* Twitter: [@danielsaidi][Twitter]
* Web site: [danielsaidi.com][Website]



## License

BottomSheet is available under the MIT license. See the [LICENSE][License] file for more info.


[Email]: mailto:daniel.saidi@gmail.com
[Twitter]: http://www.twitter.com/danielsaidi
[Website]: http://www.danielsaidi.com
[Sponsors]: https://github.com/sponsors/danielsaidi

[Documentation]: https://danielsaidi.github.io/BottomSheet/documentation/bottomsheet/
[GettingStarted]: https://github.com/danielsaidi/BottomSheet/blob/master/Readmes/Getting-Started.md
[License]: https://github.com/danielsaidi/BottomSheet/blob/master/LICENSE

[Mecid]: http://www.twitter.com/mecid
[MecidGist]: https://gist.github.com/mecid/78eab34d05498d6c60ae0f162bfd81ee
