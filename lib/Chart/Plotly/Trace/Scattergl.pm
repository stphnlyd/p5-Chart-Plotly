package Chart::Plotly::Trace::Scattergl;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Scattergl::Error_x;
use Chart::Plotly::Trace::Scattergl::Error_y;
use Chart::Plotly::Trace::Scattergl::Hoverlabel;
use Chart::Plotly::Trace::Scattergl::Line;
use Chart::Plotly::Trace::Scattergl::Marker;
use Chart::Plotly::Trace::Scattergl::Selected;
use Chart::Plotly::Trace::Scattergl::Stream;
use Chart::Plotly::Trace::Scattergl::Transform;
use Chart::Plotly::Trace::Scattergl::Unselected;


# VERSION

# ABSTRACT: The data visualized as scatter point or lines is set in `x` and `y` using the WebGL plotting engine. Bubble charts are achieved by setting `marker.size` and/or `marker.color` to a numerical arrays.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/scattergl.pl

=head1 DESCRIPTION

The data visualized as scatter point or lines is set in `x` and `y` using the WebGL plotting engine. Bubble charts are achieved by setting `marker.size` and/or `marker.color` to a numerical arrays.

Screenshot of the above example:

=begin HTML

<p>
<img src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/scattergl.png" alt="Screenshot of the above example">
</p>

=end HTML

=begin markdown

![Screenshot of the above example](https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/scattergl.png)

=end markdown

=begin HTML

<p>
<iframe src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/scattergl.html" style="border:none;" width="80%" height="520"></iframe>
</p>

=end HTML

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#scattergl>

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

=item * dx

Sets the x coordinate step. See `x0` for more info.

=cut

has dx => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the x coordinate step. See `x0` for more info.",
);

=item * dy

Sets the y coordinate step. See `y0` for more info.

=cut

has dy => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the y coordinate step. See `y0` for more info.",
);

=item * error_x


=cut

has error_x => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattergl::Error_x",
);

=item * error_y


=cut

has error_y => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattergl::Error_y",
);

=item * fill

Sets the area to fill with a solid color. Use with `fillcolor` if not *none*. *tozerox* and *tozeroy* fill to x=0 and y=0 respectively. *tonextx* and *tonexty* fill between the endpoints of this trace and the endpoints of the trace before it, connecting those endpoints with straight lines (to make a stacked area graph); if there is no trace before it, they behave like *tozerox* and *tozeroy*. *toself* connects the endpoints of the trace (or each segment of the trace if it has gaps) into a closed shape. *tonext* fills the space between two traces if one completely encloses the other (eg consecutive contour lines), and behaves like *toself* if there is no trace before it. *tonext* should not be used if one trace does not enclose the other.

=cut

has fill => (
    is => "rw",
    isa => enum(["none","tozeroy","tozerox","tonexty","tonextx","toself","tonext"]),
    documentation => "Sets the area to fill with a solid color. Use with `fillcolor` if not *none*. *tozerox* and *tozeroy* fill to x=0 and y=0 respectively. *tonextx* and *tonexty* fill between the endpoints of this trace and the endpoints of the trace before it, connecting those endpoints with straight lines (to make a stacked area graph); if there is no trace before it, they behave like *tozerox* and *tozeroy*. *toself* connects the endpoints of the trace (or each segment of the trace if it has gaps) into a closed shape. *tonext* fills the space between two traces if one completely encloses the other (eg consecutive contour lines), and behaves like *toself* if there is no trace before it. *tonext* should not be used if one trace does not enclose the other.",
);

=item * fillcolor

Sets the fill color. Defaults to a half-transparent variant of the line color, marker color, or marker line color, whichever is available.

=cut

has fillcolor => (
    is => "rw",
    documentation => "Sets the fill color. Defaults to a half-transparent variant of the line color, marker color, or marker line color, whichever is available.",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattergl::Hoverlabel",
);

=item * hoveron

Do the hover effects highlight individual points (markers or line points) or do they highlight filled regions? If the fill is *toself* or *tonext* and there are no markers or text, then the default is *fills*, otherwise it is *points*.

=cut

has hoveron => (
    is => "rw",
    documentation => "Do the hover effects highlight individual points (markers or line points) or do they highlight filled regions? If the fill is *toself* or *tonext* and there are no markers or text, then the default is *fills*, otherwise it is *points*.",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattergl::Line",
);

=item * marker


=cut

has marker => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattergl::Marker",
);

=item * mode

Determines the drawing mode for this scatter trace.

=cut

has mode => (
    is => "rw",
    documentation => "Determines the drawing mode for this scatter trace.",
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

=item * selected


=cut

has selected => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattergl::Selected",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattergl::Stream",
);

=item * text

Sets text elements associated with each (x,y) pair to appear on hover. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y) coordinates.

=cut

has text => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Sets text elements associated with each (x,y) pair to appear on hover. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y) coordinates.",
);

=item * textsrc

Sets the source reference on plot.ly for  text .

=cut

has textsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  text .",
);

=item * transforms


=cut

has transforms => (
    is => "rw",
    isa => "ArrayRef|ArrayRef[Chart::Plotly::Trace::Scattergl::Transform]",
);

=item * uid


=cut

has uid => (
    is => "rw",
    isa => "Str",
);

=item * unselected


=cut

has unselected => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattergl::Unselected",
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

=item * x0

Alternate to `x`. Builds a linear space of x coordinates. Use with `dx` where `x0` is the starting coordinate and `dx` the step.

=cut

has x0 => (
    is => "rw",
    isa => "Any",
    documentation => "Alternate to `x`. Builds a linear space of x coordinates. Use with `dx` where `x0` is the starting coordinate and `dx` the step.",
);

=item * xaxis

Sets a reference between this trace's x coordinates and a 2D cartesian x axis. If *x* (the default value), the x coordinates refer to `layout.xaxis`. If *x2*, the x coordinates refer to `layout.xaxis2`, and so on.

=cut

has xaxis => (
    is => "rw",
    documentation => "Sets a reference between this trace's x coordinates and a 2D cartesian x axis. If *x* (the default value), the x coordinates refer to `layout.xaxis`. If *x2*, the x coordinates refer to `layout.xaxis2`, and so on.",
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

=item * y0

Alternate to `y`. Builds a linear space of y coordinates. Use with `dy` where `y0` is the starting coordinate and `dy` the step.

=cut

has y0 => (
    is => "rw",
    isa => "Any",
    documentation => "Alternate to `y`. Builds a linear space of y coordinates. Use with `dy` where `y0` is the starting coordinate and `dy` the step.",
);

=item * yaxis

Sets a reference between this trace's y coordinates and a 2D cartesian y axis. If *y* (the default value), the y coordinates refer to `layout.yaxis`. If *y2*, the y coordinates refer to `layout.yaxis2`, and so on.

=cut

has yaxis => (
    is => "rw",
    documentation => "Sets a reference between this trace's y coordinates and a 2D cartesian y axis. If *y* (the default value), the y coordinates refer to `layout.yaxis`. If *y2*, the y coordinates refer to `layout.yaxis2`, and so on.",
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

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
