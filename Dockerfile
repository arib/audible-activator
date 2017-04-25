FROM debian:jessie

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends \
	ca-certificates  \
	unzip \
	wget  \
	python-pip && \        
        apt-get clean

WORKDIR /scripts

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	google-chrome-stable && \
	apt-get clean

RUN wget -q -O https://chromedriver.storage.googleapis.com/2.29/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip

RUN pip install requests
RUN pip install selenium


CMD "/bin/bash"

