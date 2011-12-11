//
//  AppDelegate.h
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 9/24/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <GraphPaperFramework/GraphPaperView.h>
#import <GraphPaperFramework/CellSink.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, CellSink>

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet GraphPaperView *view;
@property (strong) IBOutlet NSTextField *statusField;

@end
