/*
   GNUstep ProjectCenter - http://www.gnustep.org

   Copyright (C) 2000-2002 Free Software Foundation

   Author: Philippe C.D. Robert <probert@siggraph.org>

   This file is part of GNUstep.

   This application is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This application is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU General Public
   License along with this library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111 USA.
*/

#ifndef __PCPROJECTDEBUGGER_H
#define __PCPROJECTDEBUGGER_H

#include <AppKit/AppKit.h>

#ifndef GNUSTEP_BASE_VERSION
@protocol ProjectComponent;
#else
#include <ProjectCenter/ProjectComponent.h>
#endif

@class PCProject;
@class PCButton;

@interface PCProjectLauncher : NSObject <ProjectComponent>
{
  NSBox         *componentView;
  NSPopUpButton *popup;

  PCButton      *runButton;
  PCButton      *debugButton;

  PCProject     *currentProject;    // Not retained!
  NSDictionary  *currentOptions; // Not retained!

  NSTextView    *stdOut;
  NSDictionary  *textAttributes;

  NSFileHandle  *readHandle;
  NSFileHandle  *errorReadHandle;
  NSTask        *launchTask;

  int           debugTarget;
}

- (id)initWithProject:(PCProject *)aProject;
- (void)dealloc;

- (NSView *) componentView;
- (void)setTooltips;

- (void)popupChanged:(id)sender;

- (void)debug:(id)sender;
- (void)run:(id)sender;

- (void)buildDidTerminate:(NSNotification *)aNotif;

- (void)logStdOut:(NSNotification *)aNotif;
- (void)logErrOut:(NSNotification *)aNotif;

@end

@interface PCProjectLauncher (BuildLogging)

- (void)logString:(NSString *)string newLine:(BOOL)newLine;
- (void)logData:(NSData *)data error:(BOOL)yn;

@end

@interface PCProjectLauncher (UserInterface)

- (void)_createComponentView;

@end

#endif
