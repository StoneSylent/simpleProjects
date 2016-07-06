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

rfTravel($profile, "A", '-');

printf "\nGoodbye %s\n\n", $profileName; 

#------------------------------Methods-----------------------------------
#------------------------------------------------------------------------
sub fileRenameTest1 {	
	my ($folder,$parent,$name,$depth) = @_;
	printf "*****renaming the files of %s*****\n",$parent;
	while ($f = $folder->nextFile())	{
		print $depth; #$folder->printInfo($f);
		printf "%s%s renamed to %s%s\n",$depth,commonSize($f,20),$parent,$name++;
	}
	printf "*****end of files from %s*****\n",$parent;
}

sub rfTravel {
	my ($folder,$parent, $depth) = @_;
	my $name = "A";
	my $path = cwd;
	
	while ($f = $folder->nextFolder()) {
		print $depth; #$folder->printInfo($f);
		printf "%s%s renamed to %s\n",$depth,commonSize($f,20), $parent.$name;
		opendir(CHILD, $f);
		chdir CHILD;
		closedir(CHILD);
		#we must go deeper!
		rfTravel( new FolderInfo(cwd), $parent.$name, $depth.$depth);
		#bubble back up!
		chdir $path;
		$name++;
	}
	
	fileRenameTest1($folder,$parent,0,$depth);

}

sub commonSize {
	my ( $text, $size ) = @_;
	my $space = " ";
	while ( length $text != $size )
	{
		$text .= $space;
	}
	return $text;
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
