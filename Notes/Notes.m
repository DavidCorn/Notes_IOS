//
//  Notes.m
//  Notes
//
//  Created by Qiyao Qin on 6/27/16.
//  Copyright © 2016 Thinkful. All rights reserved.
//

#import "Notes.h"

@implementation Notes
-(id)initWithNotes:(NSMutableArray *)notes {
    self = [super init];
    if (!self) {
        return nil; //something went wrong!
    }
    self.notes = [notes mutableCopy];
    return self;
}
-(NSInteger)count {
    return self.notes.count;
}
-(void)addNote:(Note *)note {
    [self.notes addObject:note];
}
-(Note *)getNoteAtIndex:(NSInteger)index {
    return self.notes[index];
}
-(Note *)deleteNoteAtIndex:(NSInteger)index {
    Note *noteToDelete = self.notes[index];
    [self.notes removeObjectAtIndex: index];
    return (noteToDelete);
}
-(void)moveFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    Note *noteToMove = [self deleteNoteAtIndex:fromIndex];
    [self.notes insertObject:noteToMove atIndex:toIndex];
}
@end
