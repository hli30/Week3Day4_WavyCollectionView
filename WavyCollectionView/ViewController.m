//
//  ViewController.m
//  WavyCollectionView
//
//  Created by Harry Li on 2017-06-15.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "ViewController.h"
#import "WavyFlowLayout.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WavyFlowLayout *flowLayout = [[WavyFlowLayout alloc]init];
    self.collectionView.collectionViewLayout = flowLayout;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *label = (UILabel*)[cell viewWithTag:100];
    label.text = [NSString stringWithFormat:@"cell :%ld", (long)indexPath.item];
    
    return cell;
}



@end
