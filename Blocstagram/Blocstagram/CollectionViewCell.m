//
//  CollectionViewCell.m
//  Blocstagram
//
//  Created by Cody Rapp on 12/13/15.
//  Copyright © 2015 Bloc. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell


-(id)init {
    
    self = [super init];

    if(self)
    {
    
        NSLog(@"You've initiatized subclass CollectionViewCell");
        
        static NSInteger imageViewTag = 1000;
        static NSInteger labelTag = 1001;
        
        self.thumbnail = (UIImageView *)[self.contentView viewWithTag:imageViewTag];
        
        self.label = (UILabel *)[self.contentView viewWithTag:labelTag];
    
        
        CGFloat thumbnailEdgeSize = 158.00;

        
            self.thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, thumbnailEdgeSize, thumbnailEdgeSize)];
            self.thumbnail.contentMode = UIViewContentModeScaleAspectFill;
            self.thumbnail.tag = imageViewTag;
            self.thumbnail.clipsToBounds = YES;
            
            [self.contentView addSubview:self.thumbnail];
        
        
        
            self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, thumbnailEdgeSize, thumbnailEdgeSize, 20)];
            self.label.tag = labelTag;
            self.label.textAlignment = NSTextAlignmentCenter;
            self.label.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10];
            [self.contentView addSubview:self.label];
        

        
    }
    
    return self;
}

@end
