//
//  HomeViewController.m
//  MovieApp
//
//  Created by Udo Hoppenworth on 11/7/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "HomeViewController.h"
#import "Movie.h"
#import "TabBarController.h"


@implementation HomeViewController

- (NSMutableArray *)movies
{
    if (!_movies) {
        _movies = [[NSMutableArray alloc] init];
    }
    return _movies;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create array of movies
    NSString *path = [[NSBundle mainBundle] pathForResource:@"movies" ofType:@"csv"];
    NSString *moviesString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *moviesStrings = [moviesString componentsSeparatedByString:@"\r"];
    
    for (NSString *movieString in moviesStrings) {
        NSArray *movieArray = [movieString componentsSeparatedByString:@","];
        Movie *movie = [[Movie alloc] init];
        movie.title = movieArray[0];
        movie.link = [NSURL URLWithString:movieArray[1]];
        movie.director = movieArray[2];
        movie.year = [movieArray[3] intValue];
        movie.rating = [movieArray[4] floatValue];
        movie.image = [UIImage imageNamed:movieArray[5]];
        
        [self.movies addObject:movie];
    }
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:Nil action:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowMovies"]) {
        if ([segue.destinationViewController isKindOfClass:[TabBarController class]]) {
            TabBarController *tbc = segue.destinationViewController;
            tbc.movies = self.movies;
        }
    }
}

@end
