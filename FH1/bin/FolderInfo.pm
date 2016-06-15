package FolderInfo;

use Cwd;

sub new {
	
	my ( $class, $path) = @_; 
	
	my $self = bless {
		_folders => [],
		_files => [],
		_dir => $path,
	}, $class;

	$self->dataUpdate();
	return $self;
}

#gets info for $self
sub dataUpdate {
	my ($self) = @_;
	opendir(DIR, $self->{_dir});
	my @info = readdir DIR; 
	#remove old info
	$self->{_files} = [];
	$self->{_folders} = [];
	#divide into types	
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

#-----------Private menthods--------------------
#-----------------------------------------------
#populates the _files and _folders of the object
sub _sortInfo {
	my ($self, @info) = @_;
	my @files, my @folders;
	foreach my $f (@info) {
		if ( $f eq '.' or $f eq '..' ) {
			next;
		} elsif ( -f $f ) {
			push @{$self->{_files}}, $f;
		} elsif ( -d $f ) {
			push @{$self->{_folders}}, $f;
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
	#accending order
	my @sorted = sort { $age{$a} <=> $age{$b} } keys %age;	
	return @sorted;
}

return 1;
