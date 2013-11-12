//
//  MovieListCell.h
//  MovieApp
//
//  Created by Udo Hoppenworth on 11/11/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MovieListCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;

@end
