# react-native-get-metadata

![React Native](https://img.shields.io/badge/react_native-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
![Kotlin](https://img.shields.io/badge/kotlin-%237F52FF.svg?style=for-the-badge&logo=kotlin&logoColor=white)
![Swift](https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white)

Get metadata from Info.plist (iOS) or AndroidManifest.xml (Android).

## Why?

There is a old and inactive [lib](https://github.com/CubeSugar/react-native-app-metadata) for that, so I decided to create a new to add support for latest React Native versions and use Swift and Kotlin as native languages.

## Installation

```sh
npm install react-native-get-metadata
# With yarn
yarn add react-native-get-metadata

cd ios && pod install
```

## Usage

- AndroidManifest.xml

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
...
    <application>
      ...
      <meta-data android:name="API_KEY" android:value="example_api_key" />
    </application>
</manifest>
```

- Info.plist

```xml
<?xml version="1.0" encoding="UTF-8"?>
<plist version="1.0">
<dict>
	...
	<key>API_KEY</key>
	<string>example_api_key</string>
</dict>
</plist>
```

- React Native

```js
import GetMetadata from 'react-native-get-metadata';

const data = await GetMetadata.forKey('API_KEY');
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
