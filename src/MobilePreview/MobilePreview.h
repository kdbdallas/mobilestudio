#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIWindow.h>
#import <UIKit/UIView-Hierarchy.h>
#import <UIKit/UIHardware.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIView.h>
#import <UIKit/UIApplication.h>

@interface MobilePreview : UIApplication {
        UIWindow* _window;
		UIView* _mainView;
		UINavigationBar* _navBar;
}

@end