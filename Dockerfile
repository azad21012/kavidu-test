FROM python:3.8

# Adding trusting keys to apt for repositories
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

# Adding Google Chrome to the repositories
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Updating apt to see and install Google Chrome
RUN apt-get -y update

# Magic happens
RUN apt-get install -y google-chrome-stable

# Installing Unzip
RUN apt-get install -yqq unzip

# Download the Chrome Driver
RUN CHROMEDRIVER_VERSION=92.0.4515.107
RUN wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/92.0.4515.107/chromedriver_linux64.zip

# Unzip the Chrome Driver into /usr/local/bin directory

# Set display port as an environment variable
ENV DISPLAY=:99

RUN pip install --upgrade pip
COPY . /app
WORKDIR /app
RUN pip install -r requirement.txt

RUN unzip /tmp/chromedriver.zip chromedriver -d /app


CMD ["python" , "./script.py"]