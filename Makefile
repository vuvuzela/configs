SERVICES := AddFriend Convo Dialing

CONFS	 := $(patsubst %,%.conf,$(SERVICES))
SIGNS	 := $(patsubst %,%.conf_sign,$(SERVICES))
UPLOADS	 := $(patsubst %,%.conf_upload,$(SERVICES))

all: download

download: $(CONFS)
sign:	  $(SIGNS)
upload:   $(UPLOADS)

%.conf:
	alpenhorn-guardian-new-config -service $(patsubst %.conf,%,$@) > $@

%.conf_sign: %.conf
	alpenhorn-guardian-sign-config -config $< > $@
	mv $@ $<

%.conf_upload: %.conf
	alpenhorn-guardian-upload-config -config $<

clean:
	rm -f $(CONFS)
