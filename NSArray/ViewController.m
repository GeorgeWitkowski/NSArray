//
//  ViewController.m
//  NSArray
//
//  Created by George on 12.04.2018.
//  Copyright © 2018 George Witkowski. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  Create NSArray, containing several strings, using literal declaration.
    NSArray* arrayWithStrings = @[@"smth1", @"smth2", @"smth3"];
    
    //  Create mutable array from previously created NSArray.
    NSMutableArray* mutableArrayWithStrings = [[NSMutableArray alloc]
                                               initWithArray:arrayWithStrings];
    
    //  Create an empty array and obtain its first and last element in a safe way.
    NSArray* emptyArray = [NSArray array];
    NSLog (@"%@", [emptyArray firstObject]);
    NSLog (@"%@", [emptyArray lastObject]);
    
    //  Create NSArray, containing strings from 1 to 20:
    NSArray* arrayWith20Strings = [NSArray arrayWithObjects: @"a1", @"a2", @"a3", @"a4", @"a5",
                                                             @"a6", @"a7", @"a8", @"a9", @"a10",
                                                             @"a11", @"a12", @"a13", @"a14", @"a15",
                                                             @"a16", @"a17", @"a18", @"a19", @"a20", nil];
    
    //  Get its shallow copy
    NSArray* array20ShallowCopy = [arrayWith20Strings copyWithZone:nil];
    
    //  and real deep copy.
    NSArray* array20DeepCopy = [NSKeyedUnarchiver unarchiveObjectWithData:
                               [NSKeyedArchiver archivedDataWithRootObject:arrayWith20Strings]];
    
    //  Iterate over array and obtain item at index 13. Print an item.
    for (int i=0; i < [arrayWith20Strings count]; i++) {
        if (i == 13) {
            NSLog(@"The 13-th element is %@", arrayWith20Strings[i]);
        }
    }
    
    //  Make array mutable.
    NSMutableArray* array20Mutable = [[NSMutableArray alloc] initWithArray:arrayWith20Strings];
    
    //  Add two new entries to the end of the array, add an entry to the beginning of the array.
    [array20Mutable addObject:@"addedOne"];
    [array20Mutable addObject:@"addedTwo"];
    
    //  add an entry to the beginning of the array.
    [array20Mutable insertObject:@"InsertedOne" atIndex:0];
    NSLog(@"Added entries: %@", [array20Mutable componentsJoinedByString:@"|"]);

    //Iterate over an array and remove item at index 5.
    for (int i=0; i < [array20Mutable count]; i++) {
        if (i == 5){
             [array20Mutable removeObjectAtIndex:i];
        }
    }
    NSLog(@"Added entries: %@", [array20Mutable componentsJoinedByString:@"|"]);
    //  Create new array of mixed numbers. Sort it in an ascending and descending order.
    NSArray* arrayWithMixedNumbers = @[@5, @9, @3, @7, @6];
    
    //  Sort it in an ascending order.
    arrayWithMixedNumbers = [arrayWithMixedNumbers sortedArrayUsingComparator:
                                        ^NSComparisonResult(id obj1, id obj2) {
                                            return [obj1 compare:obj2];
    }];
    NSLog(@"Ascending order: %@", [arrayWithMixedNumbers componentsJoinedByString:@"|"]);
    
    //  Sort it in a descending order.
    arrayWithMixedNumbers = [arrayWithMixedNumbers sortedArrayUsingComparator:
                                        ^NSComparisonResult(id obj1, id obj2) {
                                            return [obj2 compare:obj1];
    }];
    NSLog(@"Descending order: %@", [arrayWithMixedNumbers componentsJoinedByString:@"|"]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
