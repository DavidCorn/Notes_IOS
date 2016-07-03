
//
//  NotesTableViewController.m
//  Notes
//
//  Created by Craig on 10/07/2015.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

#import "NotesTableViewController.h"
#import "ViewController.h"

#import "Model.h"
#import "Notes.h"
#import "Note.h"
#import "NoteTableViewCell.h"


@interface NotesTableViewController ()
@property (strong, nonatomic) Note *noteToAdd;
@end

@implementation NotesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    [self.tableView registerClass:[NoteTableViewCell class] forCellReuseIdentifier:@"note"];
}

-(void)viewWillAppear:(BOOL)animated {
    if (self.noteToAdd && ![self.noteToAdd isBlank]) {
        [[Model sharedModel].notes addNote:self.noteToAdd];
    }
    self.noteToAdd = nil;
    
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote:)];
    self.title = @"Notes";
}

-(void)addNote:(id)sender {
    self.noteToAdd = [[Note alloc] initWithTitle:@"" detail:@""];
    ViewController *detailViewController = [[ViewController alloc] initWithNote:self.noteToAdd];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[Model sharedModel].notes count];
}

#pragma mark - Table view delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"note" forIndexPath:indexPath];
    
    Note *note = [[Model sharedModel].notes getNoteAtIndex:indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = note.title;
    cell.detailTextLabel.text = note.detail;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Note *note = [[Model sharedModel].notes getNoteAtIndex:indexPath.row];
    ViewController *detailViewController = [[ViewController alloc] initWithNote:note];
    [self.navigationController pushViewController:detailViewController animated:YES];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    return YES;
}
 


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
     if (editingStyle == UITableViewCellEditingStyleDelete) {
         // Delete the row from the data source
         [[Model sharedModel].notes deleteNoteAtIndex:indexPath.row];
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
 }
 


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    [[Model sharedModel].notes moveFromIndex:fromIndexPath.row toIndex:toIndexPath.row];
}


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end