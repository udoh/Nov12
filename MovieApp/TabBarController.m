//
//  TabBarController.m
//  MovieApp
//
//  Created by Udo Hoppenworth on 11/11/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "TabBarController.h"
#import "Movie.h"
#import "MovieListViewController.h"
#import "FavoriteMoviesListViewController.h"


@implementation TabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"List" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    MovieListViewController *mlvc = [self.viewControllers firstObject];
    FavoriteMoviesListViewController *fmvc = [self.viewControllers lastObject];
    
    mlvc.movies = self.movies;
    fmvc.movies = self.movies;
}

@end
