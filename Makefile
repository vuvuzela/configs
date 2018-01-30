SERVICES := AddFriend Convo Dialing

CONFS	 := $(patsubst %,%.conf,$(SERVICES))
SIGNS	 := $(patsubst %,%.conf_sign,$(SERVICES))

all: download

download: $(CONFS)

sign: $(SIGNS)

%.conf:
	alpenhorn-guardian-new-config -service $(patsubst %.conf,%,$@) > $@

%.conf_sign: %.conf
	alpenhorn-guardian-sign-config -config $< > $@
	mv $@ $<

clean:
	rm -f $(CONFS)
