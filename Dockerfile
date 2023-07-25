FROM gapsystem/gap-docker

RUN sudo pip3 install ipywidgets RISE

RUN jupyter-nbextension install rise --user --py

RUN jupyter-nbextension enable rise --user --py

# Update version number each time after gap-docker container is updated
ENV GAP_VERSION 4.11.1

USER gap

# install FSR and FFCSA packages
WORKDIR /home/gap/inst/gap-${GAP_VERSION}/pkg

RUN wget https://github.com/nzidaric/fsr/archive/refs/heads/master.zip \
    && unzip master.zip \
    && rm master.zip \
    && mv fsr-master fsr

RUN wget https://github.com/nzidaric/ffcsa/archive/refs/heads/main.zip \
    && unzip main.zip \
    && rm main.zip \
    && mv ffcsa-main ffcsa

WORKDIR /home/gap/inst/gap-${GAP_VERSION}/pkg/ffcsa

