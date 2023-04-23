.PHONY: clean
.DEFAULT_GOAL := all

%.html:
	raco pollen render $@

%.context:
	raco pollen render $@

%.pdf: %.context
	context $^
	open $@

clean:
	rm -rf *.{context,html,log,pdf,tuc,css} *-export compiled
