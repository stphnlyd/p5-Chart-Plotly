package Chart::Plotly::Trace::Scatter3d;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Scatter3d::Error_x;
use Chart::Plotly::Trace::Scatter3d::Error_y;
use Chart::Plotly::Trace::Scatter3d::Error_z;
use Chart::Plotly::Trace::Scatter3d::Hoverlabel;
use Chart::Plotly::Trace::Scatter3d::Line;
use Chart::Plotly::Trace::Scatter3d::Marker;
use Chart::Plotly::Trace::Scatter3d::Projection;
use Chart::Plotly::Trace::Scatter3d::Stream;
use Chart::Plotly::Trace::Scatter3d::Textfont;


# VERSION

=encoding utf-8

=head1 NAME 

Chart::Plotly::Trace::Scatter3d

=head1 SYNOPSIS

# EXAMPLE: examples/traces/scatter3d.pl

=head1 DESCRIPTION

The data visualized as scatter point or lines in 3D dimension is set in `x`, `y`, `z`. Text (appearing either on the chart or on hover only) is via `text`. Bubble charts are achieved by setting `marker.size` and/or `marker.color` Projections are achieved via `projection`. Surface fills are achieved via `surfaceaxis`.

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

=head2 type

Trace type.

=cut

sub type {
	my @components = split(/::/, __PACKAGE__);
	return lc($components[-1]);
}

=head1 ATTRIBUTES

=over

=cut

=item * connectgaps

Determines whether or not gaps (i.e. {nan} or missing values) in the provided data arrays are connected.

=cut

has connectgaps => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines whether or not gaps (i.e. {nan} or missing values) in the provided data arrays are connected.",
);

=item * customdata

Assigns extra data each datum. This may be useful when listening to hover, click and selection events. Note that, *scatter* traces also appends customdata items in the markers DOM elements

=cut

has customdata => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Assigns extra data each datum. This may be useful when listening to hover, click and selection events. Note that, *scatter* traces also appends customdata items in the markers DOM elements",
);

=item * customdatasrc

Sets the source reference on plot.ly for  customdata .

=cut

has customdatasrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  customdata .",
);

=item * error_x


=cut

has error_x => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scatter3d::Error_x",
);

=item * error_y


=cut

has error_y => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scatter3d::Error_y",
);

=item * error_z


=cut

has error_z => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scatter3d::Error_z",
);

=item * hoverinfo

Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.

=cut

has hoverinfo => (
    is => "rw",
    isa => "Maybe[ArrayRef]",
    documentation => "Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.",
);

=item * hoverinfosrc

Sets the source reference on plot.ly for  hoverinfo .

=cut

has hoverinfosrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  hoverinfo .",
);

=item * hoverlabel


=cut

has hoverlabel => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scatter3d::Hoverlabel",
);

=item * hovertext

Sets text elements associated with each (x,y,z) triplet. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y,z) coordinates. To be seen, trace `hoverinfo` must contain a *text* flag.

=cut

has hovertext => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Sets text elements associated with each (x,y,z) triplet. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y,z) coordinates. To be seen, trace `hoverinfo` must contain a *text* flag.",
);

=item * hovertextsrc

Sets the source reference on plot.ly for  hovertext .

=cut

has hovertextsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  hovertext .",
);

=item * ids

Assigns id labels to each datum. These ids for object constancy of data points during animation. Should be an array of strings, not numbers or any other type.

=cut

has ids => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Assigns id labels to each datum. These ids for object constancy of data points during animation. Should be an array of strings, not numbers or any other type.",
);

=item * idssrc

Sets the source reference on plot.ly for  ids .

=cut

has idssrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  ids .",
);

=item * legendgroup

Sets the legend group for this trace. Traces part of the same legend group hide/show at the same time when toggling legend items.

=cut

has legendgroup => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the legend group for this trace. Traces part of the same legend group hide/show at the same time when toggling legend items.",
);

=item * line


=cut

has line => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scatter3d::Line",
);

=item * marker


=cut

has marker => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scatter3d::Marker",
);

=item * mode

Determines the drawing mode for this scatter trace. If the provided `mode` includes *text* then the `text` elements appear at the coordinates. Otherwise, the `text` elements appear on hover. If there are less than 20 points, then the default is *lines+markers*. Otherwise, *lines*.

=cut

has mode => (
    is => "rw",
    documentation => "Determines the drawing mode for this scatter trace. If the provided `mode` includes *text* then the `text` elements appear at the coordinates. Otherwise, the `text` elements appear on hover. If there are less than 20 points, then the default is *lines+markers*. Otherwise, *lines*.",
);

=item * name

Sets the trace name. The trace name appear as the legend item and on hover.

=cut

has name => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the trace name. The trace name appear as the legend item and on hover.",
);

=item * opacity

Sets the opacity of the trace.

=cut

has opacity => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the opacity of the trace.",
);

=item * projection


=cut

has projection => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scatter3d::Projection",
);

=item * scene

Sets a reference between this trace's 3D coordinate system and a 3D scene. If *scene* (the default value), the (x,y,z) coordinates refer to `layout.scene`. If *scene2*, the (x,y,z) coordinates refer to `layout.scene2`, and so on.

=cut

has scene => (
    is => "rw",
    documentation => "Sets a reference between this trace's 3D coordinate system and a 3D scene. If *scene* (the default value), the (x,y,z) coordinates refer to `layout.scene`. If *scene2*, the (x,y,z) coordinates refer to `layout.scene2`, and so on.",
);

=item * selectedpoints

Array containing integer indices of selected points. Has an effect only for traces that support selections. Note that an empty array means an empty selection where the `unselected` are turned on for all points, whereas, any other non-array values means no selection all where the `selected` and `unselected` styles have no effect.

=cut

has selectedpoints => (
    is => "rw",
    isa => "Any",
    documentation => "Array containing integer indices of selected points. Has an effect only for traces that support selections. Note that an empty array means an empty selection where the `unselected` are turned on for all points, whereas, any other non-array values means no selection all where the `selected` and `unselected` styles have no effect.",
);

=item * showlegend

Determines whether or not an item corresponding to this trace is shown in the legend.

=cut

has showlegend => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines whether or not an item corresponding to this trace is shown in the legend.",
);

=item * stream


=cut

has stream => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scatter3d::Stream",
);

=item * surfaceaxis

If *-1*, the scatter points are not fill with a surface If *0*, *1*, *2*, the scatter points are filled with a Delaunay surface about the x, y, z respectively.

=cut

has surfaceaxis => (
    is => "rw",
    documentation => "If *-1*, the scatter points are not fill with a surface If *0*, *1*, *2*, the scatter points are filled with a Delaunay surface about the x, y, z respectively.",
);

=item * surfacecolor

Sets the surface fill color.

=cut

has surfacecolor => (
    is => "rw",
    documentation => "Sets the surface fill color.",
);

=item * text

Sets text elements associated with each (x,y,z) triplet. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y,z) coordinates. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.

=cut

has text => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Sets text elements associated with each (x,y,z) triplet. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y,z) coordinates. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.",
);

=item * textfont


=cut

has textfont => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scatter3d::Textfont",
);

=item * textposition

Sets the positions of the `text` elements with respects to the (x,y) coordinates.

=cut

has textposition => (
    is => "rw",
    isa => union([enum(["top left","top center","top right","middle left","middle center","middle right","bottom left","bottom center","bottom right"]), "ArrayRef"]),
    documentation => "Sets the positions of the `text` elements with respects to the (x,y) coordinates.",
);

=item * textpositionsrc

Sets the source reference on plot.ly for  textposition .

=cut

has textpositionsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  textposition .",
);

=item * textsrc

Sets the source reference on plot.ly for  text .

=cut

has textsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  text .",
);

=item * uid


=cut

has uid => (
    is => "rw",
    isa => "Str",
);

=item * visible

Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).

=cut

has visible => (
    is => "rw",
    documentation => "Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).",
);

=item * x

Sets the x coordinates.

=cut

has x => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the x coordinates.",
);

=item * xcalendar

Sets the calendar system to use with `x` date data.

=cut

has xcalendar => (
    is => "rw",
    isa => enum(["gregorian","chinese","coptic","discworld","ethiopian","hebrew","islamic","julian","mayan","nanakshahi","nepali","persian","jalali","taiwan","thai","ummalqura"]),
    documentation => "Sets the calendar system to use with `x` date data.",
);

=item * xsrc

Sets the source reference on plot.ly for  x .

=cut

has xsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  x .",
);

=item * y

Sets the y coordinates.

=cut

has y => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the y coordinates.",
);

=item * ycalendar

Sets the calendar system to use with `y` date data.

=cut

has ycalendar => (
    is => "rw",
    isa => enum(["gregorian","chinese","coptic","discworld","ethiopian","hebrew","islamic","julian","mayan","nanakshahi","nepali","persian","jalali","taiwan","thai","ummalqura"]),
    documentation => "Sets the calendar system to use with `y` date data.",
);

=item * ysrc

Sets the source reference on plot.ly for  y .

=cut

has ysrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  y .",
);

=item * z

Sets the z coordinates.

=cut

has z => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the z coordinates.",
);

=item * zcalendar

Sets the calendar system to use with `z` date data.

=cut

has zcalendar => (
    is => "rw",
    isa => enum(["gregorian","chinese","coptic","discworld","ethiopian","hebrew","islamic","julian","mayan","nanakshahi","nepali","persian","jalali","taiwan","thai","ummalqura"]),
    documentation => "Sets the calendar system to use with `z` date data.",
);

=item * zsrc

Sets the source reference on plot.ly for  z .

=cut

has zsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  z .",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
