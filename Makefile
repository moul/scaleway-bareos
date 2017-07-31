NAME =			bareos
VERSION =		latest
VERSION_ALIASES =	15.2 15
TITLE =			Bareos Server
DESCRIPTION =		Backup your files to Bareos Server
SOURCE_URL =		https://github.com/moul/scaleway-bareos
VENDOR_URL =		https://www.bareos.org/en/
DOCUMENTATION_URL =	https://www.bareos.org/en/documentation.html
DEFAULT_IMAGE_ARCH =	x86_64

IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT =	stable
IMAGE_NAME =		Bareos Server

## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
-include docker-rules.mk
