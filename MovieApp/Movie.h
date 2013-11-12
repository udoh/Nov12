//
//  Movie.h
//  MovieApp
//
//  Created by Udo Hoppenworth on 11/7/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Movie : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *director;
@property (strong, nonatomic) NSURL *link;
@property (strong, nonatomic) UIImage *image;
@property (nonatomic) int year;
@property (nonatomic) float rating;
@property (nonatomic, getter = isFavorite) BOOL favorite;

@end
