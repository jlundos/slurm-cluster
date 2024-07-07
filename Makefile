.PHONY: images master-image node-image jupyter-image clean allclean

images: master-image node-image jupyter-image Makefile

master-image:
	cd master && $(MAKE)

node-image:
	cd node && $(MAKE)

jupyter-image:
	cd jupyter && $(MAKE)

clean:
	docker system prune

allclean:
	docker system prune -a
	cd master && $(MAKE) allclean
	cd node && $(MAKE) allclean
	cd jupyter && $(MAKE) allclean
