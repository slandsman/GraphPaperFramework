//
//  GraphPaperCell.h
//  GraphPaperViewStake
//
//  Created by Seth Landsman on 8/21/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphPaperCell : NSObject
{
    int x;
    int y;
}

@property (readwrite,assign) int x;
@property (readwrite,assign) int y;

@end
