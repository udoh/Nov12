//
//  Movie.m
//  MovieApp
//
//  Created by Udo Hoppenworth on 11/7/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "Movie.h"


@implementation Movie

- (id)init
{
    self = [super init];
    if (self) {
        _favorite = NO;
    }
    return self;
}

@end
