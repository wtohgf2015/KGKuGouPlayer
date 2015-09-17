//
//  KGHomePageMusicTableViewCell.h
//  KGKuGouPlayer
//
//  Created by hegf on 15/9/17.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KGMusicCellStatus.h"

@interface KGHomePageMusicTableViewCell : UITableViewCell

@property (strong, nonatomic) KGMusicCellStatus* status;

+(instancetype)homePageMusicTableViewCellWithTableView:(UITableView*)tableView;

@end
