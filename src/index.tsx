import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-get-metadata' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const GetMetadata = NativeModules.GetMetadata
  ? NativeModules.GetMetadata
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

interface GetMetadataInterface {
  forKey(key: string): Promise<string>;
  intForKey(key: string): Promise<number>;
}

export default GetMetadata as GetMetadataInterface;
