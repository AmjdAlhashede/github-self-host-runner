FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl sudo git jq libicu-dev \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m runner
USER runner
WORKDIR /home/runner

RUN mkdir actions-runner && cd actions-runner \
    && curl -o actions-runner-linux-x64-2.316.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.316.1/actions-runner-linux-x64-2.316.1.tar.gz \
    && tar xzf ./actions-runner-linux-x64-2.316.1.tar.gz

COPY --chown=runner:runner entrypoint.sh /home/runner/entrypoint.sh
RUN chmod +x /home/runner/entrypoint.sh

ENTRYPOINT ["/home/runner/entrypoint.sh"]
