//
//  CellSink.h
//  GraphPaperFramework
//
//  Created by Seth Landsman on 12/28/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CellSink <NSObject>

-(void)handleUpdate:(id)source;

@end
