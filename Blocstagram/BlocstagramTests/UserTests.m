//
//  UserTests.m
//  Blocstagram
//
//  Created by Cody Rapp on 12/16/15.
//  Copyright © 2015 Bloc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "User.h"
#import "Media.h"
#import "Comment.h"
#import "ComposeCommentView.h"
#import "MediaTableViewCell.h"

@interface UserTests : XCTestCase

@property (nonatomic,strong) User *testUser;
@property (nonatomic,strong) Media *testMedia;


@end

@implementation UserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatInitializationWorks
{
    NSDictionary *sourceDictionary = @{@"id": @"8675309",
                                       @"username" : @"d'oh",
                                       @"full_name" : @"Homer Simpson",
                                       @"profile_picture" : @"http://www.example.com/example.jpg"};
    self.testUser = [[User alloc] initWithDictionary:sourceDictionary];
    
    XCTAssertEqualObjects(self.testUser.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(self.testUser.userName, sourceDictionary[@"username"], @"The username should be equal");
    XCTAssertEqualObjects(self.testUser.fullName, sourceDictionary[@"full_name"], @"The full name should be equal");
    XCTAssertEqualObjects(self.testUser.profilePictureURL, [NSURL URLWithString:sourceDictionary[@"profile_picture"]], @"The profile picture should be equal");
}


-(void)testThatMediaInitiatializationWorks{

    
    NSDictionary *sourceDictionary = @{@"id":@"234432",
                                       @"user":@{@"id": @"8675309", @"username" : @"d'oh", @"full_name" : @"Homer Simpson", @"profile_picture" : @"http://www.example.com/example.jpg"},
                                       @"images":@{@"standard_resolution":@{@"url":@"http://www.example.com/example.jpg"}},
                                       @"caption":@{@"text":@"Hello world!"},
                                       /*
                                       @"comments":@{@"data":@{@"id":@"234432",@"from":@{@"id": @"8675309",@"username" : @"d'oh",@"full_name" : @"Homer Simpson",@"profile_picture" : @"http://www.example.com/example.jpg"},
                                                               @"text":@"Hello"}}
                                       
                                       ,*/ @"user_has_liked":@"1"};
    
    self.testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    
    XCTAssertEqualObjects(self.testMedia.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    
    XCTAssertEqualObjects(self.testMedia.user.fullName, @"Homer Simpson", @"The user should be equal");
    
   
    NSURL *standardResolutionImageURL = [NSURL URLWithString:sourceDictionary[@"images"][@"standard_resolution"][@"url"]];
    
    XCTAssertEqualObjects(self.testMedia.mediaURL, standardResolutionImageURL, @"The URL should be equal");
    
    XCTAssertEqualObjects(self.testMedia.caption, sourceDictionary[@"caption"][@"text"], @"The caption should be equal");
    
     XCTAssertEqual(self.testMedia.likeState, LikeStateLiked, @"The likestate should be equal");
    
    
}


//Write a test that ensures [ComposeCommentView -setText:] sets isWritingComment to YES if there's text, and another to ensure that it's set to NO if there's not text.

-(void)testThatSetTextSetsBoolToTrue{

    ComposeCommentView *commentView = [[ComposeCommentView alloc] init];
    
    [commentView setText:@"Hello text"];
    
    XCTAssertEqual(commentView.isWritingComment, true, @"Bool should be true");
    
}

-(void)testThatSetTextSetsBoolToFalse{
    
    ComposeCommentView *commentView = [[ComposeCommentView alloc] init];
    
    [commentView setText:@""];
    
    XCTAssertEqual(commentView.isWritingComment, false, @"Bool should be false");
    
}


-(void)testThatTestsForHeightForMediaViewCell{

    
    NSDictionary *sourceDictionary = @{@"id":@"234432",
                                       @"user":@{@"id": @"8675309", @"username" : @"d'oh", @"full_name" : @"Homer Simpson", @"profile_picture" : @"http://www.example.com/example.jpg"},
                                       @"images":@{@"standard_resolution":@{@"url":@"http://www.example.com/example.jpg"}},
                                       @"caption":@{@"text":@"Hello world!"},
                                       /*
                                        @"comments":@{@"data":@{@"id":@"234432",@"from":@{@"id": @"8675309",@"username" : @"d'oh",@"full_name" : @"Homer Simpson",@"profile_picture" : @"http://www.example.com/example.jpg"},
                                        @"text":@"Hello"}}
                                        
                                        ,*/ @"user_has_liked":@"1"};
    
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    
    UITraitCollection *trait = [UITraitCollection traitCollectionWithUserInterfaceIdiom:UIUserInterfaceIdiomPhone];
    
    CGFloat height = [MediaTableViewCell heightForMediaItem:testMedia width:200 traitCollection:trait];
    
    
    
    XCTAssertEqual(height, 138, @"The heights should be equal");
    
    

}



@end
