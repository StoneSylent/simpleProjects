#!/usr/bin/perl -w

use FindBin;
use lib "$FindBin::Bin/bin";
use FolderInfo;
use Cwd;
use File::Path qw(make_path);
use File::Spec::Functions;
use constant ROOT_FOLDER_NAME => 'A';
use constant DEFAULT_FOLDER => '';
use constant ROOT_FILE_NAME => 0;
use constant INDENT => '-';
use constant MAX_FILE_LENGTH_EXPECTED => 20;
use constant MAX_FOLDER_LENGTH_EXPECTED => 5;
use constant TRUE => 1;
use constant FALSE => 0;

#perl FH1profilerTest.pl <profile_name>
#all output redirected to the log file: _<profile_name>_Log
#---------------------------------Main-----------------------------------
#------------------------------------------------------------------------
my $profileName = $ARGV[0];

unless(profileFound() ) {
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
printRunner("Goodbye".$profileName,1,2);  
close(LOG);
#------------------------------Methods-----------------------------------
#------------------------------------------------------------------------
# Uses folder: where the files are located
#			pName: parents name
#     baseName: first sibling
#     indent: for logging				
sub fileRenameTest1 {	
	my ($folder,$pName,$baseName,$indent) = @_;
	printf "_______renaming the files of %s_____\n",$pName;
	while ($f = $folder->nextFile())	{
		printRename($f,$pName.$baseName,MAX_FILE_LENGTH_EXPECTED, $indent);
		$baseName++;
	}
	printf "_______end of files from %s_________\n\n\n",$pName;
}

#Does the bulk of the traveling around directories.
#Recursively travels deeper into the supplied folder.
# Uses folder: where the contents are located
#			pName: parents name
#     baseName: first sibling
#     fDest: renew parent location
#     indent: for logging				

sub rfTravel {
	my ($folder,$pName,$fDest, $indent) = @_;
	
	# Rename the files first before going deeper!
	#fileRenameTest1($folder,$pName,ROOT_FILE_NAME,$indent);
	#save folder information
	my $baseName = ROOT_FOLDER_NAME;
	my $path = cwd;
	#rename all the folders now
	while ($old = $folder->nextFolder()) {
		my $new = $pName.$baseName;
		#make the new folder
		if (make_path(catfile($fDest,$new)) > 0) {
			printRename($old,$new,MAX_FOLDER_LENGTH_EXPECTED, $indent); 
			#we must go deeper!
			chdir $old;		
			rfTravel( new FolderInfo(cwd), $new, $indent.INDENT);
			#bubble back up!
			chdir $path;
			$baseName++;
		} else {
			print("failed to create folder: "+$new+" \n");
			die("failed to create folder: "+$new+" \n");
		}
	}
}

#prints <indent><old><gaplength><...><new>
#where gaplength fills min length old should take
sub printRename { 
	my $old = $_[0];
	my $new = $_[1];
	my $gapLength = defined $_[2] ? $_[2] : 0;
	my $indent = $_[3] ? $_[3] : "*";
	print $indent.commonSize($old,$gapLength)."renamed to ".$new."\n";
}
#prints "<before><runner><text><runner><after>"
#where <before>,<after> are number of new lines.
sub printRunner {
	my $text = $_[0];
	my $before = defined($_[1]) ? $_[1] : 0;
	my $after = defined($_[2]) ? $_[2] : 0;
	my $runner = "-------------";
	$runner = $runner." ".$text." ".$runner;
	while( $before > 0 ) {
		$runner = "\n".$runner;
		$before -= 1;
	}
	while( $after > 0 ) {
		$runner = $runner."\n";
		$after -= 1;
	}
	print($runner);
}

#resize $text to length $size>0
sub commonSize {
	my ( $text, $size ) = @_;
	my $space = " ";
	while ( length $text <= $size )
	{
		$text .= $space;
	}
	return $text;
}

#checks the profile folder for 
sub profileFound {
	opendir(PROFILES, 'profiles') || die "Missing the profiles folder!\n";
	while( ( $name = readdir(PROFILES) ) ) {
		   if ( $name eq $profileName ) {
		   	closedir(PROFILES);
		   	return TRUE;
		   }
	}
	closedir(PROFILES);
	return FALSE;
}	
