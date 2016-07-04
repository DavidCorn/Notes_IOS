//
//  Note.h
//  Notes
//
//  Created by Qiyao Qin on 6/27/16.
//  Copyright © 2016 Thinkful. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject<NSCoding>
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detail;
-(id)initWithTitle:(NSString *)title detail:(NSString *)detail;
-(BOOL)isBlank;
@end
