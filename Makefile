NAME =			bacula
VERSION =		latest
VERSION_ALIASES =
TITLE =			Bacula Server
DESCRIPTION =		Backup your files to Bacula Server
SOURCE_URL =		https://github.com/scaleway-community/scaleway-bacula
VENDOR_URL =		http://www.bacula.org
DOCUMENTATION_URL =	http://blog.bacula.org/documentation/
DEFAULT_IMAGE_ARCH =	x86_64

IMAGE_VOLUME_SIZE =	150G
IMAGE_BOOTSCRIPT =	stable
IMAGE_NAME =		Bacula Server

## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
