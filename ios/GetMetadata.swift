@objc(GetMetadata)
class GetMetadata: NSObject {

  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)
  }
    
    @objc(getMetadata:withResolver:withRejecter:)
    func getMetadata(key: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        
        if let info = Bundle.main.path(forResource: "Info", ofType: "plist") {
            let data = NSDictionary(contentsOfFile: info)
            if let value = data![key] {
                resolve(value)
                return
            }
            
            reject("get_metada_error", "Cannot get data for key \(key)", nil)
            return
        }
        
        reject("get_metada_error", "Cannot get Info.plist", nil)
    }
}
