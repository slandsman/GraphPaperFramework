/**
 GraphPaperCellController.m
 
 The Cell Controller is the authoritative source of cells for the 
 GraphPaperView.
 
 This class will broadcast a cell update (kGPVCellsDidUpdate) when
 the set of cells change
 
 If further behavior is expected, this class should be overriden 
 
 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
 */

#import "GraphPaperCellController.h"
#import "GraphPaperCell.h"
#import "CellSourceConstants.h"
#import "ClickSourceConstants.h"
#import <TwoKeyDictionaryFramework/TwoKeyMutableDictionary.h>

@interface GraphPaperCellController(private)

    -(void)notifySinks;

@end

@implementation GraphPaperCellController {
    TwoKeyMutableDictionary *cells; /** the list of cells contained by the controller */
}

#pragma mark - Initializers

-(GraphPaperCellController *)init
{
    self = [super init];
    if (self) 
    {
        NSNotificationCenter *notctr = [NSNotificationCenter defaultCenter];
        [notctr addObserver:self selector:@selector(handleClick:) 
                       name:[ClickSourceConstants kGPVClickDidOccur] object:nil];
        cells = [[TwoKeyMutableDictionary alloc] init];
    }
    return self;    
}

#pragma mark - Cell listing and manipulation

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

#pragma mark - Notification management

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
}

-(void)notifySinks
{
    NSNotification *not = [NSNotification 
                           notificationWithName:[CellSourceConstants kGPVCellsDidUpdate] object:self];
    [[NSNotificationCenter defaultCenter] postNotification:not];
}

@end
