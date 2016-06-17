#!/usr/bin/perl -w

use FindBin;
use lib "$FindBin::Bin/bin";
use FolderInfo;
use Cwd;
use File::Copy;

#perl FH1profilerTest.pl <profile_name>
my $profileName = $ARGV[0];

if ( not profileFound() ) {
	die "Missing profile \"$profileName\"\n";
}

printf "\n-------------Welcome %s--------------\n",$profileName;
chdir "profiles";
chdir $profileName;

my $profile = new FolderInfo(cwd);

print "Folders:\n";
folderRenameTest1($sName);
print "\nFiles:\n";
fileRenameTest1("Home",$sName);
printf "\nGoodbye %s\n\n", $profileName; 

#------------------------------Methods-----------------------------------
#------------------------------------------------------------------------
sub fileRenameTest1 {
	my ($dirName,$name) = @_;
	while ($f = $profile->nextFile())	{
		$profile->printInfo($f);
		printf "\trenamed to %s%s\n",$dirName,$name++;
	}
}

sub folderRenameTest1 {
	my ($name) = @_;
	while ($f = $profile->nextFolder())	{
		$profile->printInfo($f);
		printf "\trenamed to %s\n",$name++;
	}

}

sub profileFound {
	opendir(PROFILES, 'profiles') || die "Missing the profiles folder!\n";
	while( ( $name = readdir(PROFILES) ) ) {
		   if ( $name eq $profileName ) {
		   	closedir(PROFILES);
		   	return 1;
		   }
	}
	closedir(PROFILES);
	return 0;
}	
