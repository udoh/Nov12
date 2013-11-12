//
//  MovieListViewController.m
//  MovieApp
//
//  Created by Udo Hoppenworth on 11/7/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "MovieListViewController.h"
#import "TableViewStyleLayout.h"
#import "MovieListCell.h"
#import "MovieDetailViewController.h"


@implementation MovieListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    TableViewStyleLayout *tableViewStyleLayout = [[TableViewStyleLayout alloc] init];
    
    [self.collectionView setCollectionViewLayout:tableViewStyleLayout];
    [self.collectionView setContentOffset:CGPointZero];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.title = @"Movie Database";
}

#pragma mark - UICollectionView Datasouce

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.movies count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MovieListCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    Movie *movie = self.movies[indexPath.row];
    //[cell.titleLabel setTitle:movie.title forState:UIControlStateNormal]; // = movie.title;
    cell.titleLabel.text = movie.title;
    cell.titleLabel.adjustsFontSizeToFitWidth = YES;
    cell.titleLabel.minimumScaleFactor = 0.7;
    cell.yearLabel.text = [NSString stringWithFormat:@"%d", movie.year];
    cell.thumbnailImageView.image = movie.image;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowMovieDetails"]) {
        if ([segue.destinationViewController isKindOfClass:[MovieDetailViewController class]]) {
            
            // Get the IndexPath of the selected cell
            NSIndexPath *path = [[self.collectionView indexPathsForSelectedItems] firstObject];
            
            // Pass selected movie to MovieDetailViewController
            MovieDetailViewController *mdvc = segue.destinationViewController;
            mdvc.movie = self.movies[path.row];
        }
    }
}

@end
