/**
 GraphPaperView.h
 
 The NSView subclass that displays graph paper cells
 
 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
 */

#import <Cocoa/Cocoa.h>

#import "CellSource.h"
#import "ClickSource.h"
#import "CellSink.h"

@interface GraphPaperView : NSView <ClickSource, CellSink>

/**
 The source for cells to be displayed
 */
@property(assign) id<CellSource> source;

@end


