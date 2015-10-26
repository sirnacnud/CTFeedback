//
//  CTFeedbackImagePreviewViewController.m
//
//  Created by Duncan Cunningham on 10/26/15.
//
//

#import "CTFeedbackImagePreviewViewController.h"

#import "NSBundle+CTFeedback.h"

@interface CTFeedbackImagePreviewViewController ()

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CTFeedbackImagePreviewViewController

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    
    if (self) {
        _image = image;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.imageView = [[UIImageView alloc] init];
    [self.imageView setImage:self.image];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    self.imageView.frame = self.view.bounds;
    [self.view addSubview:self.imageView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(toggleNavigationBar:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:CTFBLocalizedString(@"Use Photo")
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(didSelectImage)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)toggleNavigationBar:(UITapGestureRecognizer *)tapGestureRecognizer {
    BOOL isHidden = [self.navigationController isNavigationBarHidden];
    [self.navigationController setNavigationBarHidden:!isHidden animated:YES];
}

- (void)didSelectImage {
    if (self.delegate) {
        [self.delegate imagePreviewController:self didSelectImage:self.image];
    }
}

@end
