//
//  NSDataAdditions.h
//
// Adapted from Colloquy source code. Original copyright statements follow.
//
// Created by khammond on Mon Oct 29 2001.
// Formatted by Timothy Hatcher on Sun Jul 4 2004.
// Copyright (c) 2001 Kyle Hammond. All rights reserved.
// Original development by Dave Winer.

#import <Foundation/Foundation.h>

@interface NSData (NSDataAdditions)

- (NSString *) base64EncodingWithLineLength:(NSUInteger) lineLength;

@end


