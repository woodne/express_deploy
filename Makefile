app_dir = /data/apps/hello_world
temp_install_dir = /tmp/hello_world

install:
	sudo mkdir -p $(app_dir)
	sudo cp -r ./*  $(app_dir)
	sudo cp ./hello_world.conf /etc/init/hello_world.conf
	cd $(app_dir)
	npm install

deploy:
	sudo rm -rf $(temp_install_dir)
	cp -r . $(temp_install_dir)
	cd $(temp_install_dir)
	make install
	make start_app

start_app:
	sudo start --no-wait -q hello_world
