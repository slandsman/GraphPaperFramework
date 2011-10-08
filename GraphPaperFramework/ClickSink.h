//
//  CellClickSink.h
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 9/25/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClickSource.h"

@protocol ClickSink <NSObject>

-(void)handleClick:(NSPoint)loc fromSource:(id)source;

@end
