//
//  UIImage.m
//  ArchivedUIImageViewer
//
//  Created by Padraig O Cinneide on 9/10/2013.
//  Copyright (c) 2013 Padraig Kennedy. All rights reserved.
//

#import "UIImage.h"

@implementation UIImage
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        _actualImage = [[NSImage alloc] initWithData:[aDecoder decodeObjectForKey:@"UIImageData"]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}
@end
