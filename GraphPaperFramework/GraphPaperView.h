//
//  GraphPaperView.h
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net>
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "CellSource.h"
#import "ClickSource.h"

@interface GraphPaperView : NSView <ClickSource>

@property(assign) id<CellSource> source;

@end


