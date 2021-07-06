FROM alpine
ENV SHOW_VOLUME_LIST_BEFORE="true"
ENV CLEAR_BEFORE="false"
ENV SHOW_LOCAL_LIST_BEFORE="true"
ENV SHOW_VOLUME_LIST_AFTER="true"
ENV DRY_RUN="true"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
VOLUME [ "/volume", "/local"]
ENTRYPOINT [ "/entrypoint.sh" ]
