//
//  NoteTableViewCell.m
//  Notes
//
//  Created by Craig on 10/07/2015.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

#import "NoteTableViewCell.h"

@implementation NoteTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end