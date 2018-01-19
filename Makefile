.PHONY: compile clean run_tests


run_tests:
	python test/fribidi.py


compile:
	cython pyfribidi/fribidi.pyx
	python setup.py build_ext --inplace


install: compile
	python setup.py install