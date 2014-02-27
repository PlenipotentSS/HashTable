//
//  ViewController.m
//  HashTable
//
//  Created by Stevenson on 26/02/2014.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "ViewController.h"
#import "ExpansiveHashTable.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    ExpansiveHashTable *table = [[ExpansiveHashTable alloc] initWithTableSize:100];
    
    for (int i = 0; i <500;i++)
    {
        NSString *key = [NSString stringWithFormat:@"key %d",i];
        [table setObject:[NSString stringWithFormat:@"Poodle %d",i] forKey:key];
    }
    [table printHashTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
