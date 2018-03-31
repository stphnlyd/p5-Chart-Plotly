package Chart::Plotly::Trace::Scatterternary::Textfont;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}



# VERSION

=encoding utf-8

=head1 NAME 

Chart::Plotly::Trace::Scatterternary::Textfont

=head1 SYNOPSIS

# EXAMPLE: examples/traces/scatterternary.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace scatterternary.

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


=cut

has color => (
    is => "rw",
    isa => "Maybe[ArrayRef]",
);

=item * colorsrc

Sets the source reference on plot.ly for  color .

=cut

has colorsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  color .",
);

=item * description


=cut

has description => (
    is => "ro",
    default => "Sets the text font.",
);

=item * family

HTML font family - the typeface that will be applied by the web browser. The web browser will only be able to apply a font if it is available on the system which it operates. Provide multiple font families, separated by commas, to indicate the preference in which to apply fonts if they aren't available on the system. The plotly service (at https://plot.ly or on-premise) generates images on a server, where only a select number of fonts are installed and supported. These include *Arial*, *Balto*, *Courier New*, *Droid Sans*,, *Droid Serif*, *Droid Sans Mono*, *Gravitas One*, *Old Standard TT*, *Open Sans*, *Overpass*, *PT Sans Narrow*, *Raleway*, *Times New Roman*.

=cut

has family => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "HTML font family - the typeface that will be applied by the web browser. The web browser will only be able to apply a font if it is available on the system which it operates. Provide multiple font families, separated by commas, to indicate the preference in which to apply fonts if they aren't available on the system. The plotly service (at https://plot.ly or on-premise) generates images on a server, where only a select number of fonts are installed and supported. These include *Arial*, *Balto*, *Courier New*, *Droid Sans*,, *Droid Serif*, *Droid Sans Mono*, *Gravitas One*, *Old Standard TT*, *Open Sans*, *Overpass*, *PT Sans Narrow*, *Raleway*, *Times New Roman*.",
);

=item * familysrc

Sets the source reference on plot.ly for  family .

=cut

has familysrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  family .",
);

=item * size


=cut

has size => (
    is => "rw",
    isa => "Num|ArrayRef[Num]",
);

=item * sizesrc

Sets the source reference on plot.ly for  size .

=cut

has sizesrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  size .",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
