//
//  BNMAvatarView.m
//  
//
//  Created by Laurent Gaches on 3/5/13.
//  Copyright (c) 2013 Binimo. All rights reserved.
//

#import "BNMAvatarView.h"
#import <QuartzCore/QuartzCore.h>
#include <math.h>


@implementation BNMAvatarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGRect bounds = [self bounds];

    bounds.size.height = bounds.size.width;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    CGFloat lineWidth = 4.0;
    
    float radius = (bounds.size.width/2.0) - 10.0;
    
    
    //Set circle color
    CGContextSetStrokeColorWithColor(ctx, self.circleColor.CGColor);
    
    // Draw Circle
    CGContextBeginPath(ctx);
    CGContextAddArc(ctx, center.x, center.y, radius, 0.0, M_PI * 2.0, YES);
    CGContextClosePath(ctx);
    CGContextClip(ctx);
    
    //Draw photo into the circle
    CGRect imageRect = CGRectMake(0.0f, 0.0f, bounds.size.width, bounds.size.height);
    CGContextTranslateCTM(ctx, 0, bounds.size.height);
    CGContextScaleCTM(ctx, 1.0f, -1.0f);
    CGContextDrawImage(ctx, imageRect, self.image.CGImage);
    
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextAddArc(ctx, center.x, center.y, radius, 0.0, M_PI * 2.0, YES);
    CGContextStrokePath(ctx);
   
    if (!self.onlyCircle) {
        
        CGContextRestoreGState(ctx);
        CGContextSetLineWidth(ctx, 2.0);
        
        CGFloat delta;
        CGFloat y;
        CGFloat b;
        CGFloat c;
        CGFloat a;
        
        if (self.favorite) {        
            delta = 30.0;
            y = center.y - delta ;
            b = center.y - y;
            c = radius;
            a = sqrt(pow(c,2.) - pow(b, 2));
            
            CGContextSetFillColorWithColor(ctx, self.favoriteColor.CGColor);
            CGContextAddEllipseInRect(ctx, CGRectMake(center.x + a, y,10.0, 10.0));
            CGContextFillPath(ctx);
        }
        
        if (self.categorie2) {
            delta = 40;
            y = center.y - delta;
            
            b = center.y - y;
            c = radius;
            a = sqrt(pow(c,2.) - pow(b, 2));
            CGContextSetFillColorWithColor(ctx, self.categorie2Color.CGColor);
            CGContextAddEllipseInRect(ctx, CGRectMake(center.x + a + 5, y - 1,10.0, 10.0));
            CGContextFillPath(ctx);
        }
        
        if (self.categorie) {
            delta = 36.0;
            y = center.y - delta;
            
            b = center.y - y;
            c = radius;
            a = sqrt(pow(c,2.) - pow(b, 2));
            CGContextSetFillColorWithColor(ctx, self.categorieColor.CGColor);
            CGContextAddEllipseInRect(ctx, CGRectMake(center.x + a, y - 1,10.0, 10.0));
            CGContextFillPath(ctx);
        }
    
       
        if (self.online) {
            delta = 23.0;
            y = center.y - delta;
            
            b = center.y - y;
            c = radius;
            a = sqrt(pow(c,2.) - pow(b, 2));
            CGContextSetFillColorWithColor(ctx, self.onlineColor.CGColor);
            CGContextAddEllipseInRect(ctx, CGRectMake(center.x + a - 1, y -1 ,10.0, 10.0));
            CGContextFillPath(ctx);
        }
        
        if (self.chat) {
            y = center.y -2;
            
            b = center.y - y;
            c = radius;
            a = sqrt(pow(c,2.) - pow(b, 2));
            
            UIImage *chatImage = [UIImage imageNamed:@"btn_avatar_chat.png"];
            [chatImage drawAtPoint:CGPointMake(center.x + a - 17 , center.y)];            
        }
  
        // Draw name property
        if (self.name && [self.name length] > 0) {
            CGContextSetFillColorWithColor(ctx, self.nameColor.CGColor);
            
            CGFloat fontSize = 13.0f;
            UIFont *nameFont = [UIFont fontWithName:@"Futura" size:fontSize];
            
            CGSize nameSize = [self.name sizeWithFont:nameFont forWidth:self.bounds.size.width lineBreakMode:UILineBreakModeTailTruncation];
            
            [self.name drawAtPoint:CGPointMake((self.bounds.size.width - nameSize.width)/2.0, bounds.size.height - nameSize.height + 8.0) forWidth:nameSize.width withFont:nameFont fontSize:fontSize lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignCenters];
        }
        
    }

}




@end
