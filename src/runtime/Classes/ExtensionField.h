// Protocol Buffers for Objective C
//
// Copyright 2010 Booyah Inc.
// Copyright 2008 Cyrus Najmabadi
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "WireFormat.h"

@class PBCodedInputStream2;
@class PBCodedOutputStream2;
@class PBExtendableMessageBuilder;
@class PBExtensionRegistry2;
@class PBUnknownFieldSetBuilder2;

@protocol PBExtensionField
- (SInt32) fieldNumber;
- (PBWireFormat) wireType;
- (BOOL) isRepeated;
- (Class) extendedClass;
- (instancetype) defaultValue;

- (void) mergeFromCodedInputStream:(PBCodedInputStream2*) input
                     unknownFields:(PBUnknownFieldSetBuilder2*) unknownFields
                 extensionRegistry:(PBExtensionRegistry2*) extensionRegistry
                           builder:(PBExtendableMessageBuilder*) builder
                               tag:(SInt32) tag;
- (void) writeValue:(id) value includingTagToCodedOutputStream:(PBCodedOutputStream2*) output;
- (SInt32) computeSerializedSizeIncludingTag:(id) value;
- (void) writeDescriptionOf:(id) value
                         to:(NSMutableString*) output
                 withIndent:(NSString*) indent;
- (void) addDictionaryEntriesOf:(id) value
                             to:(NSMutableDictionary*) dictionary;
@end
