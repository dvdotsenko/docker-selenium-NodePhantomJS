FROM selenium/node-phantomjs

RUN sudo apt-get install \
		-y --no-install-recommends \
		curl

COPY wait_on_hub.sh /opt/bin/
RUN sudo chmod +x /opt/bin/wait_on_hub.sh

CMD ["/opt/bin/wait_on_hub.sh"]

