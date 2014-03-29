//
//  ViewController.h
//  JSONObject
//
//  Created by Leonard Schuetz on 29.03.14.
//  Copyright (c) 2014 Leonard Schuetz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSJSONObject.h"

@interface ViewController : UIViewController <LSJSONObjectDelegate>
@property (weak, nonatomic) IBOutlet UITextField *indexLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *opLabel;
@property (weak, nonatomic) IBOutlet UITextView *articleView;
- (IBAction)updateText:(id)sender;

@end
