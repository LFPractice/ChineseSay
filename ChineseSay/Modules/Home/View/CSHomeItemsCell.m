//
//  CSHomeItemsCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeItemsCell.h"
#import "CSHomeItemsCellModel.h"
#import "CSHomeItemsCellItem.h"
@interface CSHomeItemsCell()
@property (nonatomic, strong) CSHomeItemsCellItem *item1;
@property (nonatomic, strong) CSHomeItemsCellItem *item2;
@property (nonatomic, strong) CSHomeItemsCellItem *item3;
@property (nonatomic, strong) NSArray *itemsArr;
@end
@implementation CSHomeItemsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)createUI{
    [self.contentView addSubview:self.item1];
    [self.contentView addSubview:self.item2];
    [self.contentView addSubview:self.item3];
}
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    CSHomeItemsCellModel *itemsModel = (CSHomeItemsCellModel *)model;
    for(CSHomeItemsCellItem *item in self.contentView.subviews){
        if([item isKindOfClass:[CSHomeItemsCellItem class]]){
            [item removeFromSuperview];
        }
    }
    NSArray *itemsDataArr = itemsModel.extparam;
    for(int i = 0;i <itemsDataArr.count && i < self.itemsArr.count; i++){
        CSHomeItemSingleCellModel *itemModel = itemsDataArr[i];
        CSHomeItemsCellItem *item = self.itemsArr[i];
        [item setModel:itemModel];
        [self.contentView addSubview:item];
    }
}

#pragma mark -- lazy

- (NSArray *)itemsArr{
    if(!_itemsArr){
        _itemsArr = @[self.item1,self.item2,self.item3];
    }
    return _itemsArr;
}
- (CSHomeItemsCellItem *)item1{
    if(!_item1){
        _item1 = [[CSHomeItemsCellItem alloc]init];
        _item1.frame = CGRectMake(10, 10, _item1.width, _item1.height);
    }
    return _item1;
}
- (CSHomeItemsCellItem *)item2{
    if(!_item2){
        _item2 = [[CSHomeItemsCellItem alloc]init];
        _item2.frame = CGRectMake(10 + (_item2.width + 11 ), 10, _item2.width, _item2.height);
    }
    return _item2;
}
- (CSHomeItemsCellItem *)item3{
    if(!_item3){
        _item3 = [[CSHomeItemsCellItem alloc]init];
        _item3.frame = CGRectMake(10 + 2 * (_item3.width + 11 ), 10, _item3.width, _item3.height);
    }
    return _item3;
}
@end
