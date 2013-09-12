//
//  GreenVC.m
//  GettingNavToWork
//
//  Created by Mike Petrogeorge on 9/9/13.
//  Copyright (c) 2013 Mike Petrogeorge
//
/*
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */


#import "GreenVC.h"

@interface GreenVC ()

@end

@implementation GreenVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    
    //early version of xcode5 would default the navaigation item
    // on the right and I could not figure out how to get it to the left.
    // I can't see the navigation item on the story board drawing to move
    // it from right to left, so I did it in code.
    // perhaps a bug that can be fixed someday? if so,
    // you might want to remove that when it/if that happens.
    
    self.navigationItem.leftBarButtonItem =_revealButtonItem;
    self.navigationItem.rightBarButtonItem = nil;
    
    // there are times where you need to pass variables to different views
    // Normal channels call for passing it through prepare for seque.
    // however, in this example prepare for seque is only available on
    // the menu view controller. So, we put the passing variable into the
    // app delegate then call our action top bring up the menu
    // on the prepareforseque method in MenuViewController, it will get
    // the variable out of the app delegate and pass it on to the next view
    
    //_passingVariable = @"will get this from view did load.";
    
    // we tell revealButtonItem that when pressed perform doBrinUpMenu
    // where it puts the passed variable into the app delegate, then
    // calls the code to move the view to the side and show the menu.
    [self.revealButtonItem setTarget:self];
    [self.revealButtonItem setAction:@selector(doBrinUpMenu:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"loading Green -> %@", self.passingVariable);
    self.passingVariable = @"comming from green";
}

- (void) doBrinUpMenu:(id)sender;
{
    NSLog(@"do bring up menu -> green");
    // ge the app delegate and pass in the variable
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    appDelegate.passingVariable = _passingVariable;
    
    // call the code that slides the menu.
    [[self revealViewController] revealToggle:self.revealButtonItem];
}



- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    
    // configure the segue.
    // in this case we dont swap out the front view controller, which is a UINavigationController.
    // but we could..
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] )
    {
        SWRevealViewControllerSegue* rvcs = (SWRevealViewControllerSegue*) segue;
        
        SWRevealViewController* rvc = self.revealViewController;
        NSAssert( rvc != nil, @"oops! must have a revealViewController" );
        
        NSAssert( [rvc.frontViewController isKindOfClass: [UINavigationController class]], @"oops!  for this segue we want a permanent navigation controller in the front!" );
        
        rvcs.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            //            UINavigationController* nc = (UINavigationController*)rvc.frontViewController;
            //            [nc setViewControllers: @[ dvc ] animated: NO ];
            //            [rvc setFrontViewPosition: FrontViewPositionLeft animated: YES];
            
            UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:dvc];
            [rvc setFrontViewController:nc animated:YES];
        };
    }
}



@end
