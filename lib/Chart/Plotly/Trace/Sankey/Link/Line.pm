package Chart::Plotly::Trace::Sankey::Link::Line;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}



# VERSION

=encoding utf-8

=head1 NAME 

Chart::Plotly::Trace::Sankey::Link::Line

=head1 SYNOPSIS

# EXAMPLE: examples/traces/sankey.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace sankey.

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#sankey>

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

Sets the color of the `line` around each `link`.

=cut

has color => (
    is => "rw",
    isa => "Maybe[ArrayRef]",
    documentation => "Sets the color of the `line` around each `link`.",
);

=item * colorsrc

Sets the source reference on plot.ly for  color .

=cut

has colorsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  color .",
);

=item * width

Sets the width (in px) of the `line` around each `link`.

=cut

has width => (
    is => "rw",
    isa => "Num|ArrayRef[Num]",
    documentation => "Sets the width (in px) of the `line` around each `link`.",
);

=item * widthsrc

Sets the source reference on plot.ly for  width .

=cut

has widthsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  width .",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
