//
//  CommentCell.m
//  WeChat
//
//  Created by zhengwenming on 2017/9/21.
//  Copyright © 2017年 zhengwenming. All rights reserved.
//

#import "CommentCell.h"
#import "JGGView.h"

@interface CommentCell ()
@property (nonatomic, strong) CopyAbleLabel *contentLabel;

@end


@implementation CommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        UIColor *bgColor = [UIColor colorWithRed:236.0/256.0 green:236.0/256.0 blue:236.0/256.0 alpha:0.4];
        self.backgroundColor = bgColor;
        self.contentView.backgroundColor = bgColor;

        // contentLabel
        self.contentLabel = [[CopyAbleLabel alloc] init];
        self.contentLabel.backgroundColor = bgColor;
        self.contentLabel.preferredMaxLayoutWidth = kScreenWidth- kGAP-kAvatar_Size - 2*kGAP;
        self.contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.font = [UIFont systemFontOfSize:13.0];
        [self.contentView addSubview:self.contentLabel];

        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapComment:)];
        [self.contentLabel  addGestureRecognizer:tap];
    }
    return self;
}
-(void)tapComment:(UITapGestureRecognizer *)tap{
    if (self.tapCommentBlock) {
        self.tapCommentBlock(self, self.model);
    }
}
#pragma mark
#pragma mark cell左边缩进64，右边缩进10
-(void)setFrame:(CGRect)frame{
    CGFloat leftSpace = 2*kGAP+kAvatar_Size;
    frame.origin.x = leftSpace;
    frame.size.width = kScreenWidth - leftSpace -10;
    [super setFrame:frame];
}
-(void)setModel:(CommentInfoModel *)model{
    _model = model;
    if ([model isKindOfClass:[CommentInfoModel class]]) {
        self.contentLabel.attributedText = model.attributedText;
    }else{
        self.contentLabel.text = @"数组";
    }
}
@end

