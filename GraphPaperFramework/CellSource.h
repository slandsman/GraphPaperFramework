//
//  CellSource.h
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 9/24/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//
/**
 Provide of a set of cells
 */

#import <Foundation/Foundation.h>

@interface CellSource : NSObject

extern NSString * const kGPVCellsDidUpdate;

-(NSSet *)cells;

@end
