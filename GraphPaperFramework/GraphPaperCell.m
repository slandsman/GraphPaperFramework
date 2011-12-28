//
//  GraphPaperCell.m
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net>
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import "GraphPaperCell.h"

@implementation GraphPaperCell 

@synthesize x;
@synthesize y;

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


