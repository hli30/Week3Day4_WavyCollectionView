//
//  WavyFlowLayout.m
//  WavyCollectionView
//
//  Created by Harry Li on 2017-06-15.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "WavyFlowLayout.h"

@interface WavyFlowLayout ()

@property (nonatomic) NSArray *layoutAttributes;

@end

@implementation WavyFlowLayout

- (void)prepareLayout{
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray<UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *attributes in superAttrs)
    {
        if (CGRectIntersectsRect(attributes.frame, rect) == YES)
        {
            float randY = arc4random_uniform(self.collectionView.frame.size.height - attributes.frame.size.height);
            
            attributes.frame = CGRectMake(attributes.frame.origin.x, randY, attributes.frame.size.width, attributes.frame.size.height);
            [newAttrs addObject:attributes];
        }
    }
    
    return newAttrs;
}

@end
