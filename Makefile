.EXPORT_ALL_VARIABLES

SHELL = /bin/bash
PRGNAM=olsr-viz-lite
VERSION=git_$(date +%Y.%m.%d)_$(git rev-parse --short HEAD)
## Variables that should be inherited from the parent Makefile or the environment
# MODULEDIR - the directory where finished modules should but stored
# ARCH - from the build environment
# BYZBUILD - Byzantium build version
# MODEXT - module extension (should be '.xzm')
##

# high level targets
.PHONY : build module install clean dist-clean

build:
	echo 'The build target is a noop for this module.'

install:
	$(INSTALL) README $(DESTDIR)/usr/share/doc/olsr-viz
	$(INSTALL) -d $(DESTDIR)/opt/olsr-viz-lite \
		$(DESTDIR)/opt/olsr-viz-lite/cgi-bin \
		$(DESTDIR)/opt/olsr-viz-lite/resources
	$(INSTALL) index.html $(DESTDIR)/opt/olsr-viz-lite
	$(INSTALL) olsr-viz.js $(DESTDIR)/opt/olsr-viz-lite/resources
	$(INSTALL_DIR) olsr-viz $(DESTDIR)/opt/olsr-viz-lite/resources
	$(INSTALL_EXEC) *.sh $(DESTDIR)/opt/olsr-viz-lite/cgi-bin
	$(INSTALL_EXEC) self_serve.py $(DESTDIR)/opt/olsr-viz-lite

module: install
	dir2xzm $(DESTDIR) $(MODULEDIR)/$(PRGNAM)$(VERSION)-$(ARCH)-$(BYZBUILD).$(MODEXT)

clean:
	# Do *not* remove $(DESTDIR)! If the build is for a monolithic module that will remove everything from every build.
	$(CLEAN) $(DESTDIR)/usr/share/doc/olsr-viz
	$(CLEAN) $(DESTDIR)/opt/olsr-viz-lite
	
dist-clean: clean
	$(CLEAN) $(MODULEDIR)/$(PRGNAM)$(VERSION)-$(ARCH)-$(BYZBUILD).$(MODEXT)
