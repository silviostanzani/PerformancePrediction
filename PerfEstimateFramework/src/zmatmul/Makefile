
all: zmatmullow zmatmul miczmattr zmattr

zmattr: zmattr.c zorder2d.c timer.c
	icc -xhost -O3 -fp-model fast=2 -qopenmp -lrt $^ -o $@

miczmattr: zmattr.c zorder2d.c timer.c
	icc -xhost -O3 -fp-model fast=2 -qopenmp -lrt $^ -o $@

zmatmul: zmatmul.c zorder2d.c timer.c
	icc -xhost -qopt-zmm-usage=low -O3 -fp-model fast=2 -qopenmp -lrt $^ -o $@

zmatmullow: zmatmul.c zorder2d.c timer.c
	icc -xhost -qopt-zmm-usage=high -O3 -fp-model fast=2 -qopenmp -lrt $^ -o $@

clean:
	rm zmatmul zmattr zmatmullow miczmattr
