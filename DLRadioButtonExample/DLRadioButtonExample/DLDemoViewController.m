#import "DLDemoViewController.h"
#import "DLRadioButton.h"

@implementation DLDemoViewController

#pragma mark - Helpers

- (IBAction)logSelectedButton:(DLRadioButton *)radiobutton {
    NSLog(@"%@ is selected.\n", radiobutton.selectedButton.titleLabel.text);
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // programmatically add buttons
    // first button
    DLRadioButton *firstRadioButton = [[DLRadioButton alloc] initWithFrame:CGRectMake(30, 350, self.view.frame.size.width - 60, 15)];
    firstRadioButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [firstRadioButton setTitle:@"Red Button" forState:UIControlStateNormal];
    [firstRadioButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    firstRadioButton.iconColor = [UIColor redColor];
    firstRadioButton.indicatorColor = [UIColor redColor];
    firstRadioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [firstRadioButton addTarget:self action:@selector(logSelectedButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:firstRadioButton];
    
    // other buttons
    NSArray *colorNames = @[@"Orange", @"Blue", @"Purple"];
    NSArray *buttonColors = @[[UIColor orangeColor], [UIColor blueColor], [UIColor purpleColor]];
    NSInteger i = 0;
    NSMutableArray *otherButtons = [NSMutableArray new];
    for (UIColor *buttonColor in buttonColors) {
        // customize button
        DLRadioButton *radioButton = [[DLRadioButton alloc] initWithFrame:CGRectMake(30, 380 + 30 * i, self.view.frame.size.width - 60, 15)];
        radioButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [radioButton setTitle:[colorNames[i] stringByAppendingString:@" Button"] forState:UIControlStateNormal];
        [radioButton setTitleColor:buttonColor forState:UIControlStateNormal];
        radioButton.iconColor = buttonColor;
        radioButton.indicatorColor = buttonColor;
        if (i % 2 == 0) {
            radioButton.isIconSquare = YES;
        }
        if (i > 0) {
            // put icon on the right side
            radioButton.isIconOnRight = YES;
            radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        } else {
            radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        }
        [otherButtons addObject:radioButton];
        [radioButton addTarget:self action:@selector(logSelectedButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:radioButton];
        i++;
    }
    
    firstRadioButton.otherButtons = otherButtons;
}

@end
