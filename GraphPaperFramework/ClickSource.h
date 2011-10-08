//
//  CellClickSource.h
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 9/25/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//
/**
 Provide of notifications when a cell has been clicked
 */

#import <Foundation/Foundation.h>
#import "ClickSink.h"

@protocol ClickSource <NSObject>

-(void)addClickSink:(id<ClickSink>)listener;
-(void)removeClickSink:(id<ClickSink>)listener;

@end
