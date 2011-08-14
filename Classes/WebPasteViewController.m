//
//  WebPasteViewController.m
//  WebPaste
//
//  Created by Carlos McEvilly on 9/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WebPasteViewController.h"
#import "NSDataAdditions.h"

@implementation WebPasteViewController

@synthesize webView;
@synthesize textView;
@synthesize button;


- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


- (IBAction)checkPasteboard
{
    NSArray *typeArray;
    [self.textView setText:[self.textView.text stringByAppendingFormat:@"\n========"]];
    for (typeArray in [[UIPasteboard generalPasteboard] pasteboardTypesForItemSet:nil]) {
        id type;
        [self.textView setText:[self.textView.text stringByAppendingFormat:@"\n--------"]];
        for (type in typeArray) {
            [self.textView setText:[self.textView.text stringByAppendingFormat:@"\n[%@]", [type description]]];
        }
    }
}

- (IBAction)makePaste
{
    NSString *html = [self getHTML];
    NSData   *data = [html dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedData = [data base64EncodingWithLineLength:70];
    NSMutableString *webArchiveTemplate = [[NSMutableString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"webArchiveTemplate" ofType:@"xml"]];
    [webArchiveTemplate replaceOccurrencesOfString:@"REPLACE_WITH_ENCODED_DATA"
                                        withString:encodedData
                                           options:NSCaseInsensitiveSearch
                                             range:NSMakeRange(0, [webArchiveTemplate length])];
    NSString *htmlType = @"Apple Web Archive pasteboard type";
    NSString *text     = @"Some text to paste\n";
    NSString *textType = @"public.utf8-plain-text";
    
    //NSString *url      = @"http://www.google.com/";
    //NSString *urlType  = @"public.url";
    
    NSDictionary *item = [NSDictionary dictionaryWithObjectsAndKeys:text,textType,webArchiveTemplate,htmlType,nil];
    [webArchiveTemplate release];
    UIPasteboard  *pasteBoard = [UIPasteboard generalPasteboard];
    pasteBoard.items = [NSArray arrayWithObject:item];
}


- (NSString *)getHTML
{
    return @"<html>"
    "<head>"
    "<style>"
    "body { background-color: #ddddff; font-family: sans-serif; }"
    "</style>"
    "</head>"
    "<body>"
    "<p><strong>Test</strong><br/>"
    "<a href=\"http://www.yahoo.com/\">Yahoo!</a></p>"
    "</body>"
    "</html>";
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [textView release];
    [button release];
    [super dealloc];
}

@end
