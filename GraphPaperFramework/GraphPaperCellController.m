//
//  GraphPaperCellController.m
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 9/24/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "GraphPaperCellController.h"
#import "GraphPaperCell.h"
#import <TwoKeyDictionaryFramework/TwoKeyMutableDictionary.h>

@implementation GraphPaperCellController

@synthesize view;

TwoKeyMutableDictionary *cells;
NSMutableSet *sinks;

-(void)populate_sample_data 
{
    GraphPaperCell *c = [[GraphPaperCell alloc] init];
    c.x = 0; c.y = 0;
    [self addCell:c];
    
    c = [[GraphPaperCell alloc] init];
    c.x = 1; c.y = 1;
    [self addCell:c];
    
    c = [[GraphPaperCell alloc] init];
    c.x = 5; c.y = 5;
    [self addCell:c];
    
    c = [[GraphPaperCell alloc] init];
    c.x = 5; c.y = 10;
    [self addCell:c];

    [view setNeedsDisplay:TRUE];
}

-(GraphPaperCellController *)initWithView:(GraphPaperView *)v
{
    self = [super init];
    if (self) 
    {
        self.view = v;
        sinks = [[NSMutableSet alloc] init];
        cells = [[TwoKeyMutableDictionary alloc] init];
        [self populate_sample_data];
    }
    return self;
}

-(void)notifySinks
{
    NSEnumerator *en = [sinks objectEnumerator];
    id<CellSink> sink;
    while (sink = [en nextObject])
    {
        [sink handleUpdate:self];
    }
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
    [cells setObject:cell forKeyOne:[NSNumber numberWithInt:x] andKeyTwo:
     [NSNumber numberWithInt:y]];
    [self notifySinks];    
}

-(void)deleteCellWithX:(int)x andY:(int)y
{
    [cells removeObjectForKeyOne:[NSNumber numberWithInt:x] andKeyTwo:
     [NSNumber numberWithInt:y]];
    [self notifySinks];    
}

-(BOOL)hasCellWithX:(int)x andY:(int)y
{
    GraphPaperCell *cell = [cells objectForKeyOne:[NSNumber numberWithInt:x] 
                                        andKeyTwo:[NSNumber numberWithInt:y]];
    if (cell != nil) {
        return YES;
    } else {
        return NO;
    }
}

-(void)handleClick:(NSPoint)loc fromSource:(id)source
{
    NSLog(@"Got a click from %@ at %f, %f", source, loc.x, loc.y);
    GraphPaperCell *cell = [[GraphPaperCell alloc] init];
    cell.x = loc.x; cell.y = loc.y;
    if ([self hasCellWithX:loc.x andY:loc.y]) {
        [self deleteCellWithX:loc.x andY:loc.y];
    } else {
        [self addCell:cell withX:cell.x andY:cell.y];
    }
    [self.view setNeedsDisplay:TRUE];
}

-(void)addCellSink:(id<CellSink>)sink 
{
    [sinks addObject:sink];
}

-(void)removeCellSink:(id<CellSink>)sink
{
    [sinks removeObject:sink];
}


@end
