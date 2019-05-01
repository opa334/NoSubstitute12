@interface FBBundleInfo : NSObject
@property (nonatomic,copy,readonly) NSString* bundleIdentifier;
@end

@interface FBApplicationInfo : FBBundleInfo
@end
