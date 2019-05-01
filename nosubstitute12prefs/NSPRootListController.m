#include "NSPRootListController.h"

@implementation NSPRootListController

- (NSArray *)specifiers
{
	if (!_specifiers)
	{
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)sourceLink
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/opa334/NoSubstitute12"] options:@{} completionHandler:nil];
}

@end
