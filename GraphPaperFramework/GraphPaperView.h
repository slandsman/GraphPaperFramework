//
//  GraphPaperView.h
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 8/20/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "CellSource.h"

@interface GraphPaperView : NSView <CellSink>

@property(assign) id<CellSource> source;

@end


