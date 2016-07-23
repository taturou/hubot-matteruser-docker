FROM node:latest

RUN npm install -g yo generator-hubot coffee-script hubot-matteruser

RUN useradd -m -d /home/hubot -s /bin/bash hubot \
&& echo "hubot:hubot" | chpasswd
RUN echo "hubot ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER hubot
WORKDIR /home/hubot

RUN yo hubot --name="bot" --description="bot" --owner="bot@example.com" --adapter="matteruser" --defaults

RUN npm install hubot-reload-scripts --save
RUN sed -i '2s/^/  "hubot-reload-scripts",\n/' external-scripts.json

CMD bin/hubot --name "${HUBOT_NAME}" --adapter "matteruser"

EXPOSE 8080
