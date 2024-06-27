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

export function multiply(a: number, b: number): Promise<number> {
  return GetMetadata.multiply(a, b);
}

export function getMetadata(key: string): Promise<string> {
  return GetMetadata.getMetadata(key);
}
