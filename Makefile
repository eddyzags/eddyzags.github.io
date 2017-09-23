all:
	site-up

site-recreate: site-stop site-build site-up

site-up:
	docker run -d --net host eddyzags/blog:latest

site-build:
	docker build -t eddyzags/blog:latest .

site-stop:
	docker rm $$(docker stop $$(docker ps -a -q --filter ancestor=eddyzags/blog:latest --format="{{.ID}}"))

site-clean:
	docker rm eddyzags/blog:latest
