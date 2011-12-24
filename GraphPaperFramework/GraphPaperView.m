//
//  GraphPaperView.m
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 8/20/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "GraphPaperView.h"
#import "GraphPaperCell.h"
#import "CellSourceConstants.h"
#import "ClickSourceConstants.h"

@implementation GraphPaperView {
    NSPoint last_touch;
}

@synthesize source;

static int GRID_SCALE = 10;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSNotificationCenter *notctr = [NSNotificationCenter defaultCenter];
        [notctr addObserver:self selector:@selector(handleUpdate:) 
                       name:[CellSourceConstants kGPVCellsDidUpdate] object:nil];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor whiteColor] set];
    NSRectFill([self bounds]);                                         

    [[NSColor blackColor] set];
    NSRect bounds = [self bounds];
    int height = bounds.size.height;
    int width = bounds.size.width;
    
    for (int i=0; i<width*GRID_SCALE; i+=GRID_SCALE) {
        NSPoint first = NSMakePoint(i, 0);
        NSPoint second = NSMakePoint(i, height*GRID_SCALE);
        [NSBezierPath strokeLineFromPoint:first toPoint:second];  
    }
    
    for (int i=0; i<height*GRID_SCALE; i+=GRID_SCALE) {
        NSPoint first = NSMakePoint(0, i);
        NSPoint second = NSMakePoint(width*GRID_SCALE, i);
        [NSBezierPath strokeLineFromPoint:first toPoint:second];  
    }
    
    NSEnumerator *e = [source.cells objectEnumerator];
    GraphPaperCell *cell;
    
    while ((cell = [e nextObject])) {
//        NSLog(@"Drawing cell at %i, %i", cell.x, cell.y);
        NSPoint start = NSMakePoint(cell.x*GRID_SCALE + 1, cell.y*GRID_SCALE+1);
        NSRect rect = NSMakeRect(start.x, start.y, GRID_SCALE - 2, GRID_SCALE - 2);
        [NSBezierPath fillRect:rect];        
    }
}

- (NSPoint)getGridSize
{
    NSRect bounds = [self bounds];
    int height = bounds.size.height;
    int width = bounds.size.width;   
    height /= GRID_SCALE;
    width /= GRID_SCALE;
    NSPoint size = NSMakePoint(width, height);
    return size;
}

-(void)broadcast_click:(NSPoint) loc
{
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    NSValue *v = [NSValue valueWithPoint:loc];
    [data setObject:v forKey:@"point"];
    NSNotification *not = [NSNotification notificationWithName:[ClickSourceConstants kGPVClickDidOccur]
                                                        object:self userInfo:data];
    [[NSNotificationCenter defaultCenter] postNotification:not];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    NSLog(@"Mouse Down");
    NSPoint loc = theEvent.locationInWindow;
    loc = [self convertPoint:loc fromView:nil];
    
    loc.x = (int)(loc.x / GRID_SCALE);
    loc.y = (int)(loc.y / GRID_SCALE);    
    last_touch = loc;
    
    [self broadcast_click: loc];
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    NSLog(@"Mouse Drag");
    NSPoint loc = theEvent.locationInWindow;
    loc = [self convertPoint:loc fromView:nil];
    loc.x = (int)(loc.x / GRID_SCALE);
    loc.y = (int)(loc.y / GRID_SCALE);
    
    if (!((loc.x == last_touch.x) && (loc.y == last_touch.y))) {
        last_touch = loc;
        [self broadcast_click: loc];
    } else {
        // do nothing
    }
}

-(void)handleUpdate:(id)source
{
    NSLog(@"handling update in view");
    [self setNeedsDisplay:TRUE];
}

@end
