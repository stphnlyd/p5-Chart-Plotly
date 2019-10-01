package Chart::Plotly::Trace::Parcoords;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Parcoords::Dimension;
use Chart::Plotly::Trace::Parcoords::Domain;
use Chart::Plotly::Trace::Parcoords::Labelfont;
use Chart::Plotly::Trace::Parcoords::Line;
use Chart::Plotly::Trace::Parcoords::Rangefont;
use Chart::Plotly::Trace::Parcoords::Stream;
use Chart::Plotly::Trace::Parcoords::Tickfont;
use Chart::Plotly::Trace::Parcoords::Transform;


# VERSION

# ABSTRACT: Parallel coordinates for multidimensional exploratory data analysis. The samples are specified in `dimensions`. The colors are set in `line.color`.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/parcoords.pl

=head1 DESCRIPTION

Parallel coordinates for multidimensional exploratory data analysis. The samples are specified in `dimensions`. The colors are set in `line.color`.

Screenshot of the above example:

=begin HTML

<p>
<img src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/parcoords.png" alt="Screenshot of the above example">
</p>

=end HTML

=begin markdown

![Screenshot of the above example](https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/parcoords.png)

=end markdown

=begin HTML

<p>
<iframe src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/parcoords.html" style="border:none;" width="80%" height="520"></iframe>
</p>

=end HTML

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#parcoords>

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

=item * dimensions


=cut

has dimensions => (
    is => "rw",
    isa => "ArrayRef|ArrayRef[Chart::Plotly::Trace::Parcoords::Dimension]",
);

=item * domain


=cut

has domain => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Parcoords::Domain",
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

=item * labelangle

Sets the angle of the labels with respect to the horizontal. For example, a `tickangle` of -90 draws the labels vertically. Tilted labels with *labelangle* may be positioned better inside margins when `labelposition` is set to *bottom*.

=cut

has labelangle => (
    is => "rw",
    documentation => "Sets the angle of the labels with respect to the horizontal. For example, a `tickangle` of -90 draws the labels vertically. Tilted labels with *labelangle* may be positioned better inside margins when `labelposition` is set to *bottom*.",
);

=item * labelfont


=cut

has labelfont => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Parcoords::Labelfont",
);

=item * labelside

Specifies the location of the `label`. *top* positions labels above, next to the title *bottom* positions labels below the graph Tilted labels with *labelangle* may be positioned better inside margins when `labelposition` is set to *bottom*.

=cut

has labelside => (
    is => "rw",
    isa => enum(["top","bottom"]),
    documentation => "Specifies the location of the `label`. *top* positions labels above, next to the title *bottom* positions labels below the graph Tilted labels with *labelangle* may be positioned better inside margins when `labelposition` is set to *bottom*.",
);

=item * line


=cut

has line => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Parcoords::Line",
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

=item * rangefont


=cut

has rangefont => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Parcoords::Rangefont",
);

=item * stream


=cut

has stream => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Parcoords::Stream",
);

=item * tickfont


=cut

has tickfont => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Parcoords::Tickfont",
);

=item * transforms


=cut

has transforms => (
    is => "rw",
    isa => "ArrayRef|ArrayRef[Chart::Plotly::Trace::Parcoords::Transform]",
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
