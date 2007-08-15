#import "MobilePreview.h"

@implementation MobilePreview

- (void) navigationBar: (UINavigationBar*)navbar buttonClicked: (int)button 
{
	//
}

- (void) applicationDidFinishLaunching: (id) unused
{	
	//Initialize window
	_window = [[UIWindow alloc] initWithContentRect: [UIHardware fullScreenApplicationContentRect]];
    [_window orderFront: self];
    [_window makeKey: self];
    [_window _setHidden: NO];

	//Setup main view
    struct CGRect rect = [UIHardware fullScreenApplicationContentRect];
    rect.origin.x = rect.origin.y = 0.0f;
    _mainView = [[UIView alloc] initWithFrame: rect];
    [_window setContentView: _mainView];
	  
	//Setup navigation var
	_navBar = [[UINavigationBar alloc] initWithFrame: CGRectMake(0.0f, 0.0f, 320.0f, 40.0f)];
	[_navBar showButtonsWithLeftTitle: @"Foo" rightTitle: @"Bar" leftBack: YES];
    [_navBar setBarStyle: 5];
	[_navBar setDelegate: self];
	[_mainView addSubview: _navBar];
}

- (void) applicationWillSuspend
{
   //
}

@end