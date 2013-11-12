//
//  FavoriteMoviesListViewController.m
//  MovieApp
//
//  Created by Udo Hoppenworth on 11/7/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "FavoriteMoviesListViewController.h"
#import "Movie.h"
#import "FavoriteMovieCell.h"
#import "TableViewStyleLayout.h"
#import "CoverFlowStyleLayout.h"


@interface FavoriteMoviesListViewController ()

@property (nonatomic, weak) IBOutlet UILabel *emptyLabel;
@property (nonatomic, strong) NSArray *favoriteMovies;

@end


@implementation FavoriteMoviesListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CoverFlowStyleLayout *coverFlowStyleLayout = [[CoverFlowStyleLayout alloc] init];
    
    [self.collectionView setCollectionViewLayout:coverFlowStyleLayout animated:NO];
    [self.collectionView setContentOffset:CGPointZero animated:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.title = @"Your Favorites";
    
    // Filter the array to only show favorites
    NSPredicate *favoritePredicate = [NSPredicate predicateWithFormat:@"SELF.favorite == YES"];
    self.favoriteMovies = [self.movies filteredArrayUsingPredicate:favoritePredicate];
    
    // Reload the collectionView to refresh
    [self.collectionView reloadData];
    
    if ([self.favoriteMovies count] > 0) {
        self.emptyLabel.hidden = YES;
    } else {
        self.emptyLabel.hidden = NO;
    }
}

#pragma mark - UICollectionView Datasouce

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.favoriteMovies count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FavoriteMovieCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FavoriteMovieCell" forIndexPath:indexPath];
    Movie *movie = self.favoriteMovies[indexPath.row];
    cell.thumbnailImageView.image = movie.image;
    return cell;
}

@end
