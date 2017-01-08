package Chart::Plotly::Trace::Scatter3d;
use Moose;

use Chart::Plotly::Trace::Attribute::Error_x;
use Chart::Plotly::Trace::Attribute::Error_y;
use Chart::Plotly::Trace::Attribute::Error_z;
use Chart::Plotly::Trace::Attribute::Line;
use Chart::Plotly::Trace::Attribute::Marker;
use Chart::Plotly::Trace::Attribute::Projection;


# VERSION

=encoding utf-8

=head1 NAME 

Chart::Plotly::Trace::Scatter3d

=head1 SYNOPSIS

# EXAMPLE: examples/traces/scatter3d.pl

=head1 DESCRIPTION

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#scatter3d>

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
	my %hash = %$self; 
	if ($self->can('type') && (!defined $hash{'type'})) {
		$hash{type} = $self->type();
	}
	return \%hash;
}



=head1 ATTRIBUTES

=over

=cut

=item * connectgaps

Determines whether or not gaps (i.e. {nan} or missing values) in the provided data arrays are connected.

=cut

has connectgaps => (
    is => 'rw',
    isa => "Bool",
    documentation => "Determines whether or not gaps (i.e. {nan} or missing values) in the provided data arrays are connected.",
);

=item * error_x


=cut

has error_x => (
    is => 'rw',
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Attribute::Error_x"
);

=item * error_y


=cut

has error_y => (
    is => 'rw',
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Attribute::Error_y"
);

=item * error_z


=cut

has error_z => (
    is => 'rw',
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Attribute::Error_z"
);

=item * line


=cut

has line => (
    is => 'rw',
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Attribute::Line"
);

=item * marker


=cut

has marker => (
    is => 'rw',
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Attribute::Marker"
);

=item * mode

Determines the drawing mode for this scatter trace. If the provided `mode` includes *text* then the `text` elements appear at the coordinates. Otherwise, the `text` elements appear on hover. If there are less than 20 points, then the default is *lines+markers*. Otherwise, *lines*.

=cut

has mode => (
    is => 'rw',
    documentation => "Determines the drawing mode for this scatter trace. If the provided `mode` includes *text* then the `text` elements appear at the coordinates. Otherwise, the `text` elements appear on hover. If there are less than 20 points, then the default is *lines+markers*. Otherwise, *lines*.",
);

=item * projection


=cut

has projection => (
    is => 'rw',
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Attribute::Projection"
);

=item * surfaceaxis

If *-1*, the scatter points are not fill with a surface If *0*, *1*, *2*, the scatter points are filled with a Delaunay surface about the x, y, z respectively.

=cut

has surfaceaxis => (
    is => 'rw',
    documentation => "If *-1*, the scatter points are not fill with a surface If *0*, *1*, *2*, the scatter points are filled with a Delaunay surface about the x, y, z respectively.",
);

=item * surfacecolor

Sets the surface fill color.

=cut

has surfacecolor => (
    is => 'rw',
    documentation => "Sets the surface fill color.",
);

=item * text

Sets text elements associated with each (x,y,z) triplet. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y,z) coordinates.

=cut

has text => (
    is => 'rw',
    isa => "Maybe[ArrayRef]|Str",
    documentation => "Sets text elements associated with each (x,y,z) triplet. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y,z) coordinates.",
);

=item * textfont

Sets the text font.

=cut

has textfont => (
    is => 'rw',
    documentation => "Sets the text font.",
);

=item * textposition

Sets the positions of the `text` elements with respects to the (x,y) coordinates.

=cut

has textposition => (
    is => 'rw',
    documentation => "Sets the positions of the `text` elements with respects to the (x,y) coordinates.",
);

=item * x

Sets the x coordinates.

=cut

has x => (
    is => 'rw',
    documentation => "Sets the x coordinates.",
);

=item * y

Sets the y coordinates.

=cut

has y => (
    is => 'rw',
    documentation => "Sets the y coordinates.",
);

=item * z

Sets the z coordinates.

=cut

has z => (
    is => 'rw',
    documentation => "Sets the z coordinates.",
);

=item * name

Sets the trace name

=cut

has name => (
    is => 'rw',
    isa => "Str",
    documentation => "Sets the trace name",
);

=pod

=back

=cut


=head2 type

Trace type.

=cut

sub type {
	my @components = split(/::/, __PACKAGE__);
	return lc($components[-1]);
}


__PACKAGE__->meta->make_immutable();
1;
