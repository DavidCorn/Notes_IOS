//
//  Movie.h
//  Movies
//
//  Created by Qiyao Qin on 7/4/16.
//  Copyright © 2016 Thinkful. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MovieDelegate
-(void)updated;
-(void)receivedPosterImage:(UIImage *)posterImage;
-(void)receivedError:(NSString *)errorMessage;
-(void)receivedDownloadError;
@end

@interface Movie : NSObject<NSURLSessionDelegate>

@property (weak, nonatomic) id<MovieDelegate> delegate;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *actors;
@property (strong, nonatomic) NSString *plot;

-(void)searchMovie:(NSString *)movie;

@end