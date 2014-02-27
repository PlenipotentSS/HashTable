//
//  HashTable.h
//  HashTable
//
//  Created by Stevenson on 26/02/2014.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashTable : NSObject

///
@property (nonatomic)NSMutableArray* hashTable;

///
@property (nonatomic)NSUInteger count;

///
@property (nonatomic)NSInteger size;

-initWithTableSize:(NSInteger) size;

-(id)objectForKey:(NSString *) key;

-(void)removeObjectForKey:(NSString*)key;

-(void)setObject:(id)obj forKey:(NSString*) key;

-(void)printHashTable;

@end
