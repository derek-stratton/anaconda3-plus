FROM continuumio/anaconda3:latest

# Install Git LFS support
RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt update
RUN apt-get install git-lfs
RUN git lfs install

# Install build tools. Don't install runtime dependencies here if you only want to depend on Anaconda!
RUN pip install coverage flake8