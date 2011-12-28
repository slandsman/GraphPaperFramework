/**
 GraphPaperCellController.h
 
 The Cell Controller is the authoritative source of cells for the 
 GraphPaperView.

 This class will broadcast a cell update (kGPVCellsDidUpdate) when
 the set of cells change
 
 If further behavior is expected, this class should be overriden 

 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
 */

#import <Foundation/Foundation.h>
#import "CellSource.h"
#import "GraphPaperView.h"
#import "GraphPaperCell.h"

@interface GraphPaperCellController : NSObject <CellSource>

/**
 Add a cell to the list of cells contained by the controller
 
 @param cell The GraphPaperCell to add
 */
-(void)addCell:(GraphPaperCell *)cell;

/**
 Add a cell to the list of cells contained by the controller
 
 @param cell The GraphPaperCell to add
 @param x The x coordinate of the cell
 @param y The y coordinate of the cell
 */
-(void)addCell:(GraphPaperCell *)cell withX:(int)x andY:(int)y;

/**
 Remove a cell from the list of cells contained by the controller
 
 @param cell The GraphPaperCell to remove
 */
-(void)deleteCell:(GraphPaperCell *)cell;

/**
 Remove a cell from the list of cells contained by the controller
 
 @param cell The GraphPaperCell to remove
 @param x The x coordinate of the cell
 @param y The y coordinate of the cell
 */
-(void)deleteCellWithX:(int)x andY:(int)y;

/**
 Answer whether or not the controller has a cell at a specific coordinate
 
 @param x The x coordinate of the cell
 @param y The y coordinate of the cell

 @returns TRUE if the cell exists, FALSE otherwise
 */
-(BOOL)hasCellWithX:(int)x andY:(int)y;

@end
