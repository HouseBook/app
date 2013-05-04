//
//  HBOpinion.h
//  Housebook
//
//  Created by Mitch Ruebush on 5/4/13.
//  Copyright (c) 2013 HouseBookApp.com. All rights reserved.
//

#import "JSONModel.h"

@interface HBOpinion : JSONModel

@property (strong, nonatomic) NSString* mlsid;
@property (strong, nonatomic) NSString* user;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* audio_raw;
@property (strong, nonatomic) NSString* audio_text;

@end
