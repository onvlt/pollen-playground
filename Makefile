.PHONY: all clean
.DEFAULT_GOAL := all

all: index.html index.context index.pdf

index.html:
	raco pollen render index.html

index.context:
	raco pollen render index.context

index.pdf: index.context
	context index.context

clean:
	rm -rf index.{context,html,log,pdf,tuc,css} index-export compiled
