//
//  GraphPaperCellController.m
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 9/24/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "GraphPaperCellController.h"
#import "GraphPaperCell.h"
#import "CellSourceConstants.h"
#import "ClickSourceConstants.h"
#import <TwoKeyDictionaryFramework/TwoKeyMutableDictionary.h>

@implementation GraphPaperCellController

TwoKeyMutableDictionary *cells;
NSMutableSet *sinks;

-(void)populate_sample_data 
{
    GraphPaperCell *c = [[GraphPaperCell alloc] init];
    c.x = 0; c.y = 0;
    [self addCell:c];
    
    c = [[GraphPaperCell alloc] initWithX:1 andY:1];
    [self addCell:c];
    
    c = [[GraphPaperCell alloc] initWithX:5 andY:5];
    [self addCell:c];
    
    c = [[GraphPaperCell alloc] initWithX:5 andY:10];
    [self addCell:c];

//    [view setNeedsDisplay:TRUE];
}

-(GraphPaperCellController *)init
{
    self = [super init];
    if (self) 
    {
        NSNotificationCenter *notctr = [NSNotificationCenter defaultCenter];
        [notctr addObserver:self selector:@selector(handleClick:) 
                       name:[ClickSourceConstants kGPVClickDidOccur] object:nil];
        sinks = [[NSMutableSet alloc] init];
        cells = [[TwoKeyMutableDictionary alloc] init];
        [self populate_sample_data];
    }
    return self;    
}

-(void)notifySinks
{
    NSNotification *not = [NSNotification 
                           notificationWithName:[CellSourceConstants kGPVCellsDidUpdate] object:self];
    [[NSNotificationCenter defaultCenter] postNotification:not];
}

-(NSSet *)cells {
    if (cells != nil) {
        return [[NSSet alloc] initWithArray:[cells allValues]];    
    }
    return [[NSSet alloc] init];
}

-(void)addCell:(GraphPaperCell *)cell 
{
    [self addCell:cell withX:cell.x andY:cell.y];
}

-(void)deleteCell:(GraphPaperCell *)cell
{
    [self deleteCellWithX:cell.x andY:cell.y];
}

-(void)addCell:(GraphPaperCell *)cell withX:(int)x andY:(int)y
{
    [cells setObject:cell forIndexOne:x andIndexTwo:y];
    [self notifySinks];    
}

-(void)deleteCellWithX:(int)x andY:(int)y
{
    [cells removeObjectForIndexOne:x andIndexTwo:y];
    [self notifySinks];    
}

-(BOOL)hasCellWithX:(int)x andY:(int)y
{
    GraphPaperCell *cell = [cells objectForIndexOne:x
                                        andIndexTwo:y];
    if (cell != nil) {
        return YES;
    } else {
        return NO;
    }
}

-(void)handleClick:(NSNotification *)not
{
    NSLog(@"Controller handling click ...");
    NSValue *v = [[not userInfo] objectForKey:@"point"];
    NSPoint loc = [v pointValue];
    NSLog(@"Got a click at %f, %f", loc.x, loc.y);
    GraphPaperCell *cell = [[GraphPaperCell alloc] initWithPoint:loc];
    if ([self hasCellWithX:loc.x andY:loc.y]) {
        [self deleteCellWithX:loc.x andY:loc.y];
    } else {
        [self addCell:cell withX:cell.x andY:cell.y];
    }
//    [self.view setNeedsDisplay:TRUE];
}

@end
