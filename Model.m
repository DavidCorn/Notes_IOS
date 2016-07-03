//
//  Model.m
//  Notes
//
//  Created by Qiyao Qin on 6/27/16.
//  Copyright © 2016 Thinkful. All rights reserved.
//

#import "Model.h"
#import "Note.h"
#import "Notes.h"

@implementation Model
+ (Model *)sharedModel
{
    static Model* modelSingleton = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        modelSingleton = [[Model alloc] init];
    });
    return modelSingleton;
}
-(Notes *)notes {
    if (!_notes) {
        _notes = [[Notes alloc] initWithNotes:@[
                                                [[Note alloc] initWithTitle:@"First note" detail:@"Here's some detail"],
                                                [[Note alloc] initWithTitle:@"Second note" detail:@"Here's some more detail"]
                                                ]
                  ];
    }
    return _notes;
}
//-(void)saveNote:(Note *)note {
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:note.title forKey:@"title"];
//    [defaults setObject:note.detail forKey:@"detail"];
//    [defaults synchronize];
//}
//-(Note *)loadNote {
//    //note should be saved here
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *title = [defaults stringForKey:@"title"];
//    NSString *detail = [defaults stringForKey:@"detail"];
//    Note *note;
//    if (title && detail) {
//        note = [[Note alloc] initWithTitle:title detail:detail];
//    } else {
//        note = [[Note alloc] initWithTitle:@"" detail:@""];
//    }
//    return note;
//}
@end
