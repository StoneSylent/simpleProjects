#!/usr/bin/perl -w

use FolderInfo;
use Cwd;

my $object = new FolderInfo(cwd);
$object->sortFiles();
my @files = $object->getFiles();
$object->printInfo(@files);

