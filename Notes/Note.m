//
//  Note.m
//  Notes
//
//  Created by Qiyao Qin on 6/27/16.
//  Copyright © 2016 Thinkful. All rights reserved.
//

#import "Note.h"

@implementation Note
-(id)initWithTitle:(NSString *)title detail:(NSString *)detail {
    self = [super init];
    if (!self) {
        return nil; //something went wrong!
    }
    self.title = title;
    self.detail = detail;
    return self;
}

//returns if note is blank
-(BOOL)isBlank {
    return !(self.title && self.title.length>0 && self.detail && self.detail.length>0);
}
@end
