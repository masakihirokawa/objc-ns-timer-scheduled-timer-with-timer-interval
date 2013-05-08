//
//  ViewController.m
//  NSTimerScheduledTimerWithTimeInterval
//
//  Created by 廣川政樹 on 2013/05/08.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//アニメーションさせるラベル
@property UILabel *animationLabel;
//遅延実行タイマー
@property NSTimer *completedTimer;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  //遅延実行のタイマー定義
  [self setTimeInterval];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

//遅延実行のタイマー定義
- (void)setTimeInterval
{
  //2秒後にセレクタメソッドを実行する
  _completedTimer = [NSTimer scheduledTimerWithTimeInterval:2.0f
                                                     target:self
                                                   selector:@selector(onCompletedAnimationTimerEvent:)
                                                   userInfo:nil
                                                    repeats:NO];
}

//遅延実行のタイマーイベント
- (void)onCompletedAnimationTimerEvent:(id)sender
{
  [_completedTimer invalidate];
  [self initAnimationLabel];
  [self slideInAnimation];
}

//アニメーションさせるラベルを初期化
- (void)initAnimationLabel
{
  _animationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 568, 320, 568)];
  _animationLabel.backgroundColor = [UIColor blackColor];
  [self.view addSubview:_animationLabel];
}

//スライドインアニメーション
- (void)slideInAnimation
{
  //アニメーション開始
  [UIView beginAnimations:nil context:NULL];
  //アニメーション秒数
  [UIView setAnimationDuration:1.0f];
  //デリゲート指定
  [UIView setAnimationDelegate:self];
  //アニメーションの目標値を指定
  [_animationLabel setFrame:CGRectMake(0, 0, 320, 568)];
  //アニメーション実行
  [UIView commitAnimations];
}

@end
