//
//  JXBgView.h
//  JXRotateView
//
//  Created by yuezuo on 16/5/9.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXBgView : UIView
/** 旋转个数 */
@property (nonatomic,assign) NSInteger bgCount;
/** 旋转持续时间 */
@property (nonatomic,assign) CGFloat bgTime;
/** 旋转颜色 */
@property (nonatomic,strong) UIColor * bgColor;
@end
