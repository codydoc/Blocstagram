//
//  CollectionViewCell.m
//  Blocstagram
//
//  Created by Cody Rapp on 12/13/15.
//  Copyright © 2015 Bloc. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell


-(id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];

    if(self)
    {
        
            CGFloat thumbnailEdgeSize = 158.00;

        
            self.thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, thumbnailEdgeSize, thumbnailEdgeSize)];
            self.thumbnail.contentMode = UIViewContentModeScaleAspectFill;
            self.thumbnail.clipsToBounds = YES;
            
            [self.contentView addSubview:self.thumbnail];
        
        
        
            self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, thumbnailEdgeSize, thumbnailEdgeSize, 20)];
            self.label.textAlignment = NSTextAlignmentCenter;
            self.label.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10];
            [self.contentView addSubview:self.label];
        

        
    }
    
    return self;
}

@end
