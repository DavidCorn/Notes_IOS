//
//  Model.h
//  Notes
//
//  Created by Qiyao Qin on 6/27/16.
//  Copyright © 2016 Thinkful. All rights reserved.
//

#import <Foundation/Foundation.h>
//@class Note;
@class Notes;

@interface Model : NSObject
@property(copy, nonatomic) Notes *notes;
+ (Model *)sharedModel;
//-(void)saveNote:(Note *)note;
//-(Note *)loadNote;
@end
