//
//  WebPasteAppDelegate.h
//  WebPaste
//
//  Created by Carlos McEvilly on 9/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebPasteViewController;

@interface WebPasteAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WebPasteViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WebPasteViewController *viewController;

@end

