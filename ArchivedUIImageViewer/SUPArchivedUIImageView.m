//
//  SUPArchivedUIImageView.m
//  ArchivedUIImageViewer
//
//  Created by Padraig O Cinneide on 9/10/2013.
//  Copyright (c) 2013 Padraig Kennedy. All rights reserved.
//

#import "SUPArchivedUIImageView.h"
#import "UIImage.h"

@interface SUPArchivedUIImageView()

@property (nonatomic) UIImage *fakeAssUIImage;

@end

@implementation SUPArchivedUIImageView

- (NSDragOperation)draggingEntered:(id < NSDraggingInfo >)sender
{
    return NSDragOperationCopy;
}

- (BOOL)performDragOperation:(id < NSDraggingInfo >)sender
{
    NSArray *pasteboardItems = [sender draggingPasteboard].pasteboardItems;
 
    
    __block BOOL foundSomething = NO;
    [pasteboardItems enumerateObjectsUsingBlock:^(NSPasteboardItem *item, NSUInteger idx, BOOL *stop) {
        NSString *filePath = [item    stringForType:(NSString *)kUTTypeFileURL];
        
        if (filePath) {
            NSData *imageFilePlistData = [NSData dataWithContentsOfURL:[NSURL URLWithString:filePath]];
            
            self.fakeAssUIImage = [NSKeyedUnarchiver unarchiveObjectWithData:imageFilePlistData];
            if (self.fakeAssUIImage) {
                self.image = self.fakeAssUIImage.actualImage;
                [self setNeedsDisplay];
                foundSomething = YES;
                *stop = YES;
            }
        }
    }];
    
    return foundSomething;
}

@end
