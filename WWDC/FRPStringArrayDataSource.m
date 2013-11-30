//
//  FRPStringArrayDataSource.m
//  WWDC
//
//  Created by Алексей Демедецкий on 30.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import "FRPStringArrayDataSource.h"

@implementation FRPStringArrayDataSource

+ (instancetype)emptyDataSource
{
    FRPStringArrayDataSource* ds = [self new];
    
    return ds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.strings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"StringCell"];
    cell = cell ?: [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StringCell"];
    
    cell.textLabel.text = self.strings[indexPath.row];
    
    return cell;
}
@end
