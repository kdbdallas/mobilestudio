#import "MobileTextEdit.h"

@implementation MobileTextEdit

- (void) navigationBar: (UINavigationBar*)navbar buttonClicked: (int)button 
{
	switch (button) 
	{
		case 0: //Save
			[[textView text]
			        writeToFile: path
			        atomically: NO
			        encoding: NSMacOSRomanStringEncoding
			        error: &error];
			
			buttons = [NSArray arrayWithObjects:@"Close",nil];
			
			popup = [[UIAlertSheet alloc] initWithTitle:@"Saved" buttons:buttons defaultButtonIndex:0 delegate:self context:nil];

			[popup setBodyText: @"File Saved"];

			[popup popupAlertAnimated: TRUE];
		break;

		case 1:	//Open
			//
		break;
	}
}

- (void) alertSheet: (UIAlertSheet*)sheet buttonClicked:(int)button
{
	[sheet dismissAnimated: TRUE];
}

- (void) applicationDidFinishLaunching: (id) unused
{	
    UIWindow *window;
    struct CGRect rect = [UIHardware fullScreenApplicationContentRect];
    rect.origin.x = rect.origin.y = 0.0f;

    window = [[UIWindow alloc] initWithContentRect: rect];

    [window orderFront: self];
    [window makeKey: self];
    [window _setHidden: NO];

    mainView = [[UIView alloc] initWithFrame: rect];

	_navBar = [[UINavigationBar alloc] initWithFrame: CGRectMake(0.0f, 0.0f, 320.0f, 40.0f)];
	[_navBar showButtonsWithLeftTitle: @"Open" rightTitle: @"Save" leftBack: NO];
    [_navBar setBarStyle: 5];
	[_navBar setDelegate: self];

	[mainView addSubview: _navBar];

    textView = [[UITextView alloc]
        initWithFrame: CGRectMake(0.0f, 40.0f, 320.0f, 245.0f - 40.0f)];
    [textView setEditable:YES];
    [textView setTextSize:14];

    kb = [[UIKeyboard alloc]
        initWithFrame:CGRectMake(0.0f, 245.0f, 320.0f, 200.0f)];

    [window setContentView: mainView];
    [mainView addSubview:textView];
    [mainView addSubview:kb];

	NSArray *myArgs = [[NSProcessInfo processInfo] arguments];

	if ([myArgs count] > 1)
	{
  		path = [myArgs objectAtIndex:1];

		[textView setText:
	        [NSMutableString
	            stringWithContentsOfFile:path
	            encoding:NSMacOSRomanStringEncoding
	            error:&error]];
	}
	else
	{
		[textView setText: @""];
	}
}

- (void) applicationWillSuspend
{
   //
}

@end