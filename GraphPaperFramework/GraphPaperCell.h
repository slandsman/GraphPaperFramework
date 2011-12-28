//
//  GraphPaperCell.h
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net>
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphPaperCell : NSObject
{
    int x;
    int y;
}

@property (readwrite,assign) int x;
@property (readwrite,assign) int y;

-(id)initWithPoint:(NSPoint) point;
-(id)initWithX:(int)x andY:(int)y;

@end
