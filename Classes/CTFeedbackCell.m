//
//  CTFeedbackCell.m
//  CTFeedbackDemo
//
//  Created by 和泉田 領一 on 2013/10/31.
//  Copyright (c) 2013年 CAPH. All rights reserved.
//

#import "CTFeedbackCell.h"
#import "CTFeedbackCellItem.h"

NSString *const CTFeedbackCellIdentifierTopic=@"CTFeedbackCellIdentifierTopic";

@implementation CTFeedbackCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:[NSClassFromString(reuseIdentifier) cellStyle] reuseIdentifier:reuseIdentifier];
    if (self) {
        UIColor* selectedColor = [UIColor colorWithRed:60.0f/255 green:60.0f/255 blue:60.0f/255 alpha:1];
        
        UIView * selectedBackgroundView = [[UIView alloc] init];
        [selectedBackgroundView setBackgroundColor:selectedColor];
        [self setSelectedBackgroundView:selectedBackgroundView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
