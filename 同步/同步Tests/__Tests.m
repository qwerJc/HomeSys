//
//  __Tests.m
//  同步Tests
//
//  Created by 贾辰 on 18/7/8.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface __Tests : XCTestCase
@property (nonatomic, strong) ViewController *vc;
@end

@implementation __Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vc = [[ViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.vc = nil;
    
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSInteger result1 = [self.vc getMaxValue:[NSArray arrayWithObjects:@"1",@"5",@"-1",@"3",@"7", nil]];
    XCTAssertEqual(result1, -1);
    NSInteger result2 = [self.vc getMaxValue:[NSArray arrayWithObjects:@"1",@"-55",@"-10",@"3",@"-55", nil]];
    XCTAssertEqual(result2, -55);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        for (int i = 0;i<100;i++){
            NSLog(@"wer");
        }
        // Put the code you want to measure the time of here.
    }];
}

@end
