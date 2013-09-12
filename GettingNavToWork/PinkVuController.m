//
//  PinkVuController.m
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


#import "PinkVuController.h"

@interface PinkVuController ()

@end

@implementation PinkVuController

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
    
    // there are times where you need to pass variables to different views
    // Normal channels call for passing it through prepare for seque.
    // however, in this example prepare for seque is only available on
    // the menu view controller. So, we put the passing variable into the
    // app delegate then call our action top bring up the menu
    // on the prepareforseque method in MenuViewController, it will get
    // the variable out of the app delegate and pass it on to the next view
    
    
    // _passingVariable = @"We will set this up in viewWillAppear"
    
    // we tell revealButtonItem that when pressed perform doBrinUpMenu
    // where it puts the passed variable into the app delegate, then
    // calls the code to move the view to the side and show the menu.
    
    [self.revealButtonItem setTarget:self];
    [self.revealButtonItem setAction:@selector(doBrinUpMenu:)];
  
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"loading pink %@", self.passingVariable);
    self.passingVariable = @"Comming from Pink";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) doBrinUpMenu:(id)sender;
{
    NSLog(@"do bring up menu  ->> pink");
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    appDelegate.passingVariable = _passingVariable;

    [[self revealViewController] revealToggle:self.revealButtonItem];
}



@end
