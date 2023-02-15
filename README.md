# Django-todo
A simple todo app Dockerised follow the steps to deploy application using docker.

# First step clone the Repo.
```bash
git clone https://github.com/jrapolug/django-todo.git
```
# change directory to cloned repo
```bash
$ cd django-todo
```
# now build the docker image with the cloned repo
```bash
$ docker build . -t todo-app
```
# now run the application using docker run
```bash
$ docker run -d -p 8000:8000 --name todo-container todo-app
```
# open your browser and go to 

https://localhost:8000/

cheers and happy day :)
