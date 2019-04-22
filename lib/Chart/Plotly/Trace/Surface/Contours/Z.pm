package Chart::Plotly::Trace::Surface::Contours::Z;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Surface::Contours::Z::Project;


# VERSION

# ABSTRACT: This attribute is one of the possible options for the trace surface.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/surface.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace surface.

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#surface>

=head1 DISCLAIMER

This is an unofficial Plotly Perl module. Currently I'm not affiliated in any way with Plotly. 
But I think plotly.js is a great library and I want to use it with perl.

=head1 METHODS

=cut

=head2 TO_JSON

Serialize the trace to JSON. This method should be called only by L<JSON> serializer.

=cut

sub TO_JSON {
    my $self = shift; 
    my $extra_args = $self->extra_args // {};
    my $meta = $self->meta;
    my %hash = %$self;
    for my $name (sort keys %hash) {
        my $attr = $meta->get_attribute($name);
        if (defined $attr) {
            my $value = $hash{$name};
            my $type = $attr->type_constraint;
            if ($type && $type->equals('Bool')) {
                $hash{$name} = $value ? \1 : \ 0;
            }
        }
    }
    %hash = (%hash, %$extra_args);
    delete $hash{'extra_args'};
    if ($self->can('type') && (!defined $hash{'type'})) {
        $hash{type} = $self->type();
    }
    return \%hash;
}

=head1 ATTRIBUTES

=over

=cut

=item * color

Sets the color of the contour lines.

=cut

has color => (
    is => "rw",
    documentation => "Sets the color of the contour lines.",
);

=item * end

Sets the end contour level value. Must be more than `contours.start`

=cut

has end => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the end contour level value. Must be more than `contours.start`",
);

=item * highlight

Determines whether or not contour lines about the z dimension are highlighted on hover.

=cut

has highlight => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines whether or not contour lines about the z dimension are highlighted on hover.",
);

=item * highlightcolor

Sets the color of the highlighted contour lines.

=cut

has highlightcolor => (
    is => "rw",
    documentation => "Sets the color of the highlighted contour lines.",
);

=item * highlightwidth

Sets the width of the highlighted contour lines.

=cut

has highlightwidth => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the width of the highlighted contour lines.",
);

=item * project


=cut

has project => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Surface::Contours::Z::Project",
);

=item * show

Determines whether or not contour lines about the z dimension are drawn.

=cut

has show => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines whether or not contour lines about the z dimension are drawn.",
);

=item * size

Sets the step between each contour level. Must be positive.

=cut

has size => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the step between each contour level. Must be positive.",
);

=item * start

Sets the starting contour level value. Must be less than `contours.end`

=cut

has start => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the starting contour level value. Must be less than `contours.end`",
);

=item * usecolormap

An alternate to *color*. Determines whether or not the contour lines are colored using the trace *colorscale*.

=cut

has usecolormap => (
    is => "rw",
    isa => "Bool",
    documentation => "An alternate to *color*. Determines whether or not the contour lines are colored using the trace *colorscale*.",
);

=item * width

Sets the width of the contour lines.

=cut

has width => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the width of the contour lines.",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
