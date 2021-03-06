/*
 *  Copyright (c) 2016 Spotify AB.
 *
 *  Licensed to the Apache Software Foundation (ASF) under one
 *  or more contributor license agreements.  See the NOTICE file
 *  distributed with this work for additional information
 *  regarding copyright ownership.  The ASF licenses this file
 *  to you under the Apache License, Version 2.0 (the
 *  "License"); you may not use this file except in compliance
 *  with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */

#import "HUBActionMock.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HUBActionMock

#pragma mark - Initializer

- (instancetype)initWithBlock:(BOOL(^_Nullable)(id<HUBActionContext>))block
{
    self = [super init];
    
    if (self) {
        _block = [block copy];
    }
    
    return self;
}

#pragma mark - HUBAction

- (BOOL)performWithContext:(id<HUBActionContext>)context
{
    return self.block != nil ? self.block(context) : NO;
}

@end

NS_ASSUME_NONNULL_END
