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
#import "CellSink.h"

@protocol CellSource <NSObject>

-(NSSet *)cells;

@end
