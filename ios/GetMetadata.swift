enum GetMetadataError: Error {
    case getMetadataError
    case cannotGetInfoPlist
    case cannotGetBundle
}

@objc(GetMetadata)
class GetMetadata: NSObject {
    
    func getBundle() throws -> NSDictionary {
        if let info = Bundle.main.path(forResource: "Info", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: info) {
                return dict
            } else {
                throw GetMetadataError.cannotGetInfoPlist
            }
        } else {
            throw GetMetadataError.cannotGetBundle
        }
    }
    
    @objc(forKey:withResolver:withRejecter:)
    func forKey(key: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        do {
            let data = try getBundle()
            
            if let value = data[key] {
                resolve(value)
                return
            }
            
            throw GetMetadataError.getMetadataError
        } catch {
            reject("[ERROR:GetMetadata.forKey]", "\(error)", nil)
        }
    }
    
    @objc(intForKey:withResolver:withRejecter:)
    func intForKey(key: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        do {
            let data = try getBundle()
            
            if let value = data[key] {
                resolve(value as! Int)
                return
            }
            
            throw GetMetadataError.getMetadataError
        } catch {
            reject("[ERROR:GetMetadata.intForKey]", "\(error)", nil)
        }
    }
}
