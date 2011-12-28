//
//  CellSource.h
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net>
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

/**
 Provide of a set of cells
 */

#import <Foundation/Foundation.h>

@protocol CellSource <NSObject>

-(NSSet *)cells;

@end
