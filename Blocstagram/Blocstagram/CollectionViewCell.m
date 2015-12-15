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
        
        UIImageView *thumbnail = (UIImageView *)[self.contentView viewWithTag:imageViewTag];
        
        UILabel *label = (UILabel *)[self.contentView viewWithTag:labelTag];
    
        
        CGFloat thumbnailEdgeSize = 158.00;
        
        if (!thumbnail) {
            thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, thumbnailEdgeSize, thumbnailEdgeSize)];
            thumbnail.contentMode = UIViewContentModeScaleAspectFill;
            thumbnail.tag = imageViewTag;
            thumbnail.clipsToBounds = YES;
            
            [self.contentView addSubview:thumbnail];
        }
        
        if (!label) {
            label = [[UILabel alloc] initWithFrame:CGRectMake(0, thumbnailEdgeSize, thumbnailEdgeSize, 20)];
            label.tag = labelTag;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10];
            [self.contentView addSubview:label];
        }
        
        //thumbnail.image = self.filterImages[indexPath.row];
        //label.text = self.filterTitles[indexPath.row];
        
    }
    
    return self;
}

@end
