
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Extract module requirements from MYMETA files",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Capture::Tiny" => 0,
    "File::Find" => 0,
    "File::Spec::Functions" => 0,
    "File::Temp" => 0,
    "File::pushd" => 0,
    "Test::Deep" => 0,
    "Test::More" => "0.92"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-mymeta_requires",
  "EXE_FILES" => [
    "bin/mymeta-requires"
  ],
  "LICENSE" => "apache",
  "NAME" => "App::mymeta_requires",
  "PREREQ_PM" => {
    "CPAN::Meta" => 0,
    "CPAN::Meta::Requirements" => 0,
    "Class::Load" => 0,
    "File::Basename" => 0,
    "Getopt::Lucid" => 0,
    "Log::Dispatchouli" => 0,
    "Object::Tiny" => 0,
    "Pod::Usage" => 0,
    "autodie" => "2.00",
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.003",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



