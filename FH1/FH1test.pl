#!/usr/bin/perl -w

use FindBin;
use lib "$FindBin::Bin/bin";
use FolderInfo;
use Cwd;

my $object = new FolderInfo(cwd);
$object->sortAll();
my @files = $object->getFiles();
$object->printInfo(@files);

