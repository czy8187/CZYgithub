//
//  CTView.m
//  CoreTextMagazine
//
//  Created by 陈智洋 on 13-4-8.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import "CTView.h"

@implementation CTView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //将context给翻转一下
//    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
//    CGContextTranslateCTM(context, 0, self.bounds.size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
    
    //①我们创建了一个CGPath，来做完绘制文字的区域。Core Text在Mac下支持不同的形状比如矩形、环形，但是在iOS里只支持矩形。在这个示例中，我们用整个屏幕来做完显示区域，所以通过self.bounds来创建一个CGPath
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    //②在Core Text我们要渲染的文字不是用NSString而是用NSAttributedString。 NSAttributedString是非常强力的类，它允许你对文字设置不同的样式。然而暂时我们还用不到这些，现在仅仅通过纯文本创建一个NSAttributedString。
    NSAttributedString *attString = [[[NSAttributedString alloc] initWithString:@"Hello Core Text World~"] autorelease];
    
    //③CTFramesetter是Core Text中非常重要的一个类。 它管理了你的字体和文本渲染块(CTFrame). 暂时你需要知道的是CTFramesetterCreateWithAttributedString 会通过一个NSAttributedString创建一个 CTFramesetter。下面通过刚刚创建的framesetter来创建一个frame, CTFramesetterCreateFrame的参数分别是：一个framesetter、将显示的文字的range（这里我们使用这个文字长度）、文本将要显示的区域（刚刚创建的CGPath）
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, [attString length]), path, NULL);
    
    //④CTFrameDraw在给定context里面绘制frame。
    CTFrameDraw(frame, context);
    
    //⑤最后别忘记清理资源
    CFRelease(frame);
    CFRelease(path);
    CFRelease(frameSetter);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
