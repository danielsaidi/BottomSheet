# Release notes


## 0.2.0

This release adds macOS support and tweaks the design and behavior of the bottom sheet.

The handle was previously placed in a non-designable area, under which the sheet content scrolled.

Now, the area has a divider that separates the handle from the content, with the entire handle bar area being customizable with the handle style. 

### 💥 New Features

* The library now compiles for macOS.
* There is a new `BottomSheetHandleBar` view.
* `BottomSheetHandleStyle` has a new `backgroundColor` property.
* `BottomSheetHandleStyle` has a new `dividerColor` property.
* `BottomSheetHandleStyle` has a new `padding` property.

### 💡 Behavior Changes

* The sheet handle is now placed in a bar, with padding and a divider.

### 🗑 Deprecations

* `BottomSheetHandleStyle` `color` has been renamed to `handleColor`.


## 0.1.0

This is the first public release of BottomSheet. 

Check out the readme and the demo app for information about how to use it.
