//
//  WebPasteViewController.h
//  WebPaste
//
//  Created by Carlos McEvilly on 9/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebPasteViewController : UIViewController {

}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UITextView *textView;
@property (nonatomic, retain)          UIButton *button;

- (IBAction)checkPasteboard;
- (IBAction)makePaste;
- (NSString *)getHTML;

@end

