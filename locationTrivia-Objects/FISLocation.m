//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Lloyd W. Sykes on 6/14/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"
#import "FISTrivium.h"

@implementation FISLocation

- (instancetype)init; {
    
    self = [self initWithName:@"" latitude:0.0 longitude:0.0];
    
    return self;
    
}

- (instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude; {
    
    self = [super init];
    
    if (self) {
        
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [NSMutableArray new];
        
    }
    
    return self;
}

- (NSString *)stringByTruncatingNameToLength:(NSUInteger)length; {
    
    /* 1. Define the `stringByTruncatingNameToLength:` method to return a substring of the location's name shortened to the number of characters defined by the `length` argument. This method should handle a `length` argument integer that exceeds the length of the location's `name` string; in such a case, it should just return the location's whole name.
     **Hint:** `NSString` *has a handy method called* `substringToIndex`.
     
     */
    
    NSString *locationNameLength;
    
    if ([self.name length] >= length) {
        
        locationNameLength = [self.name substringToIndex:length];
        
    } else {
        
        locationNameLength = self.name;
        // By utilizing an if & chaining an else statement, this fulfills both of the conditions. I was struggling with getting self.name to print when the length was longer than the argument.
        
    }
    
    return locationNameLength;
    
}

- (BOOL)hasValidData; {
    
    /* 2. Define the `hasValidData` method to:
     * return `NO` if the `name` property is an empty string or `nil`,
     * return `NO` if the `latitude` property is beyond `-90.0` and `90.0`,
     * return `NO` if the `longitude` property is beyond `-180.0` and `180.0` or if it is equal to `-180.0` (since this longitude conceptually matches the 180º meridian), and
     * otherwise return `YES`.
     */
    
    BOOL validData = 1;
    
    if ([self.name isEqualToString:@""] || self.name == nil || self.latitude >= 90.0 || self.latitude <= -90.0 || self.longitude > 180.0 || self.longitude <= -180.0) {
        // Originally wrote this out in separate if statements to return TRUE. However, the tests are explicitly looking for the opposite so I set validData = 1 to start & then was able to condense the if statements once I confirmed they were working.
        
        validData = 0;
        
    }
    
    return validData;
    
}
- (FISTrivium *)triviumWithMostLikes; {
    
    /* 3. Define the `triviumWithMostLikes` method to:
     * return `nil` if the `trivia` array is empty, otherwise
     * return the `FISTrivium` object in the `trivia` array that has the highest value for the `likes` property.
     **Hint:** *You can accomplish this with either a* `for in` *loop &  an* `if` *statement, or by using* `NSSortDescriptor`.
     */
    
    if ([self.trivia isEqualToArray:@[]]) {
        
        return nil;
        
    }
    
    NSSortDescriptor *sortTrivia = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
    // Note that you don't want the data to be ascending, otherwise it would show the trivium with the LEAST amount of likes.
    
    [self.trivia sortUsingDescriptors:@[sortTrivia]];
    
    return self.trivia[0];
    
}

@end
