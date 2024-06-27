#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(GetMetadata, NSObject)

RCT_EXTERN_METHOD(forKey:(NSString)key
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(intForKey:(NSString)key
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
