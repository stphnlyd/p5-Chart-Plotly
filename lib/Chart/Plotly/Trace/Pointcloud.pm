package Chart::Plotly::Trace::Pointcloud;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Pointcloud::Hoverlabel;
use Chart::Plotly::Trace::Pointcloud::Marker;
use Chart::Plotly::Trace::Pointcloud::Stream;


# VERSION

=encoding utf-8

=head1 NAME 

Chart::Plotly::Trace::Pointcloud

=head1 SYNOPSIS

# EXAMPLE: examples/traces/pointcloud.pl

=head1 DESCRIPTION

The data visualized as a point cloud set in `x` and `y` using the WebGl plotting engine.

Screenshot of the above example:

=begin HTML

<p>
<img src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/pointcloud.png" alt="Screenshot of the above example">
</p>

=end HTML

=begin markdown

![Screenshot of the above example](https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/pointcloud.png)

=end markdown

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#pointcloud>

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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Pointcloud::Hoverlabel",
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

=item * indices

A sequential value, 0..n, supply it to avoid creating this array inside plotting. If specified, it must be a typed `Int32Array` array. Its length must be equal to or greater than the number of points. For the best performance and memory use, create one large `indices` typed array that is guaranteed to be at least as long as the largest number of points during use, and reuse it on each `Plotly.restyle()` call.

=cut

has indices => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "A sequential value, 0..n, supply it to avoid creating this array inside plotting. If specified, it must be a typed `Int32Array` array. Its length must be equal to or greater than the number of points. For the best performance and memory use, create one large `indices` typed array that is guaranteed to be at least as long as the largest number of points during use, and reuse it on each `Plotly.restyle()` call.",
);

=item * indicessrc

Sets the source reference on plot.ly for  indices .

=cut

has indicessrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  indices .",
);

=item * legendgroup

Sets the legend group for this trace. Traces part of the same legend group hide/show at the same time when toggling legend items.

=cut

has legendgroup => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the legend group for this trace. Traces part of the same legend group hide/show at the same time when toggling legend items.",
);

=item * marker


=cut

has marker => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Pointcloud::Marker",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Pointcloud::Stream",
);

=item * text

Sets text elements associated with each (x,y) pair. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y) coordinates. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.

=cut

has text => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Sets text elements associated with each (x,y) pair. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y) coordinates. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.",
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

=item * xaxis

Sets a reference between this trace's x coordinates and a 2D cartesian x axis. If *x* (the default value), the x coordinates refer to `layout.xaxis`. If *x2*, the x coordinates refer to `layout.xaxis2`, and so on.

=cut

has xaxis => (
    is => "rw",
    documentation => "Sets a reference between this trace's x coordinates and a 2D cartesian x axis. If *x* (the default value), the x coordinates refer to `layout.xaxis`. If *x2*, the x coordinates refer to `layout.xaxis2`, and so on.",
);

=item * xbounds

Specify `xbounds` in the shape of `[xMin, xMax] to avoid looping through the `xy` typed array. Use it in conjunction with `xy` and `ybounds` for the performance benefits.

=cut

has xbounds => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Specify `xbounds` in the shape of `[xMin, xMax] to avoid looping through the `xy` typed array. Use it in conjunction with `xy` and `ybounds` for the performance benefits.",
);

=item * xboundssrc

Sets the source reference on plot.ly for  xbounds .

=cut

has xboundssrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  xbounds .",
);

=item * xsrc

Sets the source reference on plot.ly for  x .

=cut

has xsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  x .",
);

=item * xy

Faster alternative to specifying `x` and `y` separately. If supplied, it must be a typed `Float32Array` array that represents points such that `xy[i * 2] = x[i]` and `xy[i * 2 + 1] = y[i]`

=cut

has xy => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Faster alternative to specifying `x` and `y` separately. If supplied, it must be a typed `Float32Array` array that represents points such that `xy[i * 2] = x[i]` and `xy[i * 2 + 1] = y[i]`",
);

=item * xysrc

Sets the source reference on plot.ly for  xy .

=cut

has xysrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  xy .",
);

=item * y

Sets the y coordinates.

=cut

has y => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the y coordinates.",
);

=item * yaxis

Sets a reference between this trace's y coordinates and a 2D cartesian y axis. If *y* (the default value), the y coordinates refer to `layout.yaxis`. If *y2*, the y coordinates refer to `layout.xaxis2`, and so on.

=cut

has yaxis => (
    is => "rw",
    documentation => "Sets a reference between this trace's y coordinates and a 2D cartesian y axis. If *y* (the default value), the y coordinates refer to `layout.yaxis`. If *y2*, the y coordinates refer to `layout.xaxis2`, and so on.",
);

=item * ybounds

Specify `ybounds` in the shape of `[yMin, yMax] to avoid looping through the `xy` typed array. Use it in conjunction with `xy` and `xbounds` for the performance benefits.

=cut

has ybounds => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Specify `ybounds` in the shape of `[yMin, yMax] to avoid looping through the `xy` typed array. Use it in conjunction with `xy` and `xbounds` for the performance benefits.",
);

=item * yboundssrc

Sets the source reference on plot.ly for  ybounds .

=cut

has yboundssrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  ybounds .",
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
