#import "Tweak.h"

NSSet<NSString *> *disabledApplications;

%hook FBApplicationInfo

- (NSDictionary *)environmentVariables
{
	NSDictionary *orig = %orig;
	if ([disabledApplications containsObject:self.bundleIdentifier])
	{
		NSMutableDictionary *env = [orig mutableCopy] ? : [NSMutableDictionary dictionary];
		//NSLog(@"disabling substitute for app %@", self.bundleIdentifier);
		[env setObject:@"1" forKey:@"_SafeMode"];
		return env;
	}
	return orig;
}

%end

static void loadPrefs()
{
	NSMutableSet<NSString *> *disabledApplicationsM = [NSMutableSet new];

	NSDictionary *prefDict = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.opa334.nosubstitute12prefs"];

	for(NSString *key in [prefDict allKeys])
	{
		NSNumber *value = [prefDict objectForKey:key];
		if([value boolValue])
		{
			[disabledApplicationsM addObject:key];
		}
	}

	disabledApplications = [disabledApplicationsM copy];
}

%ctor
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.opa334.nosubstitute12prefs/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	loadPrefs();
}
