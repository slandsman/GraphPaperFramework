//
//  CellSink.h
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 9/25/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//
/**
 CellSinks receive a notification when the cell list has changed
 */

#import <Foundation/Foundation.h>

@protocol CellSink <NSObject>

-(void)handleUpdate:(id)source;

@end
