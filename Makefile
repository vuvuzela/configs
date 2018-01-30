CONFIGS := AddFriend Convo Dialing

all:

download: $(patsubst %,%.conf,$(CONFIGS))

%.conf: _PHONY
	alpenhorn-guardian-new-config -service $(patsubst %.conf,%,$@) > $@

clean:
	rm -f $(patsubst %,%.conf,$(CONFIGS))

.PHONY: _PHONY
