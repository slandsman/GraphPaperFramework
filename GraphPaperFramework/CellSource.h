/**
 CellSource.h
 
 Provide of a set of cells
 
 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
 */

#import <Foundation/Foundation.h>

@protocol CellSource <NSObject>

/**
 Return a set of immutable GraphPaperCell objects
 */
-(NSSet *)cells;

@end
