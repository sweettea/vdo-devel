##
# A hash which describes the statistics from auto-generated code.
#
# @synopsis
#
#     use Permabit::Statistics::Definitions
#     $VDO_STATISTICS_DEFINITIONS->{StatisticsVersion}
#
# @description
#
# This package provides a hashref which describes all of the
# fields from a set of statistics.
##
package Permabit::Statistics::Definitions;

use strict;

use base qw(Exporter);

our @EXPORT = qw($VDO_STATISTICS_DEFINITIONS);

our $VDO_STATISTICS_DEFINITIONS = {
                                'VDOStats' => [
                                                [
                                                  'version',
                                                  'constant',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'data blocks used',
                                                  'snapshot',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'overhead blocks used',
                                                  'snapshot',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'logical blocks used',
                                                  'snapshot',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'physical blocks',
                                                  'constant',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'logical blocks',
                                                  'constant',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  '1K-blocks',
                                                  'snapshot',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  '1K-blocks used',
                                                  'snapshot',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  '1K-blocks available',
                                                  'snapshot',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'used percent',
                                                  'state',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'saving percent',
                                                  'state',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'block map cache size',
                                                  'constant',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'block size',
                                                  'constant',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'completed recovery count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'read-only recovery count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'operating mode',
                                                  'constant',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'recovery progress (%)',
                                                  'state',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'compressed fragments written',
                                                  'counter',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'compressed blocks written',
                                                  'counter',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'compressed fragments in packer',
                                                  'snapshot',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'slab count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'slabs opened',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'slabs reopened',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal disk full count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal commits requested count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal entries batching',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal entries started',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal entries writing',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal entries written',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal entries committed',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal blocks batching',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal blocks started',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal blocks writing',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal blocks written',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'journal blocks committed',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'slab journal disk full count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'slab journal flush count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'slab journal blocked count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'slab journal blocks written',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'slab journal tail busy count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'slab summary blocks written',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'reference blocks written',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map dirty pages',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map clean pages',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map free pages',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map failed pages',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map incoming pages',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map outgoing pages',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map cache pressure',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map read count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map write count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map failed reads',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map failed writes',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map reclaimed',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map read outgoing',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map found in cache',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map discard required',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map wait for page',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map fetch required',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map pages loaded',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map pages saved',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'block map flush count',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'dedupe advice valid',
                                                  'counter',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'dedupe advice stale',
                                                  'counter',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'concurrent data matches',
                                                  'counter',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'concurrent hash collisions',
                                                  'counter',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'current dedupe queries',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'invalid advice PBN count',
                                                  'snapshot',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'no space error count',
                                                  'snapshot',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'read only error count',
                                                  'snapshot',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'instance',
                                                  'constant',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  '512 byte emulation',
                                                  'constant',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'current VDO IO requests in progress',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'maximum VDO IO requests in progress',
                                                  'maximum',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'dedupe advice timeouts',
                                                  'counter',
                                                  'Blocks',
                                                  undef
                                                ],
                                                [
                                                  'flush out',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'write amplification ratio',
                                                  'snapshot',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'bios in read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in partial read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in partial write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in partial empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in partial discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in partial flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in partial fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out completed read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out completed write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out completed empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out completed discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out completed flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios out completed fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta completed read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta completed write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta completed empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta completed discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta completed flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios meta completed fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal completed read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal completed write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal completed empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal completed discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal completed flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios journal completed fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache completed read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache completed write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache completed empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache completed discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache completed flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios page cache completed fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged partial read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged partial write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged partial empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged partial discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged partial flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios acknowledged partial fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in progress read',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in progress write',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in progress empty flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in progress discard',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in progress flush',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'bios in progress fua',
                                                  'counter',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'KVDO module bytes used',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'KVDO module peak bytes used',
                                                  'snapshot',
                                                  'Count',
                                                  undef
                                                ],
                                                [
                                                  'entries indexed',
                                                  'counter',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'posts found',
                                                  'counter',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'posts not found',
                                                  'counter',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'queries found',
                                                  'counter',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'queries not found',
                                                  'counter',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'updates found',
                                                  'counter',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'updates not found',
                                                  'counter',
                                                  undef,
                                                  undef
                                                ],
                                                [
                                                  'entries discarded',
                                                  'counter',
                                                  undef,
                                                  undef
                                                ]
                                              ],
                                'StatisticsVersion' => '36'
                              };

1;
