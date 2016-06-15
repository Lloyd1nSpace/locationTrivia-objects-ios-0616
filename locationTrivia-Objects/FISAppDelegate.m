//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISLocation.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISLocation *locations = [FISLocation new];
    
    locations.name = @"";
    locations.longitude = 0;
    locations.latitude = 0;
    locations.trivia = [NSMutableArray new];
    
    return YES;
}

- (NSArray *)allLocationNames; {
    
    /* 1. Define the `allLocationNames` method to return an array of all of the `name` string properties of the `FISLocation` objects held in the `locations` array property.*/
    
    NSMutableArray *locationNames = [NSMutableArray new];
    
    for (FISLocation *locations in self.locations) {
        // Important to note I'm utilizing the custom FISLocation class, I had to first #import "FISLocation.h" in order for this to work.
        
        [locationNames addObject:locations.name];
        
    }
    
    return locationNames;
    
}

- (FISLocation *)locationNamed:(NSString *)name; {
    /* 2. Define the `locationNamed:` method to return a `FISLocation` object whose `name` string property matches the string submitted to the `name` argument. If there isn't a match, this method should return `nil`.
     **Hint:** *You can accomplish with either a* `for in` *loop &* `if` *statement, or by using* `NSPredicate`.*/
    
    for (FISLocation *locations in self.locations) {
        
        if ([locations.name isEqualToString:name]) {
            // Checking the NSString locations.name to see if it's equal to the argument string name.
            
            return locations;
            
        }
        
    }
    
    return nil;
    
}

- (NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin; {
    
    /* 3.	Define the `locationsNearLatitude:longitude:margin:` method to return an array of all the locations whose coordinates are within ±`margin` degrees from the given location. */
    
    NSMutableArray *locationsNearLatAndLong = [NSMutableArray new];
    
    for (FISLocation *locations in self.locations) {
        
        if (locations.latitude <= latitude + margin && locations.latitude >= latitude - margin && locations.longitude <= longitude + margin && locations.longitude >= longitude - margin) {
            // In order to find if the coordinates were +- margin degrees I had to literally do latitude / longitue + margin then "" "" - margin.
            
            [locationsNearLatAndLong addObject:locations];
            
        }
        
    }
    
    return locationsNearLatAndLong;
    
}

@end
