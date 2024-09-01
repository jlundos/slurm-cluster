.PHONY: images base-image master-image node-image jupyter-image clean allclean reallyallclean

images: master-image node-image jupyter-image

base-image: Makefile
	cd base && $(MAKE)

master-image: base-image
	cd master && $(MAKE)

node-image: base-image
	cd node && $(MAKE)

jupyter-image: base-image
	cd jupyter && $(MAKE)

clean:
	docker system prune
	cd shared && $(MAKE) clean

allclean:
	docker system prune -a
	cd base && $(MAKE) allclean
	cd master && $(MAKE) allclean
	cd node && $(MAKE) allclean
	cd jupyter && $(MAKE) allclean

reallyallclean: allclean
	# Be carefull - will clean ALL containers, images, volumes, etc....
	# Also stuff unrelated to this project
	# But docker seem to have a bug where it doesn't correctly remove old unused layers, images, etc.,
	# so in particular /var/lib/docker/overlay2 grows to two digit GB sizes that doesn't get cleaned up by allclean
	rm -rf /var/lib/docker/* && apt install --reinstall docker.io
