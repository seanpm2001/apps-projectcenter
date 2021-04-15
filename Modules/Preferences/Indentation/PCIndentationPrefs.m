// 
// GNUstep ProjectCenter - http://www.gnustep.org/experience/ProjectCenter.html
//
// Copyright (C) 2021 Free Software Foundation
//
// Authors: Gregory Casamento
//
// Description: 
//
// This file is part of GNUstep.
//
// This application is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License as published by the Free Software Foundation; either
// version 2 of the License, or (at your option) any later version.
//
// This application is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Library General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this library; if not, write to the Free
// Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111 USA.
//
/* All rights reserved */

#import <AppKit/AppKit.h>
#import "PCIndentationPrefs.h"

@implementation PCIndentationPrefs

- (id)initWithPrefController:(id <PCPreferences>)aPrefs
{
  self = [super init];

  if ([NSBundle loadNibNamed:@"IndentationPrefs" owner:self] == NO)
    {
      NSLog(@"PCIndentationPrefs: error loading NIB file!");
    }

  prefs = aPrefs;
  RETAIN(_view);

  return self;
}

- (void) dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver: self];
  RELEASE(_view);
  [super dealloc];
}

- (void) readPreferences
{
  NSString *val;
  BOOL     bVal;
  int      state;
  NSString *spacesDefault = @"2";
  
  bVal = [prefs boolForKey: IndentWhenTyping
              defaultValue: YES];
  state = bVal ? NSOnState : NSOffState;
  [_indentWhenTyping setState:state];

  bVal = [prefs boolForKey: IndentForOpenCurly
              defaultValue: YES];
  state = bVal ? NSOnState : NSOffState;
  [_indentForOpenCurly setState:state];

  bVal = [prefs boolForKey: IndentForCloseCurly
              defaultValue: YES];
  state = bVal ? NSOnState : NSOffState;
  [_indentForCloseCurly setState: state];
     
  bVal = [prefs boolForKey: IndentForSemicolon
              defaultValue: NO];
  state = bVal ? NSOnState : NSOffState;
  [_indentForSemicolon setState: state];

  bVal = [prefs boolForKey: IndentForColon
              defaultValue: NO];
  state = bVal ? NSOnState : NSOffState;
  [_indentForColon setState: state];

  bVal = [prefs boolForKey: IndentForHash
              defaultValue: NO];
  state = bVal ? NSOnState : NSOffState;
  [_indentForHash setState: state];

  bVal = [prefs boolForKey: IndentForReturn
              defaultValue: NO];
  state = bVal ? NSOnState : NSOffState;
  [_indentForReturn setState: state];

  bVal = [prefs boolForKey:IndentForColon
              defaultValue:NO];
  state = bVal ? NSOnState : NSOffState;
  [_indentForColon setState:state];

  bVal = [prefs boolForKey: IndentForSoloOpenCurly
              defaultValue: NO];
  state = bVal ? NSOnState : NSOffState;
  [_indentForSoloOpenCurly setState: state];

  val = [prefs stringForKey: IndentForNumberOfSpaces
               defaultValue: spacesDefault];
  if (val)
    {
      [_indentNumberOfSpaces setStringValue: val];
    }
}

- (void) setIndentWhenTyping: (id)sender
{
  BOOL state = ([sender state] == NSOffState) ? NO : YES;
  [prefs setBool: state forKey: IndentWhenTyping notify: YES];
}


- (void) setIndentForOpenCurlyBrace: (id)sender
{
  BOOL state = ([sender state] == NSOffState) ? NO : YES;
  [prefs setBool: state forKey: IndentForOpenCurly notify: YES];
}


- (void) setIndentForCloseCurlyBrace: (id)sender
{
  BOOL state = ([sender state] == NSOffState) ? NO : YES;
  [prefs setBool: state forKey: IndentForCloseCurly notify: YES];
}


- (void) setIndentForSemicolon: (id)sender
{
  BOOL state = ([sender state] == NSOffState) ? NO : YES;
  [prefs setBool: state forKey: IndentForSemicolon notify: YES];
}


- (void) setIndentForColon: (id)sender
{
  BOOL state = ([sender state] == NSOffState) ? NO : YES;
  [prefs setBool: state forKey: IndentForColon notify: YES];
}


- (void) setIndentForHash: (id)sender
{
  BOOL state = ([sender state] == NSOffState) ? NO : YES;
  [prefs setBool: state forKey: IndentForHash notify: YES];
}


- (void) setIndentForReturn: (id)sender
{
  BOOL state = ([sender state] == NSOffState) ? NO : YES;
  [prefs setBool: state forKey: IndentForReturn notify: YES];
}


- (void) setIndentForSoloOpenBrace: (id)sender
{
  BOOL state = ([sender state] == NSOffState) ? NO : YES;
  [prefs setBool: state forKey: IndentForSoloOpenCurly notify: YES];
}

- (NSView *) view
{
  return _view;
}
@end
