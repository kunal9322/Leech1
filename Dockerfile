FROM FROM debian:11
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get upgrade -y
RUN apt -qq update --fix-missing && \
    apt -qq install -y mediainfo

COPY . .

CMD python3 update.py && python3 -m bot
