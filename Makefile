install:
	# installing commands
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black *.py mylib/*.py

lint:
	pylint --disable=R,C *.py mylib/*.py

deploy:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 492094906798.dkr.ecr.us-east-1.amazonaws.com
	docker build -t arithmetic-fastapi-microservice .
	docker tag arithmetic-fastapi-microservice:latest 492094906798.dkr.ecr.us-east-1.amazonaws.com/arithmetic-fastapi-microservice:latest
	docker push 492094906798.dkr.ecr.us-east-1.amazonaws.com/arithmetic-fastapi-microservice:latest

all: install format lint deploy