//
//  Movie.m
//  Movies
//
//  Created by Qiyao Qin on 7/4/16.
//  Copyright © 2016 Thinkful. All rights reserved.
//


#import "Movie.h"
#import "AFNetworking.h"

@implementation Movie

//init Note - coordinate defaults to 0,0 initially
-(void)searchMovie:(NSString *)movie {
    NSString *omdbSearchURL = [NSString stringWithFormat:@"http://www.omdbapi.com/?t=%@", movie];
    omdbSearchURL = [omdbSearchURL stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:omdbSearchURL parameters:nil success:^(AFHTTPRequestOperation *operation, id json) {
        if (![json[@"Response"] boolValue]) {
            [self.delegate receivedError:json[@"Error"]];
        } else {
            self.title = json[@"Title"];
            self.actors = json[@"Actors"];
            self.plot = json[@"Plot"];
            self.posterURL = json[@"Poster"];
            
            [self.delegate updated];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self.delegate receivedError:error.localizedDescription];
    }];
}
-(void)downloadMoviePoster:(NSString *)posterURL {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:posterURL] completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate receivedDownloadError];
            });
        } else {
            NSData *data = [NSData dataWithContentsOfURL:location];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate receivedPosterImage:[UIImage imageWithData:data]];
            });
        }
    }];
    [downloadTask resume];
}

@end