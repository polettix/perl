package TAP::Object;

use strict;
use vars qw($VERSION);

=head1 NAME

TAP::Object - Base class that provides common functionality to all C<TAP::*> modules

=head1 VERSION

Version 3.13

=cut

$VERSION = '3.13';

=head1 SYNOPSIS

    package TAP::Whatever;

    use strict;
    use vars qw(@ISA);

    use TAP::Object;

    @ISA = qw(TAP::Object);

    # new() implementation by TAP::Object
    sub _initialize {
        my ( $self, @args) = @_;
        # initialize your object
        return $self;
    }

    # ... later ...
    my $obj = TAP::Whatever->new(@args);

=head1 DESCRIPTION

C<TAP::Object> provides a default constructor and exception model for all
C<TAP::*> classes.  Exceptions are raised using L<Carp>.

=head1 METHODS

=head2 Class Methods

=head3 C<new>

Create a new object.  Any arguments passed to C<new> will be passed on to the
L</_initialize> method.  Returns a new object.

=cut

sub new {
    my $class = shift;
    my $self = bless {}, $class;
    return $self->_initialize(@_);
}

=head2 Instance Methods

=head3 C<_initialize>

Initializes a new object.  This method is a stub by default, you should override
it as appropriate.

I<Note:> L</new> expects you to return C<$self> or raise an exception.  See
L</_croak>, and L<Carp>.

=cut

sub _initialize {
    return $_[0];
}

=head3 C<_croak>

Raise an exception using C<croak> from L<Carp>, eg:

    $self->_croak( 'why me?', 'aaarrgh!' );

May also be called as a I<class> method.

    $class->_croak( 'this works too' );

=cut

sub _croak {
    my $proto = shift;
    require Carp;
    Carp::croak(@_);
    return;
}

1;
