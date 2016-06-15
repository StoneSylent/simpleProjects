package Folder;

use Cwd;


sub new {
	
	my ( $class) = @_; 
	
	my $self = bless {
		_folders => [],
		_files => [],
		_dir => cwd,
	}, $class;
	#populates _folders and _dir
	$self->dataUpdate(0);
	
	return $self;
}

#option 1: print data, option 0: no prints
sub dataUpdate {
	my ($self) = @_;
	my @info;
	#go to _dir
	opendir(DIR, $self->{_dir});
	@info = readdir DIR; 
	
	$self->_sortInfo(@info);
	
	return 1;
}


sub printInfo {
	my ($self, @info) = @_;
	foreach my $f (@info) {
		my $age = -M $f;
		printf "%s\tcreation: %.8f Days ago\n",$f, $age;
	}
}

#populates the _files and _folders of the object
sub _sortInfo {
	my ($self, @info) = @_;
	my @files, my @folders;
	foreach my $f (@info) {
		if ( $f eq '.' or $f eq '..' ) {
			next;
		} else {
			push @{$self->{_files}}, $f;
		}
	}
}

sub _sortData {

	my ($self, @info) = @_;
	my %age;
	
	for my $f (@info) {
		#last time $f was modified
		$age{$f} = -M $f;
	}
	#go back to $old_dir;
	my @sorted = sort { $age{$a} <=> $age{$b} } keys %age;	
	return @sorted;
}

sub getFiles {
	return @{$_[0]->{_files}};  
}
sub sortFiles {
	my ($self) = @_;
	@{$self->{_files}} = $self->_sortData(@{$self->{_files}});
	return 1;
}
sub getFolders {
	return @{$_[0]->{_folders}};
}
sub sortFolders {
	my ($self) = @_;
	@{$self->{_folders}} = $self->_sortData(@{$self->{_folders}});
	return 1;
}	


return 1;
