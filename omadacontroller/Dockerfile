from mbentley/omada-controller:5.1
RUN mv /entrypoint.sh entrypoint_orig.sh
COPY entrypoint_wrapper.sh /entrypoint.sh
COPY backup.sh /backup.sh
