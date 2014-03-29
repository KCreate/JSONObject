//
//  LSJSONObject.m
//  JSONObject
//
//  Created by Leonard Schuetz on 29.03.14.
//  Copyright (c) 2014 Leonard Schuetz. All rights reserved.
//

#import "LSJSONObject.h"

@implementation LSJSONObject {
    NSArray *jsonArray;
    NSMutableData *data;
    NSURLConnection *mainConnection;
}
@synthesize delegate;

- (id)initWithURL:(NSURL *)theURL
{
    NSURLRequest *request = [NSURLRequest requestWithURL:theURL];
    mainConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    return self;
}

- (id)objectAtIndex:(NSUInteger)theIndex forKey:(NSString *)theKey
{
    if ([jsonArray count] > theIndex) {
        return [[jsonArray objectAtIndex:theIndex] objectForKey:theKey];
    } else {
        return @"Not found";
    }
}

#pragma mark connection

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    data = [[NSMutableData alloc] init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData {
    [data appendData:theData];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    if ([delegate respondsToSelector:@selector(LSJSONObjectFinishedLoadingData)]) {
        [delegate LSJSONObjectFinishedLoadingData];
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Failed to parse JSON" message:@"Error" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    
    [errorView show];
}

@end
