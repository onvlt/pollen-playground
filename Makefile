.PHONY: clean

index.context:
	raco pollen render index.context

index.pdf: index.context
	context index.context

clean:
	rm -f index.log index.tuc
