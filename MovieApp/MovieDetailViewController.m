//
//  MovieDetailViewController.m
//  MovieApp
//
//  Created by Udo Hoppenworth on 11/7/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieDetailWebViewController.h"


@interface MovieDetailViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *yearLabel;
@property (nonatomic, weak) IBOutlet UILabel *directorLabel;
@property (nonatomic, weak) IBOutlet UILabel *ratingLabel;
@property (nonatomic, weak) IBOutlet UISwitch *favoriteSwitch;

@end


@implementation MovieDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Details" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self updateUI];
}

- (void)updateUI
{
    self.imageView.image = self.movie.image;
    self.titleLabel.text = self.movie.title;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.minimumScaleFactor = 0.7;
    self.directorLabel.text = self.movie.director;
    self.yearLabel.text = [NSString stringWithFormat:@"%d", self.movie.year];
    self.ratingLabel.text = [NSString stringWithFormat:@"%.1f", self.movie.rating];
    
    self.favoriteSwitch.on = self.movie.isFavorite;
}

- (IBAction)favoriteSwitchChanged:(UISwitch *)sender
{
    self.movie.favorite = sender.on;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowMovieWebView"]) {
        if ([segue.destinationViewController isKindOfClass:[MovieDetailWebViewController class]]) {
            MovieDetailWebViewController *mwvc = segue.destinationViewController;
            mwvc.movie = self.movie;
        }
    }
}

@end
