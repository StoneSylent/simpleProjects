#!/usr/bin/perl -w

use FindBin;
use lib "$FindBin::Bin/bin";
use FolderInfo;
use Cwd;
use File::Copy;


use constant ROOT_FOLDER_NAME => 'A';
use constant ROOT_FILE_NAME => 0;
use constant DEPTH => '-';
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

printf "\n-------------Welcome %s--------------\n",$profileName;
chdir $profileName;

my $profile = new FolderInfo(cwd);

rfTravel($profile, '', DEPTH);

printf "\nGoodbye %s\n\n", $profileName; 

#------------------------------Methods-----------------------------------
#------------------------------------------------------------------------
sub fileRenameTest1 {	
	my ($folder,$parent,$name,$indent) = @_;
	printf "_______renaming the files of %s_____\n",$parent;
	while ($f = $folder->nextFile())	{
		print $indent.commonSize($f,MAX_FILE_LENGTH_EXPECTED)." renamed to ".$parent.$name++."\n";
	}
	printf "_______end of files from %s_________\n\n\n",$parent;
}


#Does the bulk of the traveling around directories.
#Recursively travels deeper into the supplied folder.
sub rfTravel {
	my ($folder,$parent, $indent) = @_;
	
	# Rename the files first before going deeper!
	fileRenameTest1($folder,$parent,ROOT_FILE_NAME,$indent);
	
	my $name = ROOT_FOLDER_NAME;
	my $path = cwd;
	
	while ($f = $folder->nextFolder()) {
		print $indent.commonSize($f,MAX_FOLDER_LENGTH_EXPECTED)." renamed to ".$parent.$name."\n";
		#go deeper into the folder 
		chdir $f;
		#we must go deeper!
		rfTravel( new FolderInfo(cwd), $parent.$name, $indent.DEPTH);
		#bubble back up!
		chdir $path;
		$name++;
	}
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
