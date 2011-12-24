//
//  AppDelegate.m
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 9/24/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "AppDelegate.h"
#import <GraphPaperFramework/CellSource.h>
#import <GraphPaperFramework/GraphPaperCellController.h>

@interface AppDelegate (private)

-(void)doUpdateStatus;

@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize statusField;
@synthesize view;

GraphPaperCellController *controller;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{        
    controller = [[GraphPaperCellController alloc] initWithView:view];
    view.source = controller;
    
    NSNotificationCenter *notctr = [NSNotificationCenter defaultCenter];
    [notctr addObserver:self selector:@selector(handleUpdate:) name:kGPVCellsDidUpdate object:nil];
    
    [self doUpdateStatus];
}

-(void)handleUpdate:(id)source
{
    NSLog(@"Got the notification ...");
    [self doUpdateStatus];
}

-(void)doUpdateStatus
{
    NSString *v = [[NSString alloc] initWithFormat:@"GraphPaper stats - number of cells %i", 
                   [[controller cells] count]];
    statusField.stringValue = v;
}

@end
