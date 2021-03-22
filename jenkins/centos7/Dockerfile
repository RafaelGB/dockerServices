FROM arm64v8/centos
RUN yum install -y openssh-server && \
     yum install -y passwd
 
RUN useradd remote_user && \
     echo "1234" | passwd remote_user --stdin && \
     mkdir /home/remote_user/.ssh && \
     chmod 700 /home/remote_user/.ssh
 
COPY credentials/remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown -R remote_user:remote_user /home/remote_user && \
         chmod -R 600 /home/remote_user/.ssh/authorized_keys

COPY AWS_S3_backup.sh /home/remote_user/scripts/AWS_S3_backup.sh

RUN ssh-keygen -A

EXPOSE 22
RUN rm -rf /run/nologin

RUN yum -y install mysql && \
	yum -y install epel-release
	
RUN yum -y install python3-pip && \
	pip3 install --upgrade pip && \
	pip3 install awscli

CMD /usr/sbin/sshd -D
