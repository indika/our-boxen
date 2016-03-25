class people::indika::applications::wireshark (

) {

# Need a whole bunch of packages
#brew install ccache d-bus fontconfig freetype gettext glib gmp icu4c libffi libpng libtasn1 libtiff pkg-config xz hicolor-icon-theme gsettings-desktop-schemas c-ares lua portaudio geoip gnutls libgcrypt atk pixman


# Need XQuartz

# Some crazy shti
# this may be needed by gtk+3 install (at least on my system with a previous installation)
# brew link --overwrite gsettings-desktop-schemas


# compile the rest of GTK+ 3 related libraries
# brew install --build-from-source at-spi2-core at-spi2-atk cairo harfbuzz pango gtk+3 gtk+ librsvg gnome-icon-theme wireshark --without-x --without-x11 --with-gtk+3

}
