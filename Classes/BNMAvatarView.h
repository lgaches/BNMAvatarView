//
//  BNMAvatarView.h
//  
//
//  Created by Laurent Gaches on 3/5/13.
//  Copyright (c) 2013 Binimo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNMAvatarView : UIView

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIColor *nameColor;

@property (nonatomic, strong) UIColor *categorieColor;
@property (nonatomic) BOOL categorie;

@property (nonatomic, strong) UIColor *categorie2Color;
@property (nonatomic) BOOL categorie2;


@property (nonatomic,strong) UIColor *onlineColor;
@property (nonatomic) BOOL online;

@property (nonatomic, strong) UIColor *favoriteColor;
@property (nonatomic) BOOL favorite;

@property (nonatomic) BOOL chat;

@property (nonatomic) BOOL messages;


@property (nonatomic, strong) UIColor *circleColor;
@property (nonatomic) BOOL onlyCircle;

@end
