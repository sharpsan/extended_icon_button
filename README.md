## Features

Adds `onLongPress` and `onLongHold` to `[IconButton]`.

## Usage

Check out the example app for more info.

```dart
ExtendedIconButton(
    onPressed: () {
        /// increment on press
    },
    longHoldDebounce: const Duration(milliseconds: 200),
    onLongHold: () {
        /// increment every 200ms on long hold
    },
    icon: const Icon(Icons.add),
);
```
