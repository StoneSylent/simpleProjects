#!/usr/bin/perl -w

use FindBin;
use lib "$FindBin::Bin/bin";
use FolderInfo;
use Cwd;
use File::Copy;

#perl FH1profilerTest.pl <profile_name>
my $profile = $ARGV[0];

if ( not profileFound() ) {
	die "Missing profile \"$profile\"\n";
}

printf "\n-------------Welcome %s--------------\n\n\n",$profile;
chdir "profiles";
chdir $profile;

$profile = new FolderInfo(cwd);

while ($temp = $profile->nextFile() )
{
	$profile->printInfo($temp);
}
while ($temp = $profile->nextFolder() )
{
	$profile->printInfo($temp);
}


#------------------------------Methods-----------------------------------
#------------------------------------------------------------------------
sub profileFound {
	opendir(PROFILES, 'profiles') || die "Missing the profiles folder!\n";
	while( ( $name = readdir(PROFILES) ) ) {
		   if ( $name eq $profile ) {
		   	closedir(PROFILES);
		   	return 1;
		   }
	}
	closedir(PROFILES);
	return 0;
}	
