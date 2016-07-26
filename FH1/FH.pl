#!/usr/bin/perl -w
use strict;

#classes
use FindBin;
use lib "$FindBin::Bin/bin";
use FolderInfo;
use Cwd;
use File::Path qw(make_path);
use File::Spec::Functions;
use File::Copy;

#constants
use constant ROOT_FOLDER_NAME => 'A';
use constant ROOT_FILE_NAME => 0;
use constant DEFAULT_FOLDER => '';
use constant INDENT => '-';
use constant MAX_FILE_LENGTH_EXPECTED => 20;
use constant MAX_FOLDER_LENGTH_EXPECTED => 5;
use constant TRUE => 1;
use constant FALSE => 0;


##
## Main
##
## Arguments:
##    $profileName: profile folder to be used
##
## Generates a Log file of the profile folders/files changed.
## 
## Execute:
## 		perl FH1profilerTest.pl $profileName
##
my $profileName = $ARGV[0];

unless(profileFound($profileName) ) {
	die "Missing profile \"$profileName\"\n";
}
chdir "profiles";
unless( open(LOG, ">>", "_".$profileName."_Log") ) {
	die "Unable to create a log file";
}
#print to the log from now on
select LOG;
print "Log entry generated at".localtime."\n";
printRunner("Welcome ".$profileName,0,1);
#create temp_profile
my $tempProPath = $profileName."_temp";
mkdir $tempProPath;
$tempProPath = catfile(cwd,$tempProPath);
#begin work on the profile
chdir $profileName;
my $profile = new FolderInfo(cwd);
rfTravel($profile, DEFAULT_FOLDER, $tempProPath, INDENT);
#end work on the profile
printRunner("Goodbye ".$profileName,1,2);  
close(LOG);
#------------------------------Methods-----------------------------------
#------------------------------------------------------------------------
##
## doRenamefiles()
##
## Arguments:
##    $folder: FolderInfo object that knows the files to be renamed 
##		$pName: string Name of folder files are in.
##    $fDest: string Path to folder destination	
##		$indent: string Logging character
## 		
## Renames all files found in the folder object based on age
## and new location. 
## 	
sub doRenamefiles {	
	my ($folder,$pName,$fDest,$indent) = @_;
	#has something to do
	if ($folder->numFile()) {
		my $new = $pName.ROOT_FILE_NAME;
		printf "_______renaming the files of %s_____\n",$pName;
		while ( my $old = $folder->nextFile())	{
			unless (copy(catfile(cwd,$old), catfile($fDest,$new))) { 
				die "move failed\n";
			}		
			printRename($old,$new,MAX_FILE_LENGTH_EXPECTED, $indent);
			$new++;
		}
		printf "_______end of files from %s_________\n\n\n",$pName;
	}	
}
##
## rfTravel()
##
## Arguments:
##    $folder: FolderInfo gives Folder/Files to be renamed 
##		$pName: string Name of folder files are in.
##    $fDest: string Path to folder destination	
##		$indent: string Logging character
## 		
## Renames Files/Folders while recursively traveling into
## Folders to also rename their contents.  
## 	
sub rfTravel {
	my ($folder,$pName,$fDest, $indent) = @_;
	#save folder information
	my $baseName = ROOT_FOLDER_NAME;
	my $path = cwd;
	# Rename the files first before going deeper!
	doRenamefiles($folder,$pName,$fDest,$indent);
	#rename all the folders now
	while (my $old = $folder->nextFolder()) {
		my $new = $pName.$baseName;
		#make the new folder
		my $newPath = catfile($fDest,$new); 
		unless (make_path($newPath)) {
			my $error = "failed to create folder: ".$new."\n";
			print($error); die($error);			
		}
			printRename($old,$new,MAX_FOLDER_LENGTH_EXPECTED, $indent); 
			#we must go deeper!
			chdir $old;		
			rfTravel( new FolderInfo(cwd), $new, $newPath, $indent.INDENT);
			#bubble back up!
			chdir $path;
			$baseName++;
	}
}
##
## printRename()
##
## Arguments:
##    $old: string Old Name 
##		$new: string New Name
##    $gapLength: integer DEFAULT:0 spacing modifier	
##		$indent: string DEFAULT:* text modifier 
## 		
## Prints the change from old to new.
##    	
sub printRename { 
	my $old = $_[0];
	my $new = $_[1];
	my $gapLength = defined $_[2] ? $_[2] : 0;
	my $indent = $_[3] ? $_[3] : "*";
	print $indent.commonSize($old,$gapLength)." renamed to ".$new."\n";
}
##
## printRunner()
##
## Arguments:
##    $text: string Text found inside runner 
##		$before: integer DEFAULT:0 number of newlines before runner
##    $after: integer DEFAULT:0 number of newlines after runner	 
## 		
## Prints runner information
##    	
sub printRunner {
	my $text = $_[0];
	my $before = defined($_[1]) ? $_[1] : 0;
	my $after = defined($_[2]) ? $_[2] : 0;
	my $runner = "-------------";
	$runner = $runner." ".$text." ".$runner;
	while($before) {
		$runner = "\n".$runner;
		$before -= 1;
	}
	while($after) {
		$runner = $runner."\n";
		$after -= 1;
	}
	print($runner);
}
##
## commonSize()
##
## Arguments:
##    $text: string text to be resized 
##		$size: integer length of text to return.
##    
## Returns: 
##		$text with length of $size unless $size is too small.		
## 
## Adds spaces after $text until $text is at least length of $size   	
##
sub commonSize {
	my ( $text, $size ) = @_;
	my $space = " ";
	while ( length $text <= $size )
	{
		$text .= $space;
	}
	return $text;
}
##
## profileFound()
##
## Arguments:
## 		$profile: string Name of folder in profiles to be found
##
## Returns:
##			0: profile not found
##			1: profile was found
##
## Boolean method that returns in the profile was found 
## 
sub profileFound {
	my ( $profile ) = @_;
	opendir(PROFILES, 'profiles') || die "Missing the profiles folder!\n";
	while( ( my $name = readdir(PROFILES) ) ) {
		   if ( $name eq $profile ) {
		   	closedir(PROFILES);
		   	return TRUE;
		   }
	}
	closedir(PROFILES);
	return FALSE;
}
