//
//  YAAFirstAcceptanceTest.m
//  YetAnotherApp
//
//  Created by James Dunwoody on 21/04/2015.
//  Copyright (c) 2015 Odecee. All rights reserved.
//

#import <Specta.h>
#import <KIF.h>

SpecBegin(App)

describe(@"Tab controller", ^{
    
    it(@"should show second view when I tap on the second tab", ^{
        [tester tapViewWithAccessibilityLabel:@"Second" traits:UIAccessibilityTraitButton];
        [tester waitForViewWithAccessibilityLabel:@"Second View"];
    });
    
});

SpecEnd