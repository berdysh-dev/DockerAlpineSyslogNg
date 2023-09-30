FROM alpine:latest

RUN apk update

RUN apk add git vim bind-tools bash tcsh busybox busybox-extras build-base linux-headers alpine-sdk libtool autoconf
RUN apk add cmake bison
RUN apk add ivykis ivykis-dev glib glib-dev openssl openssl-dev flex flex-dev libnet libnet-dev

RUN mkdir -p /usr/local/src
RUN cd /usr/local/src ; wget https://github.com/syslog-ng/syslog-ng/archive/refs/heads/master.zip ; unzip master.zip ; rm master.zip ; 
RUN cd /usr/local/src ; wget https://github.com/Snaipe/Criterion/releases/download/v2.4.2/criterion-2.4.2-linux-x86_64.tar.xz ; 
RUN cd /usr/local/src ; xz -d criterion-2.4.2-linux-x86_64.tar.xz ; tar xf criterion-2.4.2-linux-x86_64.tar ; rm criterion-2.4.2-linux-x86_64.tar ;

RUN mkdir -p /usr/local/src/syslog-ng-master/tmp ; cd /usr/local/src/syslog-ng-master/tmp ; cmake .. ; make ; make install ; exit 0 ;
RUN cd /usr/local/src/criterion-2.4.2 ; cp lib/lib* /usr/lib ; cp -r include/criterion /usr/include ;
RUN cd /usr/local/src/syslog-ng-master/tmp ; make ; make install ; exit 0 ;

COPY entry.sh   /usr/local/bin/entry.sh

CMD ["sh","/usr/local/bin/entry.sh"]




