##
# The "standard" vdo nightly build.
#
# $Id$
##
package NightlyBuildType::VDO;

use strict;
use warnings FATAL => qw(all);

use English qw(-no_match_vars);
use Log::Log4perl;

use Permabit::Assertions qw(assertNumArgs);

use NightlyRunRules;

use base qw(NightlyBuildType::Single NightlyBuildType::VDOBuilder);

# Log4perl Logging object
my $log = Log::Log4perl->get_logger(__PACKAGE__);

# The following are tests that need to be run nightly.
my $SUITE_PROPERTIES = {
  perlLocalTests => {
    displayName => "Perl_Local_Tests",
    suiteName   => "",
    type        => "perl",
  },
  udsPerformanceTests => {
    displayName => "UDS_Performance_Tests",
    suiteName   => "performance",
    extraArgs   => "--threads=5",
    type        => "uds",
  },
  udsTests => {
    displayName => "UDS_Nightly_Tests",
    suiteName   => "nightly",
    extraArgs   => "--clientClass=PFARM --threads=5",
    type        => "uds",
  },
# XXX OPS-6500
#  vdoLocalKmemleakTests => {
#    displayName => "VDO_Local_Kmemleak_Tests",
#    suiteName   => "kmemleak",
#    scale       => "FARM",
#  },
  vdoLocalTests => {
    displayName => "VDO_Local_Tests",
    suiteName   => "localTests",
    extraArgs   => "--threads=5",
  },
  vdoLocalUpgradeTests => {
    displayName => "VDO_Local_Upgrade_Tests",
    suiteName   => "localUpgradeTests",
    scale       => "ALBIREO-PMI",
    extraArgs   => "--clientClass=ALBIREO-PMI",
  },
  vdoPerfTests => {
    displayName => "VDO_Perf_Tests",
    suiteName   => "nightlyVDOPerfTests",
    scale       => "VDO-PMI",
    extraArgs   => "--clientClass=VDO-PMI",
  },
# VDO-5512
#  vdoRawhideTests => {
#    displayName  => "VDO_Latest_Kernel_Tests",
#    suiteName    => "rawhideTests",
#    scale        => "PFARM",
#    extraArgs    => "--clientClass=PFARM",
#    osClasses    => ["RAWHIDE"],
#  },
  vdoDebugKernelTests => {
    displayName  => "VDO_Debug_Kernel_Tests",
    suiteName    => "debugKernelTests",
    scale        => "PFARM",
    extraArgs    => "--clientClass=PFARM",
    osClasses    => ["RHEL9DEBUG"],
  },
  vdoSingle => {
    displayName => "VDO_Single_Threaded_Tests",
    suiteName   => "",
    scale       => "PFARM",
    extraArgs   => "--clientClass=PFARM"
                   . " --hashZoneThreadCount=1"
                   . " --logicalThreadCount=1"
                   . " --physicalThreadCount=1",
  },
  vdoTests => {
    displayName => "VDO_Tests",
    suiteName   => "",
    scale       => "PFARM",
    extraArgs   => "--clientClass=PFARM",
  },
  vdoValgrind => {
    displayName => "VDO_Valgrind_Tests",
    suiteName   => "valgrindTests",
    scale       => "PFARM",
    extraArgs   => "--clientClass=PFARM",
  },
};

######################################################################
# Get the hash of distinct test suites to run.
##
sub getSuiteProperties {
  my ($self) = assertNumArgs(1, @_);
  return $SUITE_PROPERTIES;
}

######################################################################
# Get the map of test suites to run.
##
sub getSuitesImplementation {
  my ($self) = assertNumArgs(1, @_);
  return generateTestSuites($self->getSuiteProperties(), $DEFAULT_OS_CLASSES);
}

1;
