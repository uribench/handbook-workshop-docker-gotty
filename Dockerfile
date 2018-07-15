FROM python:3.6-alpine

WORKDIR /app

ENV PS1 "\n\n> \W \$ "
ENV TERM=linux
ENV PACKAGES bash git openssh

RUN apk --no-cache add $PACKAGES

ENV GOTTY_BINARY https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_386.tar.gz

RUN wget $GOTTY_BINARY -O gotty.tar.gz && \
    tar -xzf gotty.tar.gz -C /usr/local/bin/ && \
    rm gotty.tar.gz && \
    chmod +x /usr/local/bin/gotty

RUN pip install handbook-tools

COPY app .
COPY files/home/ /root/
RUN chmod 600 ~/.ssh/id_rsa

RUN git clone https://github.com/uribench/handbook-workshop.git

ENTRYPOINT ["gotty"]
CMD ["--permit-write", "--reconnect", "bash"]

EXPOSE 3000
