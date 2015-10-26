//
//  CTFeedbackImagePreviewViewController.h
//
//  Created by Duncan Cunningham on 10/26/15.
//
//

#import <UIKit/UIKit.h>

@class CTFeedbackImagePreviewViewController;

@protocol CTFeedbackImagePreviewDelegate <NSObject>

- (void)imagePreviewController:(CTFeedbackImagePreviewViewController *)previewer didSelectImage:(UIImage *)image;

@end

@interface CTFeedbackImagePreviewViewController : UIViewController

@property (nonatomic, weak) id<CTFeedbackImagePreviewDelegate> delegate;

- (instancetype)initWithImage:(UIImage *)image;

@end
