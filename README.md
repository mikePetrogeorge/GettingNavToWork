GettingNavToWork
================

This demo is a storyboard example using SWRevealViewController with a menu made up of UIButtons rather than a UITableView. I made this example because while the examples in the project were very good, They were mostly using .xib files. I needed a storyboard example. There was one storyboard example, however it was using a UITableView as the menu, I was needing UIButtons instead.

The license in the original project says your free to use it, "AS IS" WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. Same goes for this example. 

SWRevealViewController is a very light weight component that will give you an IOS menu via swipe gesture, or by pressing on an icon. You can find the original project here:

https://github.com/John-Lluch/SWRevealViewController

For this example however,

1) make sure you are running Xcode 5/IOS7. I did not put any new IOS7 features into this example, however the storyboard will not open in older versions of Xcode.


2) Download the project from the URL above.

3) Study that project, if you haven't already.

4) Copy SWRevealViewController.h, SWRevealViewController.m and RevealControllerStoryboardExample-Prefix.pch into your project. Make sure you place the .pch file under supporting file  folder in your project.

5) Go to your project build settings tab and under prefix header (found after APPLE LLVM 5.0 language and under) double click and enter the following NAME-OF-YOUR-APP/RevealControllerStoryboardExample-Prefix.pch If you fail to do this, you will run into compile drama.

6) Look at the storyboard example in the original project, and in this project to get a handle on how you would put together your flow path (seques).

Good luck

Mike Petrogeorge