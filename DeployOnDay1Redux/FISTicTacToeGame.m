//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame


//responsible for setting up a new game, method should amke sure baord is initialized as empty!
-(instancetype)init
{
    self = [super init];
    if(self) {
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)
        //This goes ahead and will clear the game board of all the players
        
        [self resetBoard];
    }
    return self;
}
//this method would be creating the board for playing
//instead putting it 3 separate arrays into another array
//Done with this array for now
-(void)resetBoard
{
    //
    NSMutableArray *stringArray = [NSMutableArray array];
    
    for (int column = 0; column < 3; column++)
    {
        NSMutableArray *columnArray = [NSMutableArray array];
        
        for (int row = 0; row < 3; row++)
            [columnArray addObject:[NSString stringWithFormat:@""]];
        
        [stringArray addObject:columnArray];
    }
    
    self.board = stringArray;
    NSLog(@"board: %@", stringArray);
}
//This method will only be returning what we have at the particular column x row and will return that string in that box
-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSString *itemAtPlace = self.board[column][row];
    return itemAtPlace;
}
//they already provided me with a column and row value as arguement
//always look up to look at the full method name
//Done with this method 
-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ([self.board[column][row] isEqualToString:@"" ])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}
//Done with this method
//initially thought the addObject method only works for mutable array
//need to look back
-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    self.board[column][row]= @"X";
}
//Done with this method
-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    self.board[column][row] = @"O";
}
//Done with this method
-(NSString *)winningPlayer
{
    if([self.board[0][0] isEqualToString: self.board[1][0]] && [self.board[0][0]isEqualToString: self.board[2][0]])
    {
        return self.board[0][0];
    }
    else if([self.board[0][1] isEqualToString: self.board[1][1]] && [self.board[0][1]isEqualToString: self.board[2][1]])
    {
        return self.board[0][1];
    }
    else if([self.board[0][2] isEqualToString: self.board[1][2]] && [self.board[0][2]isEqualToString: self.board[2][2]])
    {
        return self.board[0][2];
    }
    else if([self.board[0][0] isEqualToString: self.board[0][1]] && [self.board[0][0]isEqualToString: self.board[0][2]])
    {
        return self.board[0][0];
    }
    else if ([self.board[1][0] isEqualToString:self.board[1][1]] && [self.board[1][0] isEqualToString:self.board[1][2]])
    {
        return self.board[1][0];
    }
    else if ([self.board[2][0] isEqualToString:self.board[2][1]] && [self.board[2][0] isEqualToString:self.board[2][2]])
    {
        return self.board[2][0];
    }
    else if ([self.board[0][0] isEqualToString:self.board[1][1]] && [self.board[0][0] isEqualToString:self.board[2][2]])
    {
        return self.board[0][0];
    }
    else if ([self.board[2][0] isEqualToString:self.board[1][1]] && [self.board[2][0] isEqualToString:self.board[0][2]])
    {
        return self.board[2][0];
    }
    return @"";
}

-(BOOL)isADraw
{
    BOOL boardFull = YES;
    
    for (NSUInteger column = 0; column < 3; column++)
    {
        for (NSUInteger row = 0; row < 3; row++)
        {
            if ([self.board[column][row] isEqualToString: @""])
            {
                boardFull = NO;
            }
        }
    }
    return boardFull;
}

@end
