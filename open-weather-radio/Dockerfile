ARG BUILD_FROM
FROM $BUILD_FROM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]


ARG BUILD_ARCH

ARG DEBIAN_FRONTEND=noninteractive

#Install Prereqs
RUN apt-get update && apt-get install -y cmake wget pulseaudio
RUN apt-get install --no-install-recommends --yes \ 
    curl \
    tzdata  \
    git  \
    python3  \
    python3-pip \
    rtl-sdr  \
    vlc \
    sox

RUN python3 -m pip install --upgrade setuptools && python3 -m pip install paho-mqtt
#Install Open Weather Radio dependicies
#Install multimon-ng
RUN wget https://github.com/EliasOenal/multimon-ng/archive/1.1.9.tar.gz && tar -xvf 1.1.9.tar.gz
RUN cd multimon-ng-1.1.9 && \
    mkdir build && cd build && \
    cmake .. && \
    make && \
    make install
#Install dsame
RUN git clone https://github.com/Jpeterson37/dsame.git && \
    cp dsame/dsame.py /usr/local/bin/ && cp dsame/defs.py /usr/local/bin/ && \
    chmod +x /usr/local/bin/dsame.py && chmod +x /usr/local/bin/defs.py

#Instll Open Weather Radio
RUN git clone https://github.com/JP-Tek-Services/open_weather_radio.git && \
    cp -r open_weather_radio/root/* /
RUN rm -rf open_weather_radio

#VLC user for ogg http stream
RUN useradd -m vlcuser

#http ogg stream port
EXPOSE 8080

ENV feq=162.550M
ENV gain=40
ENV ppm=0
ENV mqttsvr=
ENV mqttport=
ENV mqttusr=
ENV mqttpwd=

COPY run.sh /
CMD [ "/run.sh" ]

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Open Weather Radio" \
    io.hass.description="Addon to run Open Weather Radio with Home Assistant" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Joshua Peterson <https://github.com/Jpeterson37>" \
    org.opencontainers.image.title="Open Weather Radio" \
    org.opencontainers.image.description="Addon to run Open Weather Radio with Home Assistant" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="Joshua Peterson <https://github.com/Jpeterson37>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/JP-Tek-Services/home_assistant_addons" \
    org.opencontainers.image.source="https://github.com/JP-Tek-Services/addon-open-weather-radio" \
    org.opencontainers.image.documentation="https://github.com/JP-Tek-Services/addon-open-weather-radio/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}

