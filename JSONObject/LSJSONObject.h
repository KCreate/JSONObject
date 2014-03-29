//
//  LSJSONObject.h
//  JSONObject
//
//  Created by Leonard Schuetz on 29.03.14.
//  Copyright (c) 2014 Leonard Schuetz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LSJSONObject;
@protocol LSJSONObjectDelegate
@optional
-(void)LSJSONObjectFinishedLoadingData;
@end

@interface LSJSONObject : NSObject <NSURLConnectionDelegate>

-(id)initWithURL:(NSURL *)theURL;
-(id)objectAtIndex:(NSUInteger)theIndex forKey:(NSString *)theKey;

@property (nonatomic, assign) id delegate;

@end
