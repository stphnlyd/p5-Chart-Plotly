package Chart::Plotly::Trace::Funnelarea;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Funnelarea::Domain;
use Chart::Plotly::Trace::Funnelarea::Hoverlabel;
use Chart::Plotly::Trace::Funnelarea::Insidetextfont;
use Chart::Plotly::Trace::Funnelarea::Marker;
use Chart::Plotly::Trace::Funnelarea::Stream;
use Chart::Plotly::Trace::Funnelarea::Textfont;
use Chart::Plotly::Trace::Funnelarea::Title;
use Chart::Plotly::Trace::Funnelarea::Transform;


# VERSION

# ABSTRACT: Visualize stages in a process using area-encoded trapezoids. This trace can be used to show data in a part-to-whole representation similar to a "pie" trace, wherein each item appears in a single stage. See also the "funnel" trace type for a different approach to visualizing funnel data.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/funnelarea.pl

=head1 DESCRIPTION

Visualize stages in a process using area-encoded trapezoids. This trace can be used to show data in a part-to-whole representation similar to a "pie" trace, wherein each item appears in a single stage. See also the "funnel" trace type for a different approach to visualizing funnel data.

Screenshot of the above example:

=begin HTML

<p>
<img src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/funnelarea.png" alt="Screenshot of the above example">
</p>

=end HTML

=begin markdown

![Screenshot of the above example](https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/funnelarea.png)

=end markdown

=begin HTML

<p>
<iframe src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/funnelarea.html" style="border:none;" width="80%" height="520"></iframe>
</p>

=end HTML

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#funnelarea>

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
    my $plotly_meta = delete $hash{'pmeta'};
    if (defined $plotly_meta) {
        $hash{'meta'} = $plotly_meta;
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

=item * aspectratio

Sets the ratio between height and width

=cut

has aspectratio => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the ratio between height and width",
);

=item * baseratio

Sets the ratio between bottom length and maximum top length.

=cut

has baseratio => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the ratio between bottom length and maximum top length.",
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

=item * dlabel

Sets the label step. See `label0` for more info.

=cut

has dlabel => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the label step. See `label0` for more info.",
);

=item * domain


=cut

has domain => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Funnelarea::Domain",
);

=item * hoverinfo

Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.

=cut

has hoverinfo => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Funnelarea::Hoverlabel",
);

=item * hovertemplate

Template string used for rendering the information that appear on hover box. Note that this will override `hoverinfo`. Variables are inserted using %{variable}, for example "y: %{y}". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example "Price: %{y:$.2f}". https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format for details on the formatting syntax. The variables available in `hovertemplate` are the ones emitted as event data described at this link https://plot.ly/javascript/plotlyjs-events/#event-data. Additionally, every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available. variables `label`, `color`, `value`, `percent` and `text`. Anything contained in tag `<extra>` is displayed in the secondary box, for example "<extra>{fullData.name}</extra>". To hide the secondary box completely, use an empty tag `<extra></extra>`.

=cut

has hovertemplate => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Template string used for rendering the information that appear on hover box. Note that this will override `hoverinfo`. Variables are inserted using %{variable}, for example \"y: %{y}\". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example \"Price: %{y:\$.2f}\". https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format for details on the formatting syntax. The variables available in `hovertemplate` are the ones emitted as event data described at this link https://plot.ly/javascript/plotlyjs-events/#event-data. Additionally, every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available. variables `label`, `color`, `value`, `percent` and `text`. Anything contained in tag `<extra>` is displayed in the secondary box, for example \"<extra>{fullData.name}</extra>\". To hide the secondary box completely, use an empty tag `<extra></extra>`.",
);

=item * hovertemplatesrc

Sets the source reference on plot.ly for  hovertemplate .

=cut

has hovertemplatesrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  hovertemplate .",
);

=item * hovertext

Sets hover text elements associated with each sector. If a single string, the same string appears for all data points. If an array of string, the items are mapped in order of this trace's sectors. To be seen, trace `hoverinfo` must contain a *text* flag.

=cut

has hovertext => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Sets hover text elements associated with each sector. If a single string, the same string appears for all data points. If an array of string, the items are mapped in order of this trace's sectors. To be seen, trace `hoverinfo` must contain a *text* flag.",
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

=item * insidetextfont


=cut

has insidetextfont => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Funnelarea::Insidetextfont",
);

=item * label0

Alternate to `labels`. Builds a numeric set of labels. Use with `dlabel` where `label0` is the starting label and `dlabel` the step.

=cut

has label0 => (
    is => "rw",
    isa => "Num",
    documentation => "Alternate to `labels`. Builds a numeric set of labels. Use with `dlabel` where `label0` is the starting label and `dlabel` the step.",
);

=item * labels

Sets the sector labels. If `labels` entries are duplicated, we sum associated `values` or simply count occurrences if `values` is not provided. For other array attributes (including color) we use the first non-empty entry among all occurrences of the label.

=cut

has labels => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the sector labels. If `labels` entries are duplicated, we sum associated `values` or simply count occurrences if `values` is not provided. For other array attributes (including color) we use the first non-empty entry among all occurrences of the label.",
);

=item * labelssrc

Sets the source reference on plot.ly for  labels .

=cut

has labelssrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  labels .",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Funnelarea::Marker",
);

=item * pmeta

Assigns extra meta information associated with this trace that can be used in various text attributes. Attributes such as trace `name`, graph, axis and colorbar `title.text`, annotation `text` `rangeselector`, `updatemenues` and `sliders` `label` text all support `meta`. To access the trace `meta` values in an attribute in the same trace, simply use `%{meta[i]}` where `i` is the index or key of the `meta` item in question. To access trace `meta` in layout attributes, use `%{data[n[.meta[i]}` where `i` is the index or key of the `meta` and `n` is the trace index.

=cut

has pmeta => (
    is => "rw",
    isa => "Any|ArrayRef[Any]",
    documentation => "Assigns extra meta information associated with this trace that can be used in various text attributes. Attributes such as trace `name`, graph, axis and colorbar `title.text`, annotation `text` `rangeselector`, `updatemenues` and `sliders` `label` text all support `meta`. To access the trace `meta` values in an attribute in the same trace, simply use `%{meta[i]}` where `i` is the index or key of the `meta` item in question. To access trace `meta` in layout attributes, use `%{data[n[.meta[i]}` where `i` is the index or key of the `meta` and `n` is the trace index.",
);

=item * metasrc

Sets the source reference on plot.ly for  meta .

=cut

has metasrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  meta .",
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

=item * scalegroup

If there are multiple funnelareas that should be sized according to their totals, link them by providing a non-empty group id here shared by every trace in the same group.

=cut

has scalegroup => (
    is => "rw",
    isa => "Str",
    documentation => "If there are multiple funnelareas that should be sized according to their totals, link them by providing a non-empty group id here shared by every trace in the same group.",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Funnelarea::Stream",
);

=item * text

Sets text elements associated with each sector. If trace `textinfo` contains a *text* flag, these elements will be seen on the chart. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.

=cut

has text => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets text elements associated with each sector. If trace `textinfo` contains a *text* flag, these elements will be seen on the chart. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.",
);

=item * textfont


=cut

has textfont => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Funnelarea::Textfont",
);

=item * textinfo

Determines which trace information appear on the graph.

=cut

has textinfo => (
    is => "rw",
    isa => "Str",
    documentation => "Determines which trace information appear on the graph.",
);

=item * textposition

Specifies the location of the `textinfo`.

=cut

has textposition => (
    is => "rw",
    isa => union([enum(["inside","none"]), "ArrayRef"]),
    documentation => "Specifies the location of the `textinfo`.",
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

=item * title


=cut

has title => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Funnelarea::Title",
);

=item * transforms


=cut

has transforms => (
    is => "rw",
    isa => "ArrayRef|ArrayRef[Chart::Plotly::Trace::Funnelarea::Transform]",
);

=item * uid

Assign an id to this trace, Use this to provide object constancy between traces during animations and transitions.

=cut

has uid => (
    is => "rw",
    isa => "Str",
    documentation => "Assign an id to this trace, Use this to provide object constancy between traces during animations and transitions.",
);

=item * uirevision

Controls persistence of some user-driven changes to the trace: `constraintrange` in `parcoords` traces, as well as some `editable: true` modifications such as `name` and `colorbar.title`. Defaults to `layout.uirevision`. Note that other user-driven trace attribute changes are controlled by `layout` attributes: `trace.visible` is controlled by `layout.legend.uirevision`, `selectedpoints` is controlled by `layout.selectionrevision`, and `colorbar.(x|y)` (accessible with `config: {editable: true}`) is controlled by `layout.editrevision`. Trace changes are tracked by `uid`, which only falls back on trace index if no `uid` is provided. So if your app can add/remove traces before the end of the `data` array, such that the same trace has a different index, you can still preserve user-driven changes if you give each trace a `uid` that stays with it as it moves.

=cut

has uirevision => (
    is => "rw",
    isa => "Any",
    documentation => "Controls persistence of some user-driven changes to the trace: `constraintrange` in `parcoords` traces, as well as some `editable: true` modifications such as `name` and `colorbar.title`. Defaults to `layout.uirevision`. Note that other user-driven trace attribute changes are controlled by `layout` attributes: `trace.visible` is controlled by `layout.legend.uirevision`, `selectedpoints` is controlled by `layout.selectionrevision`, and `colorbar.(x|y)` (accessible with `config: {editable: true}`) is controlled by `layout.editrevision`. Trace changes are tracked by `uid`, which only falls back on trace index if no `uid` is provided. So if your app can add/remove traces before the end of the `data` array, such that the same trace has a different index, you can still preserve user-driven changes if you give each trace a `uid` that stays with it as it moves.",
);

=item * values

Sets the values of the sectors. If omitted, we count occurrences of each label.

=cut

has values => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the values of the sectors. If omitted, we count occurrences of each label.",
);

=item * valuessrc

Sets the source reference on plot.ly for  values .

=cut

has valuessrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  values .",
);

=item * visible

Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).

=cut

has visible => (
    is => "rw",
    documentation => "Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
