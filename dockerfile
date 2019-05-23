FROM ruby

WORKDIR /usr/src/certlintapp

RUN git clone https://github.com/awslabs/certlint.git
RUN gem install public_suffix 
RUN gem install simpleidn 
WORKDIR /usr/src/certlintapp/certlint/ext
RUN ruby extconf.rb
RUN make
COPY ./certlintserver.rb /usr/src/certlintapp/certlint/bin
WORKDIR /usr/src/certlintapp/certlint
EXPOSE 8000
ENTRYPOINT ["ruby","-I","lib:ext","bin/certlintserver.rb"]