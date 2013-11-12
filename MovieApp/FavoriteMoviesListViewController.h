//
//  FavoriteMoviesListViewController.h
//  MovieApp
//
//  Created by Udo Hoppenworth on 11/7/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FavoriteMoviesListViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *movies;

@end
