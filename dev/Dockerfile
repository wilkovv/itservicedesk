# Docker image for development over local ssh
# Expose ports 22 and 3000 and mount repo directory inside container

FROM debian:11.6
SHELL ["/bin/bash", "-c"]

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    zlib1g-dev \
    build-essential \
    libssl-dev \
    curl \
    git \
    vim \
    sudo \
    graphviz\
    openssh-server

RUN useradd -m -d /home/student -s /bin/bash -g root -G sudo -u 1000 student && echo "student:student" | chpasswd student
USER student
WORKDIR /home/student

RUN git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.11.2

RUN echo ". \"$HOME/.asdf/asdf.sh\"" >> $HOME/.bashrc && echo ". \"$HOME/.asdf/completions/asdf.bash\"" >> $HOME/.bashrc

ENV GEM_HOME="/home/student/.gem"
ENV GEM_PATH="/home/student/.gem"
ENV PATH="$GEM_PATH/bin:${PATH}"
ENV RUBY_MAJOR=3.0
ENV RUBY_VERSION=3.0.0

RUN PATH="$HOME/.asdf/shims:$HOME/.asdf/bin:/home/student/.gem/bin:${PATH}"\
 && source $HOME/.bashrc \
 && asdf plugin-add ruby && asdf install ruby 3.0.0 && asdf global ruby 3.0.0 \
 && asdf plugin add nodejs && asdf install nodejs 18.16.0 && asdf global nodejs 18.16.0 \
 && gem install rails

RUN echo "export PATH=\"${GEM_PATH}/bin:\${PATH}\"" >> $HOME/.bashrc \
 && echo "export GEM_HOME=${GEM_HOME}" >> $HOME/.bashrc \
 && echo "GEM_PATH=${GEM_PATH}" $HOME/.bashrc

ENTRYPOINT echo student | sudo -S service ssh start && sleep infinity

EXPOSE 3000
EXPOSE 22