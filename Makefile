obj-m += src/

Version=2.6.0.0
ModName=rt3290sta

TAR=tar
RM=rm -fr
RPMBUILD=rpmbuild
MKDIR=mkdir
CP= cp -a
CD=cd
DKMS=dkms
SourceDir=$(ModName)-$(Version)
SourceTar=/usr/src/redhat/SOURCES/$(ModName)-$(Version).tar.gz

all:
	$(MAKE) -C ./src 

install:
	$(MAKE) -C ./src/ install

dkms-install:
	$(DKMS) install -m $(ModName) -v $(Version)

clean:
	$(MAKE) -C ./src/ clean
	$(RM) ./src/tags ./src/cscope.out ./src/cscope.*.out

dkms:
	$(MAKE) -C ./src/ clean
	$(DKMS) remove -m $(ModName) -v $(Version) --all
	$(RM) /usr/src/$(SourceDir)
	$(MKDIR) /usr/src/$(SourceDir)
	$(CP) ./* /usr/src/$(SourceDir)
	$(DKMS) add -m $(ModName) -v $(Version)
	$(DKMS) build -m $(ModName) -v $(Version)
	$(DKMS) mkdeb -m $(ModName) -v $(Version)


