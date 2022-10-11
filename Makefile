.PHONY: test run dist clean

build:
	@virtualenv --system-site-packages support
	@support/bin/pip install -r requirements.txt
	@virtualenv --relocatable support

test:
	@PYTHONPATH=. bin/nosetests --with-xunit -vdw test

dist: test
	@test -d dist || mkdir dist
	@tar cvzf dist/app.tgz app run_* Makefile *ini support

clean:
	rm -rf dist

fullclean:
	rm -rf dist support

run:
	@./run_dev.py
