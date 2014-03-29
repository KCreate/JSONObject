//
//  ViewController.m
//  JSONObject
//
//  Created by Leonard Schuetz on 29.03.14.
//  Copyright (c) 2014 Leonard Schuetz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    LSJSONObject *jsonObject;
    NSString *defaultURL;
}
@synthesize indexLabel, titleLabel, opLabel, articleView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    defaultURL = @"http://leonardschuetz.ch/Data/json_test/data.php"; //Replace this URL with your servers path for the php file that echos the json file
    jsonObject = [[LSJSONObject alloc] initWithURL:[NSURL URLWithString:defaultURL]]; //init with the url given above
    jsonObject.delegate = self;
    /*
     Unless your server answers in a nanosecond you have to make all the data stuff in the delegate method LSJSONObjectFinishedLoadingData
    */
}

- (void)updateText:(id)sender {
    titleLabel.text = [jsonObject objectAtIndex:[indexLabel.text integerValue] forKey:@"title"];
    opLabel.text = [jsonObject objectAtIndex:[indexLabel.text integerValue] forKey:@"op"];
    articleView.text = [jsonObject objectAtIndex:[indexLabel.text integerValue] forKey:@"article"];
    [self.view endEditing:YES];
}

@end
