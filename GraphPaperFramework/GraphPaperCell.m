/**
 GraphPaperCell.m
 
 The representation of a single atomic cell
 
 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
 
 */
#import "GraphPaperCell.h"

@implementation GraphPaperCell 

#pragma mark - Properties

@synthesize x;
@synthesize y;

#pragma mark - Initializers

-(id)initWithPoint:(NSPoint) point
{
    self = [super init];
    if (self) {
        x = point.x;
        y = point.y;
    }
    return self;
}

-(id)initWithX:(int)xV andY:(int)yV
{
    self = [super init];
    if (self) {
        x = xV;
        y = yV;
    }
    return self;
}

@end
