use strict;
use warnings;
use Image::Magick;

my $p = Image::Magick->new();

sub fixRatio($$) {
    my ($w, $h) = @_;

    my $ratio = $w > 0.9*$h ? 6/4.0 : 4/6.0;
    print "$ratio w/h: " . $w/$h . "\n";
    if($w/$h > $ratio) {
        # too wide
        print "1 ";
        return $w, $w/$ratio
    } else {
        # too tall
        print "2 ";
        return $h*$ratio, $h
    }
}

foreach my $img (@ARGV) {
    my $new=$img;
    $new=~s/o_//;
    $p->Read($img);
    my $w = $p->Get('width');
    my $h = $p->Get('height');

    my $new_w;
    my $new_h;
    ($new_w, $new_h) = fixRatio($w, $h);

    my $xoffset = ($new_w - $w) / 2;
    my $yoffset = ($new_h - $h) / 2;
    print "$img $new $w $h -> $new_w $new_h $xoffset $yoffset\n";
    $p->Extent('width' => $new_w, 'height' => $new_h, 'background' => 'white', 'geometry' => "${new_w}x${new_h}-${xoffset}-${yoffset}");
    $p->Write($new);


    @$p = ();
}
