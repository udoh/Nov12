//
//  TableViewStyleLayout.m
//  CollectionViewExamples
//
//  Created by Andrew Poes on 3/3/13.
//  Copyright (c) 2013 Neon. All rights reserved.
//

#import "TableViewStyleLayout.h"


@implementation TableViewStyleLayout

- (id)init
{
    self = [super init];
    if (self) {
        
        self.minimumLineSpacing = 0.5f;
        self.minimumInteritemSpacing = 0.0f;
        self.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 7.0);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}

@end
