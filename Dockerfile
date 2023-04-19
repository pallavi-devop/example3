# docker/backend/Dockerfile
FROM python:3.10.4-slim
# set working directory
RUN mkdir -p /usr/src/
# set working directory
WORKDIR /usr/src/

# update and install dependencies
RUN apt-get update

ADD . /usr/src/
# add requirements (to leverage Docker cache)
ADD ./app/requirements.txt /usr/src/requirements.txt
# install requirements
RUN python -m pip install --upgrade pip
RUN pip install --no-cache -r requirements.txt
RUN pip freeze > requirements.txt

# add entrypoint.sh
ADD ./entrypoint.sh /usr/src/entrypoint.sh

# give execution rights on the entrypoint
RUN chmod +x /usr/src/entrypoint.sh

# run server
CMD ["sh", "entrypoint.sh"]
