.PHONY: images base-image master-image node-image jupyter-image clean allclean

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

allclean:
	docker system prune -a
	cd base && $(MAKE) allclean
	cd master && $(MAKE) allclean
	cd node && $(MAKE) allclean
	cd jupyter && $(MAKE) allclean
