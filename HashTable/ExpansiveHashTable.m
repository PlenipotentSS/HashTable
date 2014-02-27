//
//  ExpansiveHashTable.m
//  HashTable
//
//  Created by Stevenson on 26/02/2014.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "ExpansiveHashTable.h"
#import "HashNode.h"

@implementation ExpansiveHashTable

-(void)setObject:(id)obj forKey:(NSString *)key{
    if (self.count > .7*self.hashTable.count) {
        NSLog(@"resizing");
        [self doubleHashTable];
    }
    [super setObject:obj forKey:key];
}

-(void)doubleHashTable
{
    NSMutableArray *oldHashTable = [self.hashTable copy];
    int counter = 0;
    while (counter < oldHashTable.count) {
        [self.hashTable addObject:[HashNode new]];
        counter++;
    }
    for (int i=0; i<oldHashTable.count;i++) {
        self.hashTable[i] = [HashNode new];
    }
    for (int i=0; i<oldHashTable.count;i++) {
        HashNode *thisNode = [self.hashTable objectAtIndex:i];
        if (thisNode.data) {
            [self setObject:thisNode.data forKey:thisNode.key];
        }
    }
}

@end
