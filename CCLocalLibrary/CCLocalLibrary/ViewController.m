//
//  ViewController.m
//  CCLocalLibrary
//
//  Created by 冯明庆 on 25/05/2017.
//  Copyright © 2017 冯明庆. All rights reserved.
//

#import "ViewController.h"

//#import "CCCommonViewTools.h"
//#import "CCCommonDataTools.h"

//#import "CCCommonTools.h"

//#import <CCLocalLib/NSString+CCExtension.h>
//#import "NSString+CCExtension.h"

//#import "NSObject+CCProtocol.h"
//#import "UIView+CCChain.h"

//#import "UIGestureRecognizer+CCChain.h"

#import "UIViewController+CCExtension.h"
#import "CCTestViewController.h"

#import "UIImage+CCExtension.h"
#import "UIView+CCExtension.h"
#import "UITextField+CCExtension.h"
#import "NSString+CCExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [CC_IMAGE_NAME(@"0ZG63407-0") cc_gaussian_acc];
    UIImageView *imageView = [UIImageView cc_common:CGRectZero];
    imageView.image = image;
    imageView.y = 80;
    imageView.size = [image cc_zoom:0.5];
    [self.view addSubview:imageView];
    /*
    imageView.tap(^(UIView *v, UITapGestureRecognizer *gr) {
        
    });
    
    CCLog(@"1".append(@"2").appendPath(@"3"));
    UIView *v = UIView.common(CCRectMake(0, 500, 100, 100)).color(UIColor.blackColor).tap(^(UIView *v, UITapGestureRecognizer *gr) {
        self.view.cc.hud().message(@"SHOWING").hide();
    });
    self.view.cc.addSub(v);
    
//    self.view.cc.hud().message(@"SHOWING").type(CCHudChainTypeDarkDeep);
     */
    
    UITextField *t = [UITextField cc_common:CGRectMake(0, 0, 100, 100)];
    t.placeholder = @"123456789";
    [self.view cc_add:[[t cc_left:.0f] cc_top:400.f]];
    [t cc_text_did_change:^(__kindof UITextField *sender) {
        NSLog(@"%@",sender.text);
    }];
    [t cc_text_shared_event:UIControlEventEditingDidBegin | UIControlEventEditingDidEndOnExit | UIControlEventEditingChanged action:^(__kindof UITextField *sender) {
        NSLog(@"editing did begin / end ----- %@" , sender.text);
    }];
//    [t ccRemoveEvent:UIControlEventEditingChanged];
    UIImageView *v = nil;
    v.image = CC_IMAGE_MODULE_B(@"", @"0ZG63407-0");
}

+ (void) ts {

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CCTestViewController *c = [[CCTestViewController alloc] init];
    c.view.backgroundColor = UIColor.cyanColor;
    [self cc_present:c complete:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
