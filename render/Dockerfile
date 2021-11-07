# FROM minlag/mermaid-cli
# ENV PATH="/home/mermaidcli/node_modules/.bin/:${PATH}"
# ADD mmdc.json /mmdc.json
# ADD render.sh /render.sh
# USER root
# ENTRYPOINT ["/render.sh"]

FROM node:latest
RUN apt update && apt install -f -y gconf-service libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxss1 libxtst6 libnss3 libasound2 libatk1.0-0 libc6 ca-certificates fonts-liberation2 lsb-release xdg-utils wget libgbm-dev fonts-noto-color-emoji fonts-takao
# RUN useradd -ms /bin/bash mermaidcli
# USER mermaidcli
RUN npm install --global @mermaid-js/mermaid-cli
ADD puppeteer-config.json  /puppeteer-config.json
ADD mmdc.json /mmdc.json
ADD render.sh /render.sh
ENTRYPOINT ["/render.sh"]
