//
//  AppDelegate.h
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net>
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GraphPaperFramework.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet GraphPaperView *view;
@property (strong) IBOutlet NSTextField *statusField;

@end
