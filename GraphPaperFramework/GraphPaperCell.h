/**
 GraphPaperCell.h
 
 The representation of a single atomic cell
 
 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
 
 */

#import <Foundation/Foundation.h>

@interface GraphPaperCell : NSObject
{
    int x; /** x coordinate */
    int y; /** y coordinate */
}

@property (readwrite,assign) int x;
@property (readwrite,assign) int y;

/**
 initialize a graph paper cell with an NSPoint
 
 @param point An NSPoint representing the cell's x and y coordinates 
 */
-(id)initWithPoint:(NSPoint) point;

/**
 Initialize a graph paper cell with an x and y value
 
 @param x the x coordinate
 @param y the y coordinate
 */
-(id)initWithX:(int)x andY:(int)y;

@end
