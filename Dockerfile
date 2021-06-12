# inherit prebuilt image
FROM frost2k5/dragonheart:latest

# env setup
RUN mkdir /demon && chmod 777 /demon
ENV PATH="/demon/bin:$PATH"
WORKDIR /demon

# clone repo
RUN git clone https://github.com/FrosT2k5/BlackHeart -b monster /demon

# Copies session and config(if it exists)
COPY ./sample_config.env ./userbot.session* ./config.env* /demon/

#transfer
RUN curl -sL https://git.io/file-transfer | sh

# install required pypi modules
RUN pip3 install -r requirements.txt

# Finalization
CMD ["python3","-m","userbot"]
