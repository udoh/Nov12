//
//  MovieDetailWebViewController.m
//  MovieApp
//
//  Created by Udo Hoppenworth on 11/7/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "MovieDetailWebViewController.h"


@interface MovieDetailWebViewController ()

@property (nonatomic, weak) IBOutlet UIWebView *webView;

@end


@implementation MovieDetailWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.movie.link]];
}

@end
