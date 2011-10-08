//
//  GraphPaperCellController.h
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 9/24/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//
/**
    The Cell Controller is the authoritative source of cells for the 
    GraphPaperView.
 
    If further behavior is expected, this class should be overriden
 */

#import <Foundation/Foundation.h>
#import "CellSource.h"
#import "GraphPaperView.h"
#import "GraphPaperCell.h"

@interface GraphPaperCellController : NSObject <CellSource, ClickSink>

@property (assign) GraphPaperView *view;

-(GraphPaperCellController *)initWithView:(GraphPaperView *)view;
-(void)addCell:(GraphPaperCell *)cell;
-(void)deleteCell:(GraphPaperCell *)cell;
-(void)addCell:(GraphPaperCell *)cell withX:(int)x andY:(int)y;
-(void)deleteCellWithX:(int)x andY:(int)y;
-(BOOL)hasCellWithX:(int)x andY:(int)y;

@end
