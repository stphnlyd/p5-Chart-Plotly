package Chart::Plotly::Trace::Scatterternary;
use Moose;

use Chart::Plotly::Trace::Attribute::Line;
use Chart::Plotly::Trace::Attribute::Marker;


# VERSION

=encoding utf-8

=head1 NAME 

Chart::Plotly::Trace::Scatterternary

=head1 SYNOPSIS

# EXAMPLE: examples/traces/scatterternary.pl

=head1 DESCRIPTION

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#scatterternary>

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

=item * a

Sets the quantity of component `a` in each data point. If `a`, `b`, and `c` are all provided, they need not be normalized, only the relative values matter. If only two arrays are provided they must be normalized to match `ternary<i>.sum`.

=cut

has a => (
    is => 'rw',
    documentation => "Sets the quantity of component `a` in each data point. If `a`, `b`, and `c` are all provided, they need not be normalized, only the relative values matter. If only two arrays are provided they must be normalized to match `ternary<i>.sum`.",
);

=item * b

Sets the quantity of component `a` in each data point. If `a`, `b`, and `c` are all provided, they need not be normalized, only the relative values matter. If only two arrays are provided they must be normalized to match `ternary<i>.sum`.

=cut

has b => (
    is => 'rw',
    documentation => "Sets the quantity of component `a` in each data point. If `a`, `b`, and `c` are all provided, they need not be normalized, only the relative values matter. If only two arrays are provided they must be normalized to match `ternary<i>.sum`.",
);

=item * c

Sets the quantity of component `a` in each data point. If `a`, `b`, and `c` are all provided, they need not be normalized, only the relative values matter. If only two arrays are provided they must be normalized to match `ternary<i>.sum`.

=cut

has c => (
    is => 'rw',
    documentation => "Sets the quantity of component `a` in each data point. If `a`, `b`, and `c` are all provided, they need not be normalized, only the relative values matter. If only two arrays are provided they must be normalized to match `ternary<i>.sum`.",
);

=item * connectgaps

Determines whether or not gaps (i.e. {nan} or missing values) in the provided data arrays are connected.

=cut

has connectgaps => (
    is => 'rw',
    isa => "Bool",
    documentation => "Determines whether or not gaps (i.e. {nan} or missing values) in the provided data arrays are connected.",
);

=item * fill

Sets the area to fill with a solid color. Use with `fillcolor` if not *none*. scatterternary has a subset of the options available to scatter. *toself* connects the endpoints of the trace (or each segment of the trace if it has gaps) into a closed shape. *tonext* fills the space between two traces if one completely encloses the other (eg consecutive contour lines), and behaves like *toself* if there is no trace before it. *tonext* should not be used if one trace does not enclose the other.

=cut

has fill => (
    is => 'rw',
    documentation => "Sets the area to fill with a solid color. Use with `fillcolor` if not *none*. scatterternary has a subset of the options available to scatter. *toself* connects the endpoints of the trace (or each segment of the trace if it has gaps) into a closed shape. *tonext* fills the space between two traces if one completely encloses the other (eg consecutive contour lines), and behaves like *toself* if there is no trace before it. *tonext* should not be used if one trace does not enclose the other.",
);

=item * fillcolor

Sets the fill color. Defaults to a half-transparent variant of the line color, marker color, or marker line color, whichever is available.

=cut

has fillcolor => (
    is => 'rw',
    documentation => "Sets the fill color. Defaults to a half-transparent variant of the line color, marker color, or marker line color, whichever is available.",
);

=item * hoverinfo

Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.

=cut

has hoverinfo => (
    is => 'rw',
    documentation => "Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.",
);

=item * hoveron

Do the hover effects highlight individual points (markers or line points) or do they highlight filled regions? If the fill is *toself* or *tonext* and there are no markers or text, then the default is *fills*, otherwise it is *points*.

=cut

has hoveron => (
    is => 'rw',
    documentation => "Do the hover effects highlight individual points (markers or line points) or do they highlight filled regions? If the fill is *toself* or *tonext* and there are no markers or text, then the default is *fills*, otherwise it is *points*.",
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

=item * sum

The number each triplet should sum to, if only two of `a`, `b`, and `c` are provided. This overrides `ternary<i>.sum` to normalize this specific trace, but does not affect the values displayed on the axes. 0 (or missing) means to use ternary<i>.sum

=cut

has sum => (
    is => 'rw',
    isa => "Num",
    documentation => "The number each triplet should sum to, if only two of `a`, `b`, and `c` are provided. This overrides `ternary<i>.sum` to normalize this specific trace, but does not affect the values displayed on the axes. 0 (or missing) means to use ternary<i>.sum",
);

=item * text

Sets text elements associated with each (a,b,c) point. If a single string, the same string appears over all the data points. If an array of strings, the items are mapped in order to the the data points in (a,b,c).

=cut

has text => (
    is => 'rw',
    isa => "Maybe[ArrayRef]|Str",
    documentation => "Sets text elements associated with each (a,b,c) point. If a single string, the same string appears over all the data points. If an array of strings, the items are mapped in order to the the data points in (a,b,c).",
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
