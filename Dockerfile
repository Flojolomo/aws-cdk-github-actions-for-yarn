FROM alpine:3.17

RUN apk --update --no-cache add nodejs npm python3 py3-pip jq curl bash git docker && \
	ln -sf /usr/bin/python3 /usr/bin/python

RUN npm install -g corepack
RUN corepack enable

COPY --from=golang:alpine /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:${PATH}"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
