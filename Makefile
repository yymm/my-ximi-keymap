setup:
	git clone https://github.com/sadekbaroudi/qmk_firmware.git

build_right:
	docker compose run --rm --build build_right

build_left:
	docker compose run --rm --build build_left
