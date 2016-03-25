class people::indika::applications::fuse(
  $version = '2.8.0',
){

  package { 'OSXFuse':
    source   => "http://internode.dl.sourceforge.net/project/osxfuse/osxfuse-${version}/osxfuse-${version}.dmg",
    provider => 'pkgdmg'
  }
}


#http://downloads.sourceforge.net/project/catacombae/NTFS-3G%20for%20Mac%20OS%20X/2010.10.2/ntfs-3g-2010.10.2-macosx.dmg?r=http%3A%2F%2Fmacntfs-3g.blogspot.com.au%2F2010%2F10%2Fntfs-3g-for-mac-os-x-2010102.html&ts=1437188984&use_mirror=internode
