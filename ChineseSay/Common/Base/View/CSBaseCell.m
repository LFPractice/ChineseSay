//
//  CSBaseCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseCell.h"

@implementation CSBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}
- (void)createUI{
    
}
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    
}
@end
