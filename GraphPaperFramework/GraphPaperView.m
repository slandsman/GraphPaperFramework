/**
 GraphPaperView.m
 
 The NSView subclass that displays graph paper cells
 
 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
 */

#import "GraphPaperView.h"
#import "GraphPaperCell.h"
#import "CellSourceConstants.h"
#import "ClickSourceConstants.h"

@interface GraphPaperView(private)
    -(void)broadcast_click:(NSPoint)loc;
@end

@implementation GraphPaperView {
    NSPoint last_touch; /** the last x,y coordinate to be clicked */
}

#pragma mark - constants 

/** the size of each grid square */
static int GRID_SCALE = 10;

#pragma mark - properties

@synthesize source;

#pragma mark - initializers

/**
 Initialize with frame, overriding NSView initializer
 */
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

#pragma mark - drawing methods

/**
 Drawing method, overriding NSView drawRect:NSRect
 
 Called on redraw
 */
- (void)drawRect:(NSRect)dirtyRect
{
    // draw the background
    [[NSColor whiteColor] set];
    NSRectFill([self bounds]);                                         

    // draw the grid
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
    
    // draw each cell
    NSEnumerator *e = [source.cells objectEnumerator];
    GraphPaperCell *cell;
    
    while ((cell = [e nextObject])) {
        NSPoint start = NSMakePoint(cell.x*GRID_SCALE + 1, cell.y*GRID_SCALE+1);
        NSRect rect = NSMakeRect(start.x, start.y, GRID_SCALE - 2, GRID_SCALE - 2);
        [NSBezierPath fillRect:rect];        
    }
}

#pragma mark - Grid introspection

/**
 Get the grid size
 
 @returns the width and height of the grid
 */
- (NSSize)getGridSize
{
    NSRect bounds = [self bounds];
    int height = bounds.size.height;
    int width = bounds.size.width;   
    height /= GRID_SCALE;
    width /= GRID_SCALE;
    NSSize size = NSMakeSize(width, height);
    return size;
}

#pragma mark - Mouse listener

/**
 On mouse down, send out the click location and track
 */
- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint loc = theEvent.locationInWindow;
    loc = [self convertPoint:loc fromView:nil];
    
    loc.x = (int)(loc.x / GRID_SCALE);
    loc.y = (int)(loc.y / GRID_SCALE);    
    last_touch = loc;
    
    [self broadcast_click: loc];
}

/**
 If the mouse is being dragged, send out a click location
 if the location has changed
 */
- (void)mouseDragged:(NSEvent *)theEvent
{
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

#pragma mark - Notification management

/**
 Broadcast the click via the notification center
 */
-(void)broadcast_click:(NSPoint) loc
{
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    NSValue *v = [NSValue valueWithPoint:loc];
    [data setObject:v forKey:@"point"];
    NSNotification *not = [NSNotification notificationWithName:[ClickSourceConstants kGPVClickDidOccur]
                                                        object:self userInfo:data];
    [[NSNotificationCenter defaultCenter] postNotification:not];
}

/**
 Receive notification from the cell source that the set of cells has been changed
 */
-(void)handleUpdate:(id)source
{
    [self setNeedsDisplay:TRUE];
}

@end
