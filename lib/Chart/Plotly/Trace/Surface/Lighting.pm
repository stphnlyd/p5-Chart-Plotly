package Chart::Plotly::Trace::Surface::Lighting;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}



# VERSION

=encoding utf-8

=head1 NAME 

Chart::Plotly::Trace::Surface::Lighting

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

=item * ambient

Ambient light increases overall color visibility but can wash out the image.

=cut

has ambient => (
    is => "rw",
    isa => "Num",
    documentation => "Ambient light increases overall color visibility but can wash out the image.",
);

=item * diffuse

Represents the extent that incident rays are reflected in a range of angles.

=cut

has diffuse => (
    is => "rw",
    isa => "Num",
    documentation => "Represents the extent that incident rays are reflected in a range of angles.",
);

=item * fresnel

Represents the reflectance as a dependency of the viewing angle; e.g. paper is reflective when viewing it from the edge of the paper (almost 90 degrees), causing shine.

=cut

has fresnel => (
    is => "rw",
    isa => "Num",
    documentation => "Represents the reflectance as a dependency of the viewing angle; e.g. paper is reflective when viewing it from the edge of the paper (almost 90 degrees), causing shine.",
);

=item * roughness

Alters specular reflection; the rougher the surface, the wider and less contrasty the shine.

=cut

has roughness => (
    is => "rw",
    isa => "Num",
    documentation => "Alters specular reflection; the rougher the surface, the wider and less contrasty the shine.",
);

=item * specular

Represents the level that incident rays are reflected in a single direction, causing shine.

=cut

has specular => (
    is => "rw",
    isa => "Num",
    documentation => "Represents the level that incident rays are reflected in a single direction, causing shine.",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;