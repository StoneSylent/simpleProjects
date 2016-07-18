#!/usr/bin/perl -w

use FindBin;
use lib "$FindBin::Bin/bin";
use FolderInfo;
use Cwd;
use File::Copy;


use constant ROOT_FOLDER_NAME => 'A';
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
printf "\n-------------Welcome %s--------------\n",$profileName;

#make a temp profile
my $current = cwd;
my $temp_profile = $profileName."_temp";
mkdir $temp_profile;
chdir $temp_profile;
$temp_profile = cwd;
chdir $current;
#go into profile
chdir $profileName;
rfTravel(new FolderInfo(cwd),'',$temp_profile,INDENT);

printf "\nGoodbye %s\n\n", $profileName; 

#------------------------------Methods-----------------------------------
#------------------------------------------------------------------------
sub fileRenameTest1 {	
	my ($folder,$tDir,$pName,$name,$indent) = @_;
	printf "_______renaming the files of %s_____\n",$pName;
	while ($file = $folder->nextFile())	{
		print $indent.commonSize($file,MAX_FILE_LENGTH_EXPECTED)." renamed to ".$pName.$name++."\n";
	}
	printf "_______end of files from %s_________\n\n\n",$pName;
}


#Does the bulk of the traveling around directories.
#Recursively travels deeper into the supplied folder.
sub rfTravel {
	my ($folder,$pName,$tDir,$indent) = @_;
	
	# Rename the files first before going deeper!
	#fileRenameTest1($folder,$tDir,$pName,ROOT_FILE_NAME,$indent);
	
	my $name = ROOT_FOLDER_NAME;
	my $path = cwd;
	
	while ($fldr = $folder->nextFolder()) {
		my $newName = $pName.$name;
		#rename the folder in temp
		chdir $tDir;
		print "into temp dir".cwd."\n";
		mkdir $newName;
		print "tDir:".$tDir."\n";
		chdir $path;
		print "back to:".$path."\n";
		#log the success of the renamed folder
		print $indent.commonSize($fldr,MAX_FOLDER_LENGTH_EXPECTED)." renamed to ".$pName.$name."\n";
		#we must go deeper! 
		chdir $fldr;
		#rename everything there too!
		rfTravel( new FolderInfo(cwd),$newName,$tDir,$indent.INDENT);
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
