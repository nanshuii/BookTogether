//
//  RHTableViewCell.h
//  BookTogether
//
//  Created by 南水 on 2018/9/11.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHTableViewCell : UITableViewCell

+ (UINib *)nib;

+ (NSString*)myClassNameAsCellIdentifier;

- (void)bindDataWithModel:(id)model;

- (CGFloat)cellHeight;

@end
