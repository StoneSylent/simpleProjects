#!/usr/bin/perl -w

use Folder;
use Cwd;

my $object = new Folder(cwd);
$object->sortFiles();
my @files = $object->getFiles();
$object->printInfo(@files);

