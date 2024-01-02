FROM thevlang/vlang:debian-dev AS builder

WORKDIR /app
RUN v up
RUN apt update
COPY . .
RUN make install
RUN make build
RUN make test