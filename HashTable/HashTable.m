//
//  HashTable.m
//  HashTable
//
//  Created by Stevenson on 26/02/2014.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "HashTable.h"
#import "HashNode.h"

@implementation HashTable

-initWithTableSize:(NSInteger) size
{
    self = [super init];
    if (self){
        self.size = size;
        self.hashTable = [NSMutableArray new];
        int counter = 0;
        while (counter < size) {
            [self.hashTable addObject:[HashNode new]];
            counter++;
        }
    }
    return self;
}

-(NSUInteger)hash:(NSString*) key
{
    NSUInteger hash = 193;
    
    for (int i = 0; i<=(key.length -1); i++)
    {
        int asc = [key characterAtIndex:i]-10;
        hash = (((hash << 6) + hash) + asc);
    }
    return hash%[self.hashTable count];
}

-(id)objectForKey:(NSString *) key
{
    NSUInteger index = [self hash:key];
    
    HashNode *bucket = self.hashTable[index];
    
    while ( bucket ) {
        if ([bucket.key isEqualToString:key]) {
            return bucket.data;
        }
        bucket = bucket.next;
    }
    return nil;
}

-(void)removeObjectForKey:(NSString*)key
{
    NSUInteger index = [self hash:key];
    HashNode *bucket = self.hashTable[index];
    HashNode *previous;
    
    while (bucket) {
        if ([bucket.key isEqualToString:key]){
            if (previous) {
                previous.next = bucket.next;
            } else {
                HashNode *next = bucket.next;
                self.hashTable[index] = next;
            }
            self.count--;
            break;
        }
        previous = bucket;
        bucket = bucket.next;
    }
    
}

-(void)setObject:(id)obj forKey:(NSString*) key
{
    HashNode *bucket = [HashNode new];
    NSUInteger index = [self hash:key];
    bucket.data = obj;
    bucket.key = key;
    
    bucket.next = self.hashTable[index];
    self.hashTable[index] = bucket;
    self.count++;
}

-(void)printHashTable
{
    for (int i=0; i<self.hashTable.count;i++) {
        HashNode *bucket = [self.hashTable objectAtIndex:i];
        if (bucket.next) {
            NSString *spacerArrow = @"->";
            NSString *spacer = @"";
            while(bucket) {
                if (bucket.data) {
                    NSLog(@"%i: %@%@",i,spacer,bucket.data);
                    spacer = [NSString stringWithFormat:@"%@%@",spacer,spacerArrow];
                }
                bucket = bucket.next;
            }
        } else if (bucket.data) {
            NSLog(@"%@",bucket.data);
        }
    }
}

@end
