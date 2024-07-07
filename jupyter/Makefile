.PHONY: allclean

image_done: Makefile Dockerfile docker-entrypoint.sh cgroup.conf slurm.conf
	docker buildx build -t slurm-jupyter:latest --no-cache .
	touch image_done

allclean:
	-rm image_done
