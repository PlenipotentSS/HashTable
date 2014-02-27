//
//  IntegerNode.h
//  HashTable
//
//  Created by Stevenson on 26/02/2014.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashNode : NSObject

@property (nonatomic) id data;
@property (nonatomic) NSString *key;
@property (nonatomic) HashNode *next;

@end
