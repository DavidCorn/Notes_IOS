//
//  Notes.h
//  Notes
//
//  Created by Qiyao Qin on 6/27/16.
//  Copyright © 2016 Thinkful. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Note;

@interface Notes : NSObject
@property(strong, nonatomic) NSMutableArray *notes;
-(id)initWithNotes:(NSMutableArray *)notes;
-(NSInteger)count;
-(Note *)getNoteAtIndex:(NSInteger)index;
-(void)addNote:(Note *)note;
-(Note *)deleteNoteAtIndex:(NSInteger)index;
-(void)moveFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
@end
