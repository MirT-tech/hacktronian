# Use Python 2.7 Slim
FROM python:2.7-slim

# Update Repos
RUN apt-get update \
  && apt-get install -qq -y --no-install-recommends build-essential sudo git wget curl nmap ruby \
  && apt-get clean

# Install Python dependecies
RUN pip install requests

# Install hacktronian
RUN git clone https://github.com/thehackingsage/hacktronian.git \
  && cd hacktronian \
  && chmod +x install.sh \
  && ./install.sh

# Hack to keep the container running
CMD python -c "import signal; signal.pause()"
