FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    binutils-arm-none-eabi \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    && rm -rf /var/lib/apt/lists/*

ENV BUILD_HOME=/build

RUN mkdir $BUILD_HOME
WORKDIR $BUILD_HOME

RUN python3 -m venv ${BUILD_HOME}/venv

RUN . ${BUILD_HOME}/venv/bin/activate

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install qmk

# RUN make fingerpunch/ximi/v1:default FP_CIRQUE_LEFT_TRACKBALL_RIGHT=yes RGB_MATRIX_ENABLE=yes FP_EC11=yes FP_SPLIT_LEFT=yes
# RUN make fingerpunch/ximi/v1:default FP_CIRQUE_LEFT_TRACKBALL_RIGHT=yes RGB_MATRIX_ENABLE=yes FP_EC11=yes FP_SPLIT_RIGHT=yes

RUN echo '#!/bin/bash\n\
source ${BUILD_HOME}/venv/bin/activate\n\
exec "$@"' > /entrypoint.sh && chmod +x /entrypoint.sh

COPY build.sh ${BUILD_HOME}/build.sh
RUN chmod +x ${BUILD_HOME}/build.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
